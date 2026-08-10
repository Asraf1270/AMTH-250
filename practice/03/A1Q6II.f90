program A1Q6_gcd
    implicit none

    integer, allocatable :: arr(:)
    integer :: n, i, overall_gcd

    print*, "GCD of n positive integer"
    print*, "Enter the value for n"
    read(*,*) N

    allocate(arr(n))

    print*, "Enter the ", n, "elements"
    read(*,*)(arr(i), i = 1, n)

    overall_gcd = arr(1)

    do i = 2, n
        overall_gcd = gcd(overall_gcd, arr(i))
    end do
    print*, "The GCD of all elements is = ", overall_gcd


contains
    recursive function gcd(a, b) result(res)
        implicit none
        integer :: a, b, res, remainder

        remainder = mod(a, b)

        if (remainder == 0) then
            res = b
        else
            res = gcd(b, remainder)
        end if
    end function gcd

end program A1Q6_gcd