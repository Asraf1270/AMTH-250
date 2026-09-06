PROGRAM newton_backward_interpolation
    IMPLICIT NONE
    INTEGER :: n, i, j, k
    REAL :: x_target, h, p, term_prod, fact, estimated_y, temp_x, temp_y
    REAL, ALLOCATABLE :: x(:), y(:), diff(:,:)

    ! Open input file
    OPEN(UNIT=10, FILE='in_A3Q2.txt', STATUS='OLD', ACTION='READ')
    READ(10, *) n, x_target

    ALLOCATE(x(n), y(n), diff(n, n))

    DO i = 1, n
        READ(10, *) x(i), y(i)
    END DO
    CLOSE(10)

    ! Sort data in ascending order of x using Bubble Sort
    DO i = 1, n - 1
        DO j = 1, n - i
            IF (x(j) > x(j+1)) THEN
                temp_x = x(j)
                x(j) = x(j+1)
                x(j+1) = temp_x

                temp_y = y(j)
                y(j) = y(j+1)
                y(j+1) = temp_y
            END IF
        END DO
    END DO

    ! Step size and normalized parameter p from end point x(n)
    h = x(2) - x(1)
    p = (x_target - x(n)) / h

    ! Initialize difference table matrix
    diff = 0.00
    DO i = 1, n
        diff(i, 1) = y(i)
    END DO

    ! Calculate Backward Differences
    DO j = 2, n
        DO i = j, n
            diff(i, j) = diff(i, j-1) - diff(i-1, j-1)
        END DO
    END DO

    ! Calculate Newton's Backward Interpolation
    estimated_y = diff(n, 1)
    term_prod = 1.0
    fact = 1.0

    DO k = 1, n - 1
        term_prod = term_prod * (p + REAL(k - 1))
        fact = fact * REAL(k)
        estimated_y = estimated_y + (term_prod / fact) * diff(n, k + 1)
    END DO

    ! Open output file
    OPEN(UNIT=20, FILE='out_A3Q2.txt', STATUS='REPLACE', ACTION='WRITE')

    WRITE(20, '(A)') '========================================================================'
    WRITE(20, '(A)') '                NEWTON BACKWARD DIFFERENCE TABLE                        '
    WRITE(20, '(A)') '========================================================================'
    WRITE(20, '(A10, A12, 5(A10, I1))') 'x', 'y', ('del^', j, j=1, n-1)
    WRITE(20, '(A)') '------------------------------------------------------------------------'

    DO i = 1, n
        WRITE(20, '(F10.2, F12.2)', ADVANCE='NO') x(i), diff(i, 1)
        DO j = 2, i
            WRITE(20, '(F11.4)', ADVANCE='NO') diff(i, j)
        END DO
        WRITE(20, *)
    END DO

    WRITE(20, '(A)') '========================================================================'
    WRITE(20, *)
    WRITE(20, '(A, F8.2)') 'Target Period (x)              : ', x_target
    WRITE(20, '(A, F8.2)') 'Step Size (h)                  : ', h
    WRITE(20, '(A, F8.4)') 'Normalized Parameter (p)       : ', p
    WRITE(20, '(A, F12.2, A)') 'Estimated Maturity Value       : Tk. ', estimated_y
    WRITE(20, '(A)') '========================================================================'

    CLOSE(20)

    DEALLOCATE(x, y, diff)
END PROGRAM newton_backward_interpolation