program hanoi_vs_mersenne
    implicit none
    integer :: n, h_n, m_n
    logical :: all_equal
    integer, external :: hanoi

    open(unit=10, file='out_A4Q7.txt', status='replace', action='write')

    write(10, '(A)') '==========================================================='
    write(10, '(A)') ' COMPARISON OF TOWER OF HANOI (H_n) AND MERSENNE (M_n)'
    write(10, '(A)') '==========================================================='
    write(10, '(A)') '  n         H_n (Hanoi)      M_n (Mersenne)      H_n == M_n?'
    write(10, '(A)') '-----------------------------------------------------------'

    all_equal = .true.

    do n = 1, 10
        h_n = hanoi(n)
        m_n = (2**n) - 1

        if (h_n /= m_n) then
            all_equal = .false.
        end if

        write(10, '(I3, 10X, I6, 14X, I6, 14X, L1)') n, h_n, m_n, (h_n == m_n)
    end do

    write(10, '(A)') '==========================================================='
    if (all_equal) then
        write(10, '(A)') 'CONCLUSION: H_n = M_n for every n in [1, 10].'
        write(10, '(A)') 'The minimal number of moves to solve the Tower of Hanoi'
        write(10, '(A)') 'with n disks is always equal to the n-th Mersenne number.'
    else
        write(10, '(A)') 'CONCLUSION: The sequences are not equal.'
    end if
    write(10, '(A)') '==========================================================='

    close(10)
end program hanoi_vs_mersenne

! Recursive function to compute H_n
recursive function hanoi(n) result(h)
    implicit none
    integer, intent(in) :: n
    integer :: h

    if (n <= 1) then
        h = 1
    else
        h = 2 * hanoi(n - 1) + 1
    end if
end function hanoi