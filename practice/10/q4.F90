program problem4
    implicit none
    integer, parameter :: n = 30
    real(8) :: a, b, h, texact, qexact
    real(8) :: qt, qs13, qs38, qw
    real(8) :: sum_odd, sum_even, sum3, sum6, block
    integer :: i

    ! ---- Read input ----
    open(unit=10, file='in_a5q4.txt', status='old')
    read(10,*) a, b
    close(10)

    h = (b - a) / dble(n)

    ! ---- Exact value ----
    qexact = 60.0d0 * log(1.0d0 + b*b) - 60.0d0 * log(1.0d0 + a*a)
    ! (for a=0 this is 60*ln(1+b^2))

    ! ================= (a) Composite Trapezoidal =================
    qt = f(a) + f(b)
    do i = 1, n-1
        qt = qt + 2.0d0 * f(a + i*h)
    end do
    qt = qt * h / 2.0d0

    ! ================= (b) Composite Simpson's 1/3 ===============
    sum_odd  = 0.0d0
    sum_even = 0.0d0
    do i = 1, n-1
        if (mod(i,2) == 1) then
            sum_odd  = sum_odd  + f(a + i*h)
        else
            sum_even = sum_even + f(a + i*h)
        end if
    end do
    qs13 = h/3.0d0 * (f(a) + 4.0d0*sum_odd + 2.0d0*sum_even + f(b))

    ! ================= (c) Composite Simpson's 3/8 ===============
    sum3 = 0.0d0   ! interior points not multiple of 3  -> coefficient 3
    sum6 = 0.0d0   ! interior points multiple of 3      -> coefficient 2
    do i = 1, n-1
        if (mod(i,3) == 0) then
            sum6 = sum6 + f(a + i*h)
        else
            sum3 = sum3 + f(a + i*h)
        end if
    end do
    qs38 = 3.0d0*h/8.0d0 * (f(a) + 3.0d0*sum3 + 2.0d0*sum6 + f(b))

    ! ================= (d) Composite Weddle's Rule ===============
    qw = 0.0d0
    do i = 0, n-6, 6
        block = f(a+i*h) + 5.0d0*f(a+(i+1)*h) + f(a+(i+2)*h) &
              + 6.0d0*f(a+(i+3)*h) + f(a+(i+4)*h) &
              + 5.0d0*f(a+(i+5)*h) + f(a+(i+6)*h)
        qw = qw + block
    end do
    qw = qw * 3.0d0*h/10.0d0

    ! ---- Output ----
    open(unit=20, file='out_a5q4.txt', status='replace')
    write(20,'(A)') ' Problem 4: Total heat transfer Q = int_0^2.4 120t/(1+t^2) dt'
    write(20,'(A,I4,A,F8.4)') ' n = ', n, '   h = ', h
    write(20,'(A,F16.8,A)') ' Exact Q = ', qexact, ' J'
    write(20,'(A)') ''
    write(20,'(A)') ' Method                  Approximation        Abs Error      % Error'
    write(20,'(A)') ' ------------------------------------------------------------------------'
    call report(' (a) Trapezoidal       ', qt,   qexact, 20)
    call report(' (b) Simpson 1/3       ', qs13, qexact, 20)
    call report(' (c) Simpson 3/8       ', qs38, qexact, 20)
    call report(' (d) Weddle            ', qw,   qexact, 20)
    close(20)

    print *, 'Done. See out_a5q4.txt'

contains

    subroutine report(name, q, qe, u)
        character(len=*), intent(in) :: name
        real(8), intent(in) :: q, qe
        integer, intent(in) :: u
        real(8) :: ae, pe
        ae = abs(q - qe)
        pe = 0.0d0
        if (abs(qe) > 0.0d0) pe = ae/abs(qe)*100.0d0
        write(u,'(A,F18.8,F16.8,F12.6)') name, q, ae, pe
    end subroutine report

    function f(t)
        implicit none
        real(8), intent(in) :: t
        real(8) :: f
        f = 120.0d0*t / (1.0d0 + t*t)
    end function f

end program problem4