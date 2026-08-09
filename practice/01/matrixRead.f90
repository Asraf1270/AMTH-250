program matrixRead
    implicit none
    integer :: i, j
    real :: A(3,4)
    100 format (4f10.2)

    !Read the matrix
    open(unit=10, file='matrixWrite.txt', action='read')
    do i = 1, 3
        read(10, 100) (A(i, j), j = 1, 4)
    end do

    !write in *
    do i = 1, 3
        write(*, 100) (A(i, j), j = 1, 4)
    end do

end program matrixRead