program newton_forwarn_interpolation
    implicit none
    integer :: n, i, j, k
    real :: x_terget, h, p, term_prod, fact, estimated_y, temp_x, temp_y
    real, allocatable :: x(:), y(:), diff(:, :)

    !open input file
    open(unit = 10, file = 'in_A3Q1.txt', action = 'read', status = 'old')
    read(10, *) n, x_terget

    allocate(x(n), y(n), diff(n, n))

    !read data
    do i = 1, n
        read(10, *) x(i), y(i)
    end do
    close(10)

    ! sort data in ascending order of x using bubble sort
    do i = 1, n - 1
        do j = 1, n - i
            if (x(j) > x(j + 1)) then 
                temp_x = x(j)
                x(j) = x(j + 1)
                x (j + 1) = temp_x

                temp_y = y(j)
                y(j) = y(j + 1)
                y(j + 1) = temp_y
            end if
        end do
    end do

    ! step size and normalize parameter
    h = x(2) - x(1)
    p = (x_terget - x(1)) / h
    
    !open output file
    open(unit = 20,file = 'out_A3Q1.txt', action = 'write')
    write(20, *) " ----------------------------------------------------------------------------"
    write(20, '(a)') " Newton Forward Difference Table"
    write(20, *) "------------------------------------------------------------------------------"
    write(20, '(a10, a12, 5(a10, i1))') 'x', 'y', ('d^', j, j=1, n-1)
    write(20, *) "------------------------------------------------------------------------------"

    ! Initialize diff matrix
    diff = 0.0
    do i = 1, n
        diff(i, 1) = y(i)
    end do


    !calculate forward difference
    do j = 2, n
        write(20, '(f10.2, f12.2)', advance = 'no') x(i), diff(i, 1)
        do i = 1, n - j + 1
            diff(i, j) = diff(i + 1, j - 1) - diff(i, j-1)
            write(20, '(f11.4)', advance = 'no') diff(i, j)
        end do
        write(20, *) ''
    end do
    
    ! calculate newton intepolation
    estimated_y = diff(1, 1)
    term_prod = 1.0
    fact = 1.0

    do k = 1, n-1
        term_prod = term_prod * (p - (k - 1))
        fact = fact * k
        estimated_y = estimated_y + (term_prod / fact) * diff(1, k+1)
    end do

    WRITE(20, '(A)') '========================================================================'
    WRITE(20, *)
    WRITE(20, '(A, F8.2)') 'Target Year (x)                : ', x_terget
    WRITE(20, '(A, F8.2)') 'Step Size (h)                  : ', h
    WRITE(20, '(A, F8.4)') 'Normalized Parameter (p)       : ', p
    WRITE(20, '(A, F12.4, A)') 'Estimated GDP in 2007          : ', estimated_y, ' billion USD'
    WRITE(20, '(A)') '========================================================================'

    close(20)

    deallocate(x, y, diff)

end program newton_forwarn_interpolation