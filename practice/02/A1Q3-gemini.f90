program random_matrix
    implicit none

    ! Double precision is used to maintain precision for 10 decimal places
    integer, parameter :: dp = kind(1.0d0)
    real(kind=dp), dimension(7, 7) :: A
    real(kind=dp) :: mean_val, max_val, min_val
    integer :: i, j

    ! Initialize the pseudo-random number generator
    call random_seed()

    ! Generate a 7x7 matrix of random real numbers in [0.0, 1.0)
    call random_number(A)

    ! -------------------------------------------------------------
    ! (i) Store using F descriptor (10 decimal places)
    ! F15.10 gives width 15 with 10 digits after decimal
    ! -------------------------------------------------------------
    open(unit=10, file='a1q3_F.txt', status='replace', action='write')
    do i = 1, 7
        write(10, '(7(F15.10, 2X))') (A(i, j), j = 1, 7)
    end do
    close(10)

    ! -------------------------------------------------------------
    ! (ii) Store using E descriptor (8 decimal places)
    ! E16.8 standard exponential notation
    ! -------------------------------------------------------------
    open(unit=20, file='a1q3_E.txt', status='replace', action='write')
    do i = 1, 7
        write(20, '(7(E16.8, 2X))') (A(i, j), j = 1, 7)
    end do
    close(20)

    ! -------------------------------------------------------------
    ! (iii) Store using ES descriptor (7 decimal places)
    ! ES15.7 scientific notation (1 digit before decimal)
    ! -------------------------------------------------------------
    open(unit=30, file='a1q3_ES.txt', status='replace', action='write')
    do i = 1, 7
        write(30, '(7(ES15.7, 2X))') (A(i, j), j = 1, 7)
    end do
    close(30)

    ! -------------------------------------------------------------
    ! Calculate Mean, Maximum, and Minimum using F90 intrinsic functions
    ! -------------------------------------------------------------
    mean_val = sum(A) / 49.0_dp
    max_val  = maxval(A)
    min_val  = minval(A)

    ! Display statistics on screen
    print '(A, F12.8)', 'Mean:    ', mean_val
    print '(A, F12.8)', 'Maximum: ', max_val
    print '(A, F12.8)', 'Minimum: ', min_val

    print *, 'Files created: a1q3_F.txt, a1q3_E.txt, a1q3_ES.txt'

end program random_matrix