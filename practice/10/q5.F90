program problem5
    implicit none
    integer, parameter :: nmax = 10
    real(8), parameter :: pi = 3.14159265358979323846d0
    real(8) :: a, b, eexact, tol
    real(8) :: R(0:nmax,0:nmax)
    real(8) :: h, sumf, diff
    integer :: k, j, n, i

    ! ---- Read input ----
    tol = 1.0d-6

    a = 0.0d0
    b = pi/4.0d0

    ! ---- Exact value ----
    eexact = sqrt(2.0d0) * (pi*pi/32.0d0 + pi/4.0d0 - 1.0d0)

    ! ---- First trapezoidal estimate (k=0) ----
    R(0,0) = (b-a)/2.0d0 * (f(a) + f(b))

    ! ---- Build table, stop when diagonal converges ----
    n = nmax
    do k = 1, nmax
        h = (b-a) / 2.0d0**k
        ! sum of f at new (odd) points
        sumf = 0.0d0
        do i = 1, 2**(k-1)
            sumf = sumf + f(a + dble(2*i-1)*h)
        end do
        R(k,0) = 0.5d0*R(k-1,0) + h*sumf

        ! Richardson extrapolation for this row
        do j = 1, k
            R(k,j) = R(k,j-1) + (R(k,j-1) - R(k-1,j-1)) &
                     / (4.0d0**j - 1.0d0)
        end do

        ! convergence check on diagonal
        diff = abs(R(k,k) - R(k-1,k-1))
        if (diff < tol) then
            n = k
            exit
        end if
    end do

    ! ---- Output ----
    open(unit=20, file='out_a5q5.txt', status='replace')
    write(20,'(A)') ' Problem 5: Romberg integration of E = int_0^{pi/4} t^2 cos(t) dt'
    write(20,'(A,F16.10,A)') ' Exact E = ', eexact, ' J'
    write(20,'(A,ES10.2)') ' Tolerance = ', tol
    write(20,'(A)') ''
    write(20,'(A)') ' Romberg table R(k,j):  rows = k (h halvings), cols = j (extrapolation)'
    write(20,'(A)') ''

    ! header
    write(20,'(A8)', advance='no') ' k '
    do j = 0, n
        write(20,'(A16)', advance='no') ' j='//char(48+j)
    end do
    write(20,*)

    do k = 0, n
        write(20,'(I4,4X)', advance='no') k
        do j = 0, k
            write(20,'(F16.10)', advance='no') R(k,j)
        end do
        write(20,*)
    end do

    write(20,'(A)') ''
    write(20,'(A,I3,A)') ' Converged at k = ', n, ' (diagonal)'
    write(20,'(A,F16.10,A)') ' Best estimate       = ', R(n,n), ' J'
    write(20,'(A,F16.10,A)') ' Absolute error      = ', abs(R(n,n)-eexact), ' J'
    write(20,'(A,F16.10,A)') ' Value to 5 decimals = ', &
        anint(R(n,n)*1.0d5)/1.0d5, ' J'
    close(20)

    print *, 'Done. See out_a5q5.txt'

contains

    real(8) function f(t)
        real(8), intent(in) :: t
        f = t*t*cos(t)
    end function f

end program problem5