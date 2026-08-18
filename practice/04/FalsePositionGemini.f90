program false_position
    implicit none
    real(8) :: a, b, P_n, P_prev, diff, tol
    integer :: iter

    ! Initializations
    a = 1.0d0
    b = 2.0d0
    tol = 1.0d-5
    iter = 0
    P_prev = 0.0d0

    write(*, '(A14, A12, A12, A12, A16)') "Iteration NO.", "a", "b", "P_n", "|P_n - P_{n-1}|"
    write(*, '(A66)') "------------------------------------------------------------------"

    do
        iter = iter + 1
        
        ! Regula Falsi formula
        P_n = (a * f(b) - b * f(a)) / (f(b) - f(a))

        if (iter == 1) then
            write(*, '(I14, 3F12.6, 8X, A)') iter, a, b, P_n, "-"
        else
            diff = abs(P_n - P_prev)
            write(*, '(I14, 3F12.6, F16.6)') iter, a, b, P_n, diff
            
            if (diff < tol) exit
        end if

        ! Update interval bounds
        if (f(a) * f(P_n) < 0.0d0) then
            b = P_n
        else
            a = P_n
        end if

        P_prev = P_n
    end do

    write(*, *) ""
    write(*, '(A, F10.6)') "Approximate solution: ", P_n

contains

    function f(x) result(res)
        real(8), intent(in) :: x
        real(8) :: res
        res = log(x) + x**2 - 3.0d0
    end function f

end program false_position