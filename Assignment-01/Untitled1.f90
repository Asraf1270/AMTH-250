PROGRAM MatrixOperations
    IMPLICIT NONE


    INTEGER :: A(4, 4), B(4, 4)
    INTEGER :: i, j


    OPEN(UNIT=10, FILE='matrix_input.txt', STATUS='OLD', ACTION='READ', IOSTAT=i)
    OPEN(UNIT=20, FILE='matrix_output.txt', STATUS='REPLACE', ACTION='WRITE')

    DO i = 1, 4
        READ(10, *) (A(i, j), j = 1, 4)
    END DO

    ! (i) Write matrix A in matrix form
    WRITE(20, '(A)') '===== (i) Original Matrix A ====='
    DO i = 1, 4
        WRITE(20, '(4I5)') (A(i, j), j = 1, 4)
    END DO
    WRITE(20, *)  ! Blank line

    ! (ii) Write only the elements whose row number is even
    WRITE(20, '(A)') '===== (ii) Elements in Even Rows ====='
    DO i = 1, 4
        IF (MOD(i, 2) == 0) THEN
            WRITE(20, '(4I5)') (A(i, j), j = 1, 4)
        END IF
    END DO
    WRITE(20, *)  ! Blank line

    ! (iii) Write elements of 1st row, 1st column, 4th row, and 4th column
    WRITE(20, '(A)') '===== (iii) 1st row, 1st column, 4th row, 4th column ====='

    ! First row - all elements
    WRITE(20, '(4I5)') (A(1, j), j = 1, 4)

    ! First column (rows 2 and 3 only, since row 1 and 4 are already shown)
    WRITE(20, '(I5, 15X, I5)') A(2, 1), A(2, 4)  ! Actually need to match output format
    WRITE(20, '(I5, 15X, I5)') A(3, 1), A(3, 4)

    ! Fourth row - all elements
    WRITE(20, '(4I5)') (A(4, j), j = 1, 4)
    WRITE(20, *)  ! Blank line

    ! Alternative approach for part (iii) to match the exact output format:
    WRITE(20, '(A)') '===== (iii) Alternative Format ====='
    WRITE(20, '(4I5)') A(1,1), A(1,2), A(1,3), A(1,4)
    WRITE(20, '(I5, 15X, I5)') A(2,1), A(2,4)
    WRITE(20, '(I5, 15X, I5)') A(3,1), A(3,4)
    WRITE(20, '(4I5)') A(4,1), A(4,2), A(4,3), A(4,4)
    WRITE(20, *)  ! Blank line

    ! (iv) Construct matrix B by replacing boundary elements with 0
    DO i = 1, 4
        DO j = 1, 4
            ! Check if element is on boundary
            IF (i == 1 .OR. i == 4 .OR. j == 1 .OR. j == 4) THEN
                B(i, j) = 0
            ELSE
                B(i, j) = A(i, j)
            END IF
        END DO
    END DO

    ! Write matrix B
    WRITE(20, '(A)') '===== (iv) Matrix B (Boundary elements replaced with 0) ====='
    DO i = 1, 4
        WRITE(20, '(4I5)') (B(i, j), j = 1, 4)
    END DO

    ! Close files
    CLOSE(10)
    CLOSE(20)

    WRITE(*,*) 'Program completed successfully. Check output file:', 'matrix_output.txt'

END PROGRAM MatrixOperations
