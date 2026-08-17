program Bisection
    implicit none
    real(8) :: a, b, p_n, p_prev, rel_error, tol
    integer :: iter

    ! Initial interval and tolerance setup
    a = 2.0
    b = 3.0
    tol = 1.0d-4
    iter = 0
    p_prev = 0.0

    ! Format
    10 format (A5, A12, A12, A12, A18)
    11 FORMAT (I8, 3F12.6, 10x, A)
    12 FORMAT (I8, 3F12.8, F18.6)
    13 FORMAT (A, F10.6)

    ! open file
    open(unit = 10, file = 'OutA2Q1.txt', action = 'write')

    write(10,10) "Iteration No.", "a", "b", "P_n", "|Pn - Pn-1|/|Pn|"
    write(10, '(A60)')"--------------------------------------------------------------------"

    !condition
    do 
        iter = iter + 1
        p_n = (a + b) / 2

        if (iter == 1) then
            write(10, 11) iter, a, b, p_n, "-"
        else
            rel_error = abs(p_n - p_prev)/ abs(p_n)
            write(10, 12) iter, a, b, p_n, rel_error

            if (rel_error < tol) exit
        end if

        ! Update interval boundaries
        if (f(a) * f(p_n) < 0.0d0) then 
            b = p_n
        else
            a = p_n
        end if

        p_prev = p_n
    end do

    write(10,*) ""
    write(10, 13) "Approximate root: ", p_n

    close(10)
    print*, "Successfully Write the full data of this math ........"

contains

    function f(x) result(res)
        real(8), intent(in) :: x
        real (8) :: res
        res = x**3 - 4.0d0*x - 9.0d0
    end function f
end program Bisection