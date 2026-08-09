program A1Q3
    implicit none
    REAL :: matrix(7, 7), min, max, mean

    !call and create random matrix
    call random_seed()
    call random_number(matrix)

    ! define mean max and min
    mean = sum(matrix)/ 49.0
    max = maxval(matrix)
    min = minval(matrix)

    !create and open file 
    open(unit = 31, file = 'a1q3_F.txt', action = 'write')
    open(unit = 32, file = 'a1q3_E.txt', action = 'write')
    open(unit = 33, file = 'a1q3_ES.txt', action = 'write')

    !define format
    31 format(7F15.10)
    32 format(7E15.8)
    33 format(7ES15.7)
    !(i)
    write(31, 31) matrix
    write(31, *) "Mean = ", mean, " Max value = ", max , " Min value = ", min
    close(31)

    !(ii)
    write(32, 32) matrix
    write(32, *) "Mean = ", mean, " Max value = ", max , " Min value = ", min
    close(32)

    !(iii)
    write(33, 33) matrix
    write(33, *) "Mean = ", mean, " Max value = ", max , " Min value = ", min
    close(33)
    
end program A1Q3