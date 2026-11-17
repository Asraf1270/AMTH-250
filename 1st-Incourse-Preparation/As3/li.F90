program pagrange
    implicit none
    integer, parameter :: n = 5
    integer :: i, j
    real(8) :: x(n), y(n), lag(n), L,appval, exatval, xt 
    x = (/0.0d0,0.5d0, 1.0d0, 1.5d0, 2.0d0 /)
    xt = 1.25
    do i = 1, n 
        y(i) = 0.3d0* x(i) * exp(0.15d0*x(i)**2)
    end do 
    appval = 0.0d0  
    do i = 1, n 
        L = 1.0d0
        do j = 1, n 
            if ( j /= i) then 
               L = L*(xt - x(j)) / (x(i) - x(j))
            end if 
        end do 
        appval = appval + L*y(i)
        lag(i) = L 
    end do
    exatval = 0.3d0* xt * exp(0.15d0*xt**2)
    print '(A, F10.2)', "Exact value = ", exatval
    print '(A, F10.2)', "Approx val  = ", appval
    do i = 1, n 
        WRITE(*, '(F6.4, A, I1, A)', ADVANCE='NO') lag(i), '*x^', i , '+'
    END DO
    WRITE(*,*) ""
    print '(A, F10.6)', "Error       = ", abs(appval - exatval)
end program pagrange