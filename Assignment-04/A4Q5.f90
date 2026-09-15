program tower_of_hanio
    implicit none
    integer :: n, hn, hanio 
    real :: time, cost 

    open(unit = 51, file = 'out_A4Q5.txt', action = 'write')

    write(51, *) '-----------------------------------------------------------------------'
    write(51, '(4a6)') 'n', 'Hn', 'Time', 'Cost'
    write(51, *) '-----------------------------------------------------------------------'

    do n = 1, 10
        hn = hanio(n)
        time = (real(hn) * 0.3) / 60.0
        cost = real(hn) * 0.02

        write(51, '(2i6, 2f6.2)') n, hn, time, cost
    end do
    close(51)


end program tower_of_hanio
    recursive function hanio(n) result(h)
        implicit none
        integer :: n, h

        if (n <= 1) then
            h = 1
        else
            h = 2* hanio(n - 1) + 1
        end if
    end function hanio
