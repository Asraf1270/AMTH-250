program truth_table
    implicit none
    logical:: p, q, cond, bicond, equiv, is_eqv
    integer :: i, j
    logical, dimension(2) :: bool_vals = (/.true., .false./)
    
    open(unit = 30, file = 'out_A4Q4.txt', action = 'write')

    write(30, *) "-------------------------------------------------------------"
    write(30, '(4a6, 2a15)') 'p', 'q', 'p->q', 'p<->q', '(p^q)v(!p ^ !q)', 'Equal?'

    is_eqv = .true.

    do i = 1, 2
        do j = 1, 2
            p = bool_vals(i)
            q = bool_vals(j)

            cond = (.not. p) .or. q 
            bicond = p .eqv. q 
            equiv = (p .and. q) .or. ((.not. p) .and. (.not. q))

            if(bicond .neqv. equiv) then
                is_eqv = .false.
            end if

            write(30, '(5x, l1, 5x, l1, 3x, l1, 5x, l1, 10x, l1, 20x, l1)')p, q, cond, bicond, equiv, (bicond .eqv. equiv)
        end do
    end do

    write(30, *) "-------------------------------------------------------------"
    if (is_eqv) then
        write(30, *) 'Proved: p <-> q is logically equivalent to (p .and. q) .or. (.not. p .and. .and.  .not. q)'
    else
        write(30, *) 'Statement is false: p <-> q is logically equivalent to (p .and. q) .or. (.not. p .and. .and.  .not. q)'
    end if
    write(30, *) "-------------------------------------------------------------"
    close(30)

end program truth_table