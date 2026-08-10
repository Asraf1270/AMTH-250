program matrix_operations
    implicit none

    integer, dimension(4, 4) :: A, B
    integer :: i, j

    open(unit=10, file='matrix_input.txt', status='old', action='read')
    do i = 1, 4
        read(10, *) (A(i, j), j = 1, 4)
    end do
    close(10)

    ! Open output file
    open(unit=20, file='output.txt', status='replace', action='write')

    !(i)
    write(20, '(A)') '(i) Matrix A:'
    do i = 1, 4
        write(20, '(4(I3, 1X))') (A(i, j), j = 1, 4)
    end do
    write(20, *)

    !(ii)

    write(20, '(A)') '(ii) Elements of even rows:'
    do i = 2, 4, 2
        write(20, '(4(I3, 1X))') (A(i, j), j = 1, 4)
    end do
    write(20, *)

    !(iii)

    write(20, '(A)') '(iii) Border elements with empty interior:'
    do i = 1, 4
        do j = 1, 4
            if (i == 1 .or. i == 4 .or. j == 1 .or. j == 4) then
                write(20, '(I3, 1X)', advance='no') A(i, j)
            else
                write(20, '(A4)', advance='no') '    '
            end if
        end do
        write(20, *) 
    end do
    write(20, *)

    !(iv)

    B = A

    do i = 1, 4
        do j = 1, 4
            if (i == 1 .or. i == 4 .or. j == 1 .or. j == 4) then
                B(i, j) = 0
            end if
        end do
    end do

    write(20, '(A)') '(iv) Matrix B (boundary replaced with 0):'
    do i = 1, 4
        write(20, '(4(I4))') (B(i, j), j = 1, 4)
    end do

    close(20)
    print *, 'Program finished successfully. Check output.txt'

end program matrix_operations