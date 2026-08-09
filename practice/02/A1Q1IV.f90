program A1Q1IV
    implicit none
    INTEGER :: i, j, A(4, 4), B(4, 4)

    !input
    open(unit = 10, file = 'matrix_input.txt', action = 'read')
    do i = 1, 4
        read(10, *) (A(i, j), j = 1, 4)
    end do
    close(10)

    !open output file
    OPEN( unit = 20, file = 'outputA1Q1IV.txt', action = 'write')
    !define 
    B = A
    do i = 1, 4
        do j = 1, 4
            if (i ==1 .or. i == 4 .or. j ==1 .or. j == 4) then 
                B(i, j) = 0
            end if
        end do
    end do

    do i = 1, 4
        write(20, '(4(I4))') (B(i, j), j = 1, 4)
    end do
    close(20)
end program A1Q1IV