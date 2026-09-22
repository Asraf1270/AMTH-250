program hospital_rule
    implicit none

    logical :: f, b, c, r1, r2, equivalent
    integer :: i, j, k

    open(10, file='out_A4Q1.txt', action='write')

    write(10, '(A)') ' F     B     C     R1    R2    Same?'
    write(10, '(A)') '--------------------------------------'

    equivalent = .true.

    ! i, j, and k make all 8 possible True/False combinations.
    do i = 0, 1
        do j = 0, 1
            do k = 0, 1
                f = (i == 1)
                b = (j == 1)
                c = (k == 1)

                r1 = (f .and. b) .or. (f .and. c) .or. (b .and. c)
                r2 = (f .and. b) .or. (c .and. (f .or. b))

                if (r1 .neqv. r2) equivalent = .false.

                write(10, '(5(L1,5X),L1)') f, b, c, r1, r2, r1 .eqv. r2
            end do
        end do
    end do

    write(10, '(A)') '--------------------------------------'
    if (equivalent) then
        write(10, '(A)') 'The two rules are logically equivalent.'
    else
        write(10, '(A)') 'The two rules are not logically equivalent.'
    end if

    close(10)
end program hospital_rule
