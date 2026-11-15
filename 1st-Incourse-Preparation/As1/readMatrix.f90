program read_matrix
    implicit none
    integer :: i, j 
    integer :: A(4,4), B(4, 4)

    open(unit = 10, file = 'in_rm.txt', action='read')
    do i = 1, 4
        read(10, *) (A(i, j), j = 1, 4)
    end do

    ! write the matrix
    print*, 'Write the matrix A'
    do i = 1, 4
        write(*, *) (A(i, j), j = 1, 4)
    end do

    print *, 'write Even Rows'
    do i = 2, 4, 2
        write(*, *) (A(i, j), j = 1, 4)
    end do

    print*, "Write R1, R4, C1, C4"
    do i = 1, 4
        do j = 1, 4
        if (i == 1 .or. i == 4 .or. j == 1 .or. j == 4) then
            write(*, '(i3, 1x)', advance='no') A(i, j)
        else
            write(*, '(a)', advance='no') '    '
        end if
        
    end do
    write(*,*) ''
    end do
    
    do i = 1, 4
        do j = 1, 4
            if (i == 1 .or. i == 4 .or. j == 1 .or. j == 4) then
                B(i, j) = 0
            else
                B(i, j) = A(i, j)
            end if
        end do 
    end do
    do i = 1, 4
        write(*, *) (B(i, j), j = 1, 4)
    end do
end program read_matrix