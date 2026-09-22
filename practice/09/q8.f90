program rumor_spread
    implicit none
    integer :: n
    real :: N_pop, k_rate, I_0, I_n, percentage
    real, external :: rumor

    ! Model parameters
    N_pop = 1000.0
    k_rate = 0.3
    I_0 = 5.0

    open(unit=10, file='out4q8.txt', status='replace', action='write')

    write(10, '(A)') '==========================================================='
    write(10, '(A)') '         EPIDEMIOLOGICAL MODEL: SPREAD OF A RUMOR'
    write(10, '(A)') '==========================================================='
    write(10, '(A)') '  Day (n)     Informed People (I_n)     Percentage (%)'
    write(10, '(A)') '-----------------------------------------------------------'

    do n = 1, 20
        I_n = rumor(n, N_pop, k_rate, I_0)
        percentage = (I_n / N_pop) * 100.0

        write(10, '(I5, 14X, F10.2, 14X, F8.2, A)') n, I_n, percentage, '%'
    end do

    write(10, '(A)') '==========================================================='
    close(10)
end program rumor_spread

! Recursive function to compute I_n
recursive function rumor(n, N_pop, k_rate, I_0) result(val)
    implicit none
    integer, intent(in) :: n
    real, intent(in)    :: N_pop, k_rate, I_0
    real                :: val, prev

    if (n == 0) then
        val = I_0
    else
        prev = rumor(n - 1, N_pop, k_rate, I_0)
        val = prev + (k_rate * prev * (N_pop - prev)) / N_pop
    end if
end function rumor