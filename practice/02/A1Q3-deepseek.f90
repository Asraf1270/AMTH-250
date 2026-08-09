program matrix_stats_simple
    implicit none
    real :: a(7,7)
    
    ! Generate random numbers
    call random_seed()
    call random_number(a)
    
    ! Display matrix
    print *, "7x7 Matrix:"
    write(*, '(7F10.6)') a
    
    ! Calculate and display statistics
    print *, "Mean = ", sum(a) / 49.0
    print *, "Max  = ", maxval(a)
    print *, "Min  = ", minval(a)
    
    ! Write to files
    open(10, file='a1q3_F.txt')
    write(10, '(7F15.10)') a
    write(10, *) "Mean=", sum(a)/49.0, " Max=", maxval(a), " Min=", minval(a)
    close(10)
    
    open(20, file='a1q3_E.txt')
    write(20, '(7E15.8)') a
    write(20, *) "Mean=", sum(a)/49.0, " Max=", maxval(a), " Min=", minval(a)
    close(20)
    
    open(30, file='a1q3_ES.txt')
    write(30, '(7ES15.7)') a
    write(30, *) "Mean=", sum(a)/49.0, " Max=", maxval(a), " Min=", minval(a)
    close(30)
    
    print *, "Files created: a1q3_F.txt, a1q3_E.txt, a1q3_ES.txt"
    
end program matrix_stats_simple