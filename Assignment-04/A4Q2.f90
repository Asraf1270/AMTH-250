program thermostat
    implicit none
    logical :: f, b, c, v1, v2, is_tautology
    integer :: i, j, k
    logical, dimension(2) :: bool_vals = (/.true., .false./)

    open(unit = 10, file ='out_A4Q2.txt', action = 'write')

    write(10, *) "------------------------------------------------------------------"
    write(10, '(6A5)') 'F', 'B', 'C', 'V1', 'V2', 'Equivalent?'
    write(10, *) "------------------------------------------------------------------"


    is_tautology = .true.

    do i = 1, 2
        do j = 1, 2
            do k = 1, 2
                f = bool_vals(i)
                b = bool_vals(j)
                c = bool_vals(k)

                v1 = c .eqv. (f .and. b)
                v2 = .not. (.not. f .or. .not. b ) .or. (.not. c )

                if(.not.(v1 .eqv. v2)) then
                    is_tautology = .false.
                end if

                write(10, '(4x, L1, 4X, L1, 4X, L1, 4X, L1, 4X, L1, 4X,"|",  L1, 4X)') f, b, c, v1, v2, (v1 .eqv. v2)

            end do
        end do
    end do

    write(10, *) "------------------------------------------------------------------"
    if(is_tautology) then
        write(10, *) 'Conclusion: (A) <-> (B) is a tautology'
    else
        write(10, *) 'Conclusion: (A) <-> (B) is NOT a tautology'
    end if
    write(10, *) "------------------------------------------------------------------"
    close(10)

end program 