program a4q8
    implicit none
    integer :: n
    real :: in, i0, k, percentage, np, rumor

    i0 = 5.0
    k = 0.3
    np = 1000.0

    open(unit = 11, file = 'out_A4Q8.txt', action = 'write')
    write(11, *) '-----------------------------------------------'
    write(11, '(a6, 2A10)') 'Day', 'In', '%'
    write(11, *) '-----------------------------------------------'

    do n = 1, 20
        in = rumor(n, i0, k, np)
        percentage = (in / np) * 100.0

        write(11, '(i6, 2f10.2, A)') n, in, percentage, '%'
    end do
end program a4q8

recursive function rumor(n, i0, k, np) result(val)
    implicit none
    real :: in, i0, k, np, val, temp
    integer :: n

    if( n == 0) then
        val = i0
    else 
        temp = rumor(n - 1, i0, k, np)
        val = temp + (k * temp * (np - temp)) / np
    end if
end function rumor