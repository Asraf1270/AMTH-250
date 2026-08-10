program A1Q5
    implicit none
    INTEGER ::  n, result
    print*, "Enter the value for n"
    read(*,*) n
    result = mobius(n)
    print*, "the mobius of ", n , " is ", result

contains

    integer function mobius(n)
        implicit none
        integer :: n, x, p, count

        if (n == 0) then
            mobius = 0
            return
        end if

        x = n
        count = 0

        do p = 2, n 
            if (mod(x, p) == 0) then 
                count = count + 1
                x = x/p

                if (mod(x, p) == 0 ) then 
                    mobius = 0
                    return
                end if

                do while (mod(x, p) == 0)
                    x = x / p
                end do
            end if
            if (x == 1) exit
        end do

        if (mod(count, 2) == 0) then 
            mobius = 1
        else
            mobius = -1
        end if
    end function mobius
end program A1Q5