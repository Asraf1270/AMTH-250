program A1Q6_gcd
    implicit none

    integer :: num1, num2, single_gcd

    print*, "Enter two number"
    read(*,*) num1, num2

    single_gcd = gcd(num1, num2)
    print*, single_gcd


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