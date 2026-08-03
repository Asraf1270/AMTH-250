program matrixWrite
    implicit none
    integer :: i, j
    real :: A(3,4)
    100 format (4f10.2)

    !make matrix
    do i = 1, 3
        do j = 1, 4
            A(i, j) = i * 10.0 + j
        end do
    end do

    !write in matrixWrite.txt
    open(unit = 10, file = "matrixWrite.txt", action = 'write')
    do i = 1, 3
        write(10,100) (A(i, j), j = 1, 4)
    end do


    !write in *
    do i = 1, 3
        write(*,100) (A(i, j), j = 1, 4)
    end do
end program matrixWrite