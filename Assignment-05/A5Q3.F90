program problem3
    implicit none
    integer, parameter :: n = 6
    real(8) :: s(0:n)
    real(8) :: h, v0, a0, v6, a6
    integer :: i 

    ! open input file and read data
    open(unit = 10, file='in_A5Q3.txt', action='read', status='old')
    read(10, *) h
    do i = 1, n
        read(10, *) s(i)
    end do 
    close(10)

    ! using five point forward
    v0 = (-25.0d0*s(1) + 48.0d0*s(2) - 36.0d0*s(3) +16.0d0*s(4) -3.0d0*s(5)) / (12.0d0*h)
    a0 = (35.0d0*s(1) - 104.0d0*s(2) + 114.0d0*s(3) - 56.0d0*s(4) + 11.0d0*s(5)) / (12.0d0*h*h)

    ! using five point backward
    v6 = (25.0d0*s(6) - 48.0d0*s(5) + 36.0d0*s(4) -16.0d0*s(3) +3.0d0*s(2)) / (12.0d0*h)
    a6 = (35.0d0*s(6) - 104.0d0*s(5) + 114.0d0*s(4) - 56.0d0*s(3) + 11.0d0*s(2)) / (12.0d0*h*h)

    ! open output file and write results
    open(unit = 20, file='out_A5Q3.txt', action='write', status='replace')
    write(20, '(A, F12.6, A)') 'Velocity at t0: ', v0, ' m/s'
    write(20, '(A, F12.6, A)') 'Acceleration at t0: ', a0, ' m/s^2'
    write(20, '(A, F12.6, A)') 'Velocity at t6: ', v6, ' m/s' 
    write(20, '(A, F12.6, A)') 'Acceleration at t6: ', a6, ' m/s^2'
    close(20)
end program problem3