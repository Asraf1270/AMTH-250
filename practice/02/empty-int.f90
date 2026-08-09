program matrix

    implicit none

    integer :: i, j, A(4, 4)

    !input
    OPEN(unit = 10, file = 'matrix_input.txt', action = 'read')
    do i = 1, 4
        read(10, *) (A(i, j), j = 1, 4)
    end do
    close(10)

    !output in terminal
    ! do i = 1, 4
    !     write(*, *) (A(i, j), j = 1, 4)
    ! end do

    !output 1(iii)
    3 format(4i4)
    write(*, *) "1st row, 1st column, 4th row and 4th column"
    write(*, 3) (A(1, j), j= 1, 4)
    write(*, 3) (A(i, 1), i = 1, 4)
    write(*, 3) (A(4, j), j = 1, 4)
    write(*, 3) (A(i, 4), i = 1, 4)
     

    open(unit = 20 , file = 'outputA1Q3,txt')
    write(20, *)"(iii)"
    do i = 1, 4
        do j = 1, 4 
            if (i == 1 .or. i == 4 .or. j ==1 .or. j == 4) then 
                write(20, '(i4)', advance = 'no') A(i, j)
            else
                write(20, '(A4)', advance = 'no') '    '
            end if
        end do
        Write(20, *)
    end do
    write(20, *)
end program matrix