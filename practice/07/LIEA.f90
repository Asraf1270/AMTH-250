program lagrange
    implicit none
    integer :: n, i, j
    real :: x_target, interpolated_y, exact_y, abs_error, term_l
    real, allocatable :: x(:), y(:)
    open(unit = 40, file ='in_A3Q4.txt', action = 'read')
    read(40, *) n, x_target
    allocate(x(n), y(n))

    do i = 1, n
        read(40, *) x(i)
    end do
    close(40)
    do i = 1, n
        y(i) = 0.3 * x(i)*exp(0.15*x(i)**2)
    end do

    interpolated_y = 0.0
    do i= 1, n
        term_l = 1.0
        do j = 1, n
            if (j .ne. i) then
                term_l = term_l * (x_target - x(j)) / (x(i) - x(j))
            end if
        end do
        interpolated_y = interpolated_y + y(i) * term_l
    end do

    exact_y = 0.3 * x_target * exp(0.15 * x_target**2)

    abs_error = abs(exact_y - interpolated_y)

    open(unit = 41, file = 'out_A3Q4.txt', action = 'write')
    write(41, *) "-------------------------------------------------------------------------"
    write(41, *) "lagrance intepolation analysis"
    write(41, *) "-------------------------------------------------------------------------"
    write(41, *) "Point(i)           x(i)          f(x_i)                                  "
    write(41, *) "-------------------------------------------------------------------------"
    do i = 1, n
        write(41, '(i5, 10x, f8.4, 10x, f12.6)') i-1, x(i), y(i)
    end do
    write(41, *) ""
    write(41, *) "--------------------------------------------------------------------------"
    write(41, '(a, f12.6)') 'Target evaluation point(x)      :', x_target
    write(41, '(a, f12.6)') '(b) Interpolated value f(1.25)  :', interpolated_y
    write(41, '(a, f12.6)') '(c) Exact value f(1.25)         :', exact_y
    write(41, '(a, f12.6)') '(d) Absolute error              :', abs_error
    write(41, *) "--------------------------------------------------------------------------"
    close(41)

    deallocate(x, y)
    
end program lagrange