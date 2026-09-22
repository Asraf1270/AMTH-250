program a4q10
    implicit none
    integer :: n
    integer, dimension(0:50) :: an
    real :: exact_val, diff
    logical :: is_true

    an(0) = 1
    an(1) = 5

    ! Compute recurrence for n = 2 to 50
    do n = 2, 50
        an(n) = 2 * an(n-1) - an(n-2) + 3
    end do

    open(unit = 10, file = 'out_A4Q10.txt', action = 'write')
    write(10, *) '-------------------------------------------------------'
    write(10, '(4a10)') 'n', 'an', 'exact_val', 'diff'
    write(10, *) '-------------------------------------------------------'

    is_true = .true.
    do n = 1, 50
        exact_val = 1.5 * real(n)**2 + 2.5 * real(n) + 1.0
        diff = abs(real(an(n)) - exact_val)

        write(10, '(2i10, 2f10.2)') n, an(n), exact_val, diff

        if (diff > 1.0e-6) then
            is_true = .false.
        end if
    end do

    if (is_true) then
        write(10, *) 'The recurrence values match the exact solution.'
    else
        write(10, *) 'The recurrence values do not match the exact solution.'
    end if

    close(10)
end program a4q10