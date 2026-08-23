program FixedPoint
    implicit none
    real(8) :: p_prev, pn, error, tol
    integer :: iter

    p_prev = 0.5d0
    tol = 1.0d-4
    iter = 0

    open(unit = 40, file = 'outA2Q4.txt', action = 'write')

    write(40, '(A14, A16, A16, A20)') "Iteration NO.", "P_{n-1}", "P_n", "|P_{n-1} - P_n| / |P_n|"
    write(40, '(A80)')"-------------------------------------------------------------------------------------------"

    do
        iter = iter + 1

        pn = g(p_prev)

        error = abs(pn - p_prev) / abs(pn)

        write(40, '(I14, 2F16.8, F20.8)') iter, p_prev, pn, error

        if (error < tol) exit

        p_prev = pn
    end do

    write(40, *)""
    write(40,'(A, F10.6)') "Approximate root: ", pn

contains
    function g(x) result(temp)
        implicit none
        real(8) :: x, temp

        temp = 1.0d0 / (1.0d0 + x**2)
    end function g


end program FixedPoint