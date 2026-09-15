program prove_negative_binomial
    implicit none
    logical :: p, q, lhs, rhs, is_eqv
    integer :: i, j
    logical, dimension(2) :: bool_vals = (/.true., .false./)

    open(unit = 40, file = 'out_A4Q4.txt', action = 'write')
    write(40, *) "--------------------------------------------------------------------------------"
    write(40, '(5a15)') 'p', 'q', '|!(p <-> q)|', 'p <-> !q |', 'Logically Eqv?' 
    write(40, *) "--------------------------------------------------------------------------------"

    is_eqv = .true.

    do i = 1, 2
        do j = 1, 2
            p = bool_vals(i)
            q = bool_vals(j)

            call compute_exp(p, q, lhs, rhs)

            if(lhs .neqv. rhs) then
                is_eqv = .false.
            end if

            write(40, '(5(14x, l1))') p, q, lhs, rhs, (lhs .eqv. rhs)
        end do
    end do

    write(40, *) '-----------------------------------------------------------------'
    if (is_eqv) then
        write(40, *) 'They are logically equivalent'
    else
        write(40, *) 'They are not logically equivalent'
    end if

    close(40)
contains
    subroutine compute_exp(x, y, lhs_val, rhs_val)
        implicit none
        logical :: x, y, lhs_val, rhs_val
        logical :: bicond1, bicond2

        call biconditional(x, y, bicond1)
        lhs_val = .not. bicond1

        call biconditional(x, .not. y, bicond2)
        rhs_val = bicond2
    end subroutine compute_exp

    subroutine biconditional(a, b, result)
        implicit none
        logical :: a, b, result

        result = (a .eqv. b)
    end subroutine biconditional

end program prove_negative_binomial