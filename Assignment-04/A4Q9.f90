program a4q9
    implicit none
    integer :: n, tn, total_crates
    real :: p, cn, total_cost

    open(unit = 10, file ='out_A4Q9.txt', action = 'write')
    write(10, *) '----------------------------------------------------'
    write(10, '(4a10)') 'n', 'n^2', 'Tn', 'Cn'
    write(10, *) '----------------------------------------------------'

    do n = 1, 20
        tn = total_crates(n)
        cn = total_cost(n)
        write(10, '(3i10, f10.2)') n, n**2, tn, cn
    end do
    close(10)

end program a4q9

recursive function total_crates(n) result(tn)
    implicit none
    integer :: n, tn

    if (n == 1) then
        tn = 1
    else 
        tn = total_crates(n - 1) + n**2
    end if
end function total_crates

recursive function total_cost(n) result(cn)
    implicit none
    integer :: n 
    real :: cn

    if ( n== 1) then
        cn = 15.0
    else 
        cn = total_cost(n - 1) + 15.0 * real(n**2)
    end if
end function total_cost