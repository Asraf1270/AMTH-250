program matrix
    implicit none
    integer :: i, j
    real :: A(3, 4), B(3, 4)

    ! Initialize matrix A
    do i = 1, 3
        do j = 1, 4
            A(i, j) = i * 10.0 + j
        end do
    end do

    !First write matrix in *
    write(*,*) "Matrix A:"
    do i = 1, 3
        write(*, '(4F6.1)') (A(i, j), j = 1, 4)
    end do
end program matrix