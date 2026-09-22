program recurrence_comparison
    implicit none
    integer :: n
    real(8), dimension(0:50) :: a
    real(8) :: exact_val, diff

    ! Base cases
    a(0) = 1.0_8
    a(1) = 5.0_8

    ! Compute recurrence relation values sequentially up to n = 50
    do n = 2, 50
        a(n) = 2.0_8 * a(n-1) - a(n-2) + 3.0_8
    end do

    open(unit=10, file='out4q10.txt', status='replace', action='write')

    write(10, '(A)') '==============================================================================='
    write(10, '(A)') '     RECURRENCE RELATION VS EXACT SOLUTION COMPARISON (n = 1 TO 50)'
    write(10, '(A)') '==============================================================================='
    write(10, '(A)') '  n       Recurrence a_n          Exact Formula a_n        Absolute Difference'
    write(10, '(A)') '-------------------------------------------------------------------------------'

    do n = 1, 50
        ! Exact formula: a_n = 1.5*n^2 + 2.5*n + 1
        exact_val = 1.5_8 * (real(n, 8)**2) + 2.5_8 * real(n, 8) + 1.0_8
        diff = abs(a(n) - exact_val)

        write(10, '(I3, 8X, F12.2, 12X, F12.2, 12X, E12.4)') n, a(n), exact_val, diff
    end do

    write(10, '(A)') '==============================================================================='
    write(10, '(A)') 'CONCLUSION: The iterative recurrence values match the analytical'
    write(10, '(A)') 'formula exactly for all n from 1 to 50.'
    write(10, '(A)') '==============================================================================='

    close(10)
end program recurrence_comparison