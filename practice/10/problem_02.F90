program problem_02
    implicit none
    integer, parameter :: nmax = 8
    integer :: n, j, k
    real(8) :: t0, h0, h
    real(8) :: R(0:nmax, 0:nmax)
    real(8) :: iexact, diff

    ! Read input data from file
    open(10, file='problem_02.txt', action='read', status='old')
    read(10, *) t0, h0, n
    close(10)

    ! Find exact value of q(t0)
    iexact = 20.0d0 * exp(-t0 / 2.0d0)
    ! Initialize the first column of the Romberg table
    do k = 1, n
        h = h0 / 2.0d0 ** k
        R(k,0) = (qval(t0 + h) - qval(t0 - h)) / (2.0d0 * h)
    end do 

    do k = 1, n
        do j = 1, k
            R(k,j) = R(k,j-1) + (R(k,j-1) - R(k-1,j-1)) / (4.0d0 ** j - 1.0d0)
        end do
    end do

    ! open output file
    open(20, file='problem_02_output.txt', action='write', status='replace')

    ! header for output file
    write(20, *) "Romberg Table:"
    write(20, '(A)', advance='no') 'h'
    do j = 1, n
        write(20, '(A13, I1, a1)', advance='no') 'O(h^',j, ')'
    end do
    write(20, *) ''

    ! Print the Romberg table
    do k = 1, n
        write(20,'(I3, 2X, 8F12.6)') k, (R(k,j), j=0,k)
    end do  
    write(20, *) ''

    ! Report the best estimate and convergence
    write(20, '(A, F12.6, A)') 'Best estimate of q''(t0): ', R(n,n), 'mA'
    write(20, '(A, F12.6, A)') 'Exact value of q''(t0): ', iexact, 'mA'
    diff = abs(R(n,n) - iexact)
    write(20, '(A, F12.6, A)') 'Difference: ', diff, 'mA'
    close(20)
contains
    function qval(x)
        implicit none
        real(8), intent(in) :: x
        real(8) :: qval
        qval = 40.0d0 * (1.0d0 - exp(-x / 2.0d0))
    end function qval
end program problem_02