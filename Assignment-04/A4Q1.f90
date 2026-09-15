program hospital_rule
    implicit none
    logical :: f, b, c, r1, r2, is_eqv
    integer :: i, j, k
    logical, dimension(2) :: bool_vals = (/.true., .false./)

    open(unit = 10, file ='out_A4Q1.txt', action = 'write')

    write(10, *) "------------------------------------------------------------------"
    write(10, '(6A5)') 'F', 'B', 'C', 'R1', 'R2', 'Equivalent?'
    write(10, *) "------------------------------------------------------------------"


    is_eqv = .true.

    do i = 1, 2
        do j = 1, 2
            do k = 1, 2
                f = bool_vals(i)
                b = bool_vals(j)
                c = bool_vals(k)

                r1 = (f .and. b) .or. (f .and. c) .or. (b .and. c)

                r2 = (f .and. b) .or. (c .and. (b .and. c))

                if(r1 .neqv. r2) then
                    is_eqv = .false.
                end if

                write(10, '(4x, L1, 4X, L1, 4X, L1, 4X, L1, 4X, L1, 4X,"|",  L1, 4X)') f, b, c, r1, r2, (r1 .eqv. r2)

            end do
        end do
    end do

    write(10, *) "------------------------------------------------------------------"
    if(is_eqv) then
        write(10, *) 'The two rules are Logically Equivalent'
    else
        write(10, *) 'The two rules are not Logically Equivalent'
    end if
    write(10, *) "------------------------------------------------------------------"
    close(10)

end program hospital_rule