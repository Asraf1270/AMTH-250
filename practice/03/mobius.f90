program mobius_program

    implicit none

    integer :: n, result

    print *, 'Enter a positive integer:'
    read *, n

    result = mobius(n)

    print *, 'Mobius(', n, ') = ', result

contains

    integer function mobius(n)

        implicit none

        integer :: n
        integer :: x, p, count

        ! Case 1: n = 1
        if (n == 1) then
            mobius = 1
            return
        end if

        x = n
        count = 0

        ! Find prime factors
        do p = 2, n

            if (mod(x, p) == 0) then

                ! Found a prime factor
                count = count + 1

                ! Remove it once
                x = x / p

                ! Same prime appears again
                if (mod(x, p) == 0) then
                    mobius = 0
                    return
                end if

                ! Remove remaining occurrences
                do while (mod(x, p) == 0)
                    x = x / p
                end do

            end if

            if (x == 1) exit

        end do

        ! If all prime factors are distinct
        if (mod(count, 2) == 0) then
            mobius = 1
        else
            mobius = -1
        end if

    end function mobius

end program mobius_program