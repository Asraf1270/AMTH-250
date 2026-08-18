program secant_method
    implicit none
    real(8) :: x0, x1, x2, f0, f1, diff, tol
    integer :: iter, max_iter

    ! Initializations
    x0 = 0.0d0
    x1 = 1.0d0
    tol = 1.0d-6
    max_iter = 50
    iter = 0

    !open file
    open(unit = 20, file = 'outsecandgemini.txt', action = 'write')
    write(20, '(A5, 6A12)') "Iter", "x_{n-1}", "x_n", "f(x_{n-1})", "f(x_n)", "x_{n+1}", "|x_{n+1}-x_n|"
    write(20, '(A80)') "--------------------------------------------------------------------------------"

    do
        iter = iter + 1
        f0 = f(x0)
        f1 = f(x1)

        ! Check to avoid division by zero
        if (abs(f1 - f0) < 1.0d-12) then
            write(20, *) "Error: Division by near zero."
            exit
        end if

        ! Secant formula iteration step
        x2 = x1 - f1 * (x1 - x0) / (f1 - f0)
        diff = abs(x2 - x1)

        write(20, '(I5, 6F12.6)') iter, x0, x1, f0, f1, x2, diff

        if (diff < tol .or. iter >= max_iter) exit

        ! Shift variables for next iteration
        x0 = x1
        x1 = x2
    end do

    write(20, *) ""
    write(20, '(A, F10.6)') "Approximate root (6 decimal places): ", x2

contains

    function f(x) result(res)
        real(8), intent(in) :: x
        real(8) :: res
        res = exp(-x) - x
    end function f

end program secant_method