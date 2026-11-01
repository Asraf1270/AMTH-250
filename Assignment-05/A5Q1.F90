program a5q1
    implicit none
    real(8) :: t0, h, vexact
    real(8) :: v1, v2, v3, v4
    real(8) :: xm0, xm1, xm2
    real(8) :: xp1, xp2

    ! Read file
    open(unit=10, file='in_A5Q1.txt', status='old', action='read')
    read(10,*) t0
    close(10)

    !-----------------------------------------------
    ! Calculate exact value of x(t0)
    !-----------------------------------------------
    vexact = -2.0d0 * exp(-t0 / 4.0d0) * cos(2.0d0 * t0) - 16.0d0 * exp(-t0 / 4.0d0) * sin(2.0d0 * t0)

    ! -----------------------------------------------
    ! (i) Theree-point midpoint (h = 0.25)
    ! -----------------------------------------------
    h = 0.25d0
    xm1 = xfunc(t0 + h)
    xm2 = xfunc(t0 - h)
    v1 = (xm1 - xm2) / (2.0d0 * h)

    ! -----------------------------------------------
    ! (ii) Theree-point endpoint (h = 0.25)
    ! forward using t0, t0 + h, t0 + 2h
    ! -----------------------------------------------
    h = 0.25d0
    xm0 = xfunc(t0)
    xm1 = xfunc(t0 + h)
    xm2 = xfunc(t0 + 2.0d0 * h)
    v2 = (-3.0d0 * xm0 + 4.0d0 * xm1 - xm2) / (2.0d0 * h)

    ! -----------------------------------------------
    ! (iii) Five-point midpoint (h = 0.50)
    ! -----------------------------------------------
    h = 0.50d0
    xm1 = xfunc(t0 + h)
    xm2 = xfunc(t0 - h)
    xp1 = xfunc(t0 + 2.0d0 * h)
    xp2 = xfunc(t0 - 2.0d0 * h)
    v3 = (xp2 - 8.0d0 * xm2 + 8.0d0 * xm1 - xp1) / (12.0d0 * h)

    ! -----------------------------------------------
    ! (iv) Five-point endpoint (h = 0.50)
    ! forward using t0, t0 + h, t0 + 2h, t0 + 3h, t0 + 4h
    ! -----------------------------------------------
    h = 0.50d0
    xm0 = xfunc(t0)
    xm1 = xfunc(t0 + h)
    xm2 = xfunc(t0 + 2.0d0 * h)
    xp1 = xfunc(t0 + 3.0d0 * h)
    xp2 = xfunc(t0 + 4.0d0 * h)
    v4 = (-25.0d0 * xm0 + 48.0d0 * xm1 - 36.0d0 * xm2 + 16.0d0 * xp1 - 3.0d0 * xp2) / (12.0d0 * h)

    ! -----------------------------------------------
    ! Print results
    ! -----------------------------------------------

    open(unit=20, file='out_A5Q1.txt', status='replace', action='write')
    write(20,*) 'Exact value of x(t0) = ', vexact
    write(20, *) ''
    write(20, '(A)') "         Method           |   h    |    Approx. value    | Exact value |   Error"
    write(20, '(A,ES12.5,A,ES12.5,A,ES12.5)') '(i) Three-point midpoint  | 0.25   | ', v1, ' | ', vexact, ' | ', abs(v1 - vexact)
    write(20, '(A,ES12.5,A,ES12.5,A,ES12.5)') '(ii) Three-point endpoint | 0.25   | ', v2, ' | ', vexact, ' | ', abs(v2 - vexact)
    write(20, '(A,ES12.5,A,ES12.5,A,ES12.5)') '(iii) Five-point midpoint | 0.50   | ', v3, ' | ', vexact, ' | ', abs(v3 - vexact)
    write(20, '(A,ES12.5,A,ES12.5,A,ES12.5)') '(iv) Five-point endpoint  | 0.50   | ', v4, ' | ', vexact, ' | ', abs(v4 - vexact)
    close(20)

contains
    function xfunc(t) result(x)
        real(8), intent(in) :: t
        real(8) :: x

        x = 8.0d0 * exp(-t / 4.0d0) * cos(2.0d0 * t)

    end function xfunc
end program a5q1