program NDDP
    implicit none
    integer :: n, i, j, k
    real :: x_target, term_prod, estimated_y
    real, allocatable :: x(:), y(:), dd(:, :)

    open(unit = 30, file ='in_A3Q3.txt', action = 'read')
    read(30, *) n, x_target

    allocate(x(n), y(n), dd(n, n))

    do i = 1, n
        read(30, *) x(i), y(i)
    end do
    close(30)

    ! initial matrix
    dd = 0.0
    do i = 1, n
        dd(i, 1) = y(i)
    end do

    do j = 2, n
        do i = 1, n-j+1
            dd(i, j) = (dd(i + 1, j - 1) - dd(i, j-1)) / (x(i + j -1) - x(i))
        end do
    end do

    estimated_y = dd(1, 1)
    term_prod = 1.0

    do k = 1, n-1
        term_prod = term_prod*(x_target - x(k))
        estimated_y = estimated_y + term_prod * dd(1, k+1)
    end do

    !write the data
    open(unit = 31, file = 'out_A3Q3.txt', action = 'write')
    write(31, *) "-------------------------------------------------------------------------------"
    write(31, '(A10, A12, 4(A11))') 'x', 'f(x)', 'Order1', 'order 2', 'order 3', 'order 4'
    write(31, *) "-------------------------------------------------------------------------------"

    do i = 1, n
        write(31, '(f10.2, f12.4)', ADVANCE='NO') x(i), dd(i, 1)
        do j = 2, n-i+1
            write(31, '(f12.6)', ADVANCE='NO') dd(i, j)
        end do
        write(31, *) ""
    end do
    write(31, *) "--------------------------------------------------------------------------------"
    write(31, '(a, f12.4)') "Target time (x)   :", x_target
    write(31, '(a, f12.4)') "Estimated exchange rate f(3.0)", estimated_y
    write(31, *) "--------------------------------------------------------------------------------"
    close(31)
    deallocate(x, y, dd)
end program NDDP