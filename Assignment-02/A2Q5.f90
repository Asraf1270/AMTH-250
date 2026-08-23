program Newton
    implicit none
    
    call run_newton(0.0d0)
    call run_newton(-1.0d0)
    call run_newton(2.0d0)
    call run_newton(2.5d0)



contains
    subroutine run_newton(x0)
        implicit none

        real(8) :: x0
        real(8) :: p_prev, pn, error, tol
        integer :: iter

        tol = 1.0d-5
        p_prev = x0
        iter = 0

        open(unit = 50, file = 'outA2Q5.txt')

        write(50,*) ""
        write(50, '(a, f6.2)') "Table for initial guess x0 = ", x0
        write(50, '(a14, a16, a16, a20)') "Iteration no", "P_{n-1}", "P_n", "|P_n - P_{n-1}|/|P_n|"
        write(50, *)"-------------------------------------------------------------------------------------------------"

        do
            iter = iter + 1

            pn = p_prev - f(p_prev) / df(p_prev)

            error = abs(pn - p_prev) / abs(pn)

            write(50, '(i14, 2f16.8, f20.8)') iter, p_prev, pn, error

            if (error < tol) exit

            p_prev = pn
        end do
        write(50, '(a, f10.5)') " Approximate root: ", pn
    end subroutine run_newton

    function f(x) result(temp)
        implicit none
        real(8) :: x, temp

        temp = exp(x) - 3.0d0*x
    end function f

    function df(x) result(temp1)
        implicit none
        real(8) :: x, temp1

        temp1 = exp(x) - 3.0d0
    end function df

end program Newton