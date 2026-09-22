program binomial
    implicit none
    integer :: n, r, term_idx, coeff, combinations
    real :: a, b, term_val

    a = 3
    b = 2
    n = 5

    open(unit = 10, file = 'out_A4Q11.txt', action = 'write')
    write(10, *) '-------------------------------------------------------------------------'
    write(10, '(a, 3a34)') 'r', 'Term_(n+1)', 'Coefficient C(n, r)', 'Value of term C(n, r)a^(n - r)b^r'
    write(10, *) '--------------------------------------------------------------------------'
    do r = 0, 5
        term_idx = r+1
        coeff = combinations(n, r)
        term_val = real(coeff) * a**(n - r) * b**r

        write(10, '(i1, 2i34, f34.4)') r, term_idx, coeff, term_val

    end do
    write(10, *) '--------------------------------------------------------------------------'
    close(10)

end program binomial

function combinations(n, r) result(comb)
    implicit none
    integer :: n, r, comb, fact

    comb = fact(n) / (fact(r) * fact(n - r))
end function combinations

recursive function fact(k) result(f)
    implicit none
    integer :: k, f 

    if (k <= 1) then
        f = 1
    else
        f = k * fact(k- 1)
    end if
end function fact

