PROGRAM newton_divided_difference
    IMPLICIT NONE
    INTEGER :: n, i, j, k
    REAL :: x_target, product_term, estimated_y
    REAL, ALLOCATABLE :: x(:), y(:), dd(:,:)

    ! Read input data
    OPEN(UNIT=10, FILE='in_A3Q3.txt', STATUS='OLD', ACTION='READ')
    READ(10, *) n, x_target

    ALLOCATE(x(n), y(n), dd(n, n))

    DO i = 1, n
        READ(10, *) x(i), y(i)
    END DO
    CLOSE(10)

    ! Initialize Divided Difference Matrix
    dd = 0.0
    DO i = 1, n
        dd(i, 1) = y(i)
    END DO

    ! Calculate Divided Differences
    DO j = 2, n
        DO i = 1, n - j + 1
            dd(i, j) = (dd(i+1, j-1) - dd(i, j-1)) / (x(i+j-1) - x(i))
        END DO
    END DO

    ! Evaluate Interpolating Polynomial at x_target
    estimated_y = dd(1, 1)
    product_term = 1.0

    DO k = 1, n - 1
        product_term = product_term * (x_target - x(k))
        estimated_y = estimated_y + product_term * dd(1, k + 1)
    END DO

    ! Write to output file
    OPEN(UNIT=20, FILE='out_a3q3.txt', STATUS='REPLACE', ACTION='WRITE')

    WRITE(20, '(A)') '========================================================================================'
    WRITE(20, '(A)') '                    NEWTON DIVIDED DIFFERENCE TABLE                                     '
    WRITE(20, '(A)') '========================================================================================'
    WRITE(20, '(A10, A12, 4(A11, I1))') 'x', 'f(x)', 'Order ', (j, j=1, n-1)
    WRITE(20, '(A)') '----------------------------------------------------------------------------------------'

    DO i = 1, n
        WRITE(20, '(F10.2, F12.4)', ADVANCE='NO') x(i), dd(i, 1)
        DO j = 2, n - i + 1
            WRITE(20, '(F12.6)', ADVANCE='NO') dd(i, j)
        END DO
        WRITE(20, *)
    END DO

    WRITE(20, '(A)') '========================================================================================'
    WRITE(20, *)
    WRITE(20, '(A, F8.2, A)') 'Target Time (x)                 : ', x_target, ' hours'
    WRITE(20, '(A, F12.4, A)') 'Estimated Exchange Rate f(3.0)  : ', estimated_y, ' Tk./USD'
    WRITE(20, '(A)') '========================================================================================'

    CLOSE(20)

    DEALLOCATE(x, y, dd)
END PROGRAM newton_divided_difference