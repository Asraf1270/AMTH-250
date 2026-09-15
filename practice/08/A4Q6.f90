program mersenne_num
    implicit none
    integer :: n, mn 
    logical :: is_prime 
    open(unit = 21, file = 'out_A4Q6.txt', action = 'write')
    write(21, *) '---------------------------------------------------------------------'
    write(21, '(3a10)') 'n', 'Mn', 'status'

    do n = 0, 14
        mn = (2**n) - 1

        if (mn <=1) then
            write(21, '(2i10, a10)')n, mn, 'Neither'
        else if(is_prime(mn)) then
            write(21, '(2i10, a10)')n, mn, 'Prime'
        else
            write(21, '(2i10, a10)')n, mn, 'Composite'
        end if
    end do

    close(21)

end program mersenne_num

logical function is_prime(num)
    implicit none
    integer :: num, i 

    if (num <= 1) then
        is_prime = .false.
        return
    end if
    if(num == 2) then
        is_prime = .false.
        return
    end if

    if (mod(num, 2) == 0) then
        is_prime = .false.
        return
    end if

    is_prime = .true.
    do i = 3, int(sqrt(real(num)))
        if(mod(num, i) == 0) then
            is_prime = .false.
            return
        end if
    end do

end function is_prime
