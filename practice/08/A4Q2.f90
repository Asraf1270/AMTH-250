program thermostat
    implicit none
    logical :: w, h, v1, v2, is_taut
    integer :: i, j
    logical, dimension(2) :: bool = (/ .true., .false./)

    open(unit = 10, file = 'out_A4Q2.txt', action = 'write')
    write(10, *) '----------------------------------------------------------'
    write(10, '(6A6)') 'W', 'H', 'V1', 'V2', 'EQV'
    write(10, *) '----------------------------------------------------------'

    is_taut = .true.
    do i = 0, 1
        do j = 0, 1
            w = bool(i)
            h = bool(j)

            v1 = w .and. h 
            v2 = .not.((.not. w) .or. (.not. h))

            write(10, '(5(5x, l1))') w, h, v1, v2, (v1 .eqv. v2)

            if(v1 .neqv. v2) then
                is_taut = .false.
            end if
        end do
    end do

    write(10, *) '----------------------------------------------------------'
    if (is_taut) then
        write(10, *) '(𝐴) ↔ (𝐵) is a tautology.'
    else
        write(10, *) '(𝐴) ↔ (𝐵) is not a tautology.'
    end if
    close(10)
end program thermostat