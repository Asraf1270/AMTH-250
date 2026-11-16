program GCD
    implicit none
    !integer :: gcd 
    integer :: A(5), i, g

    A = (/21,54,45,15,78/)
    g = A(1)
    do i = 2, 5
        g = calc_gcd(g, A(i))
    end do 
    print*, "GCD: ", g

    contains 
    recursive function calc_gcd(a, b) result(temp)
        implicit none
        integer, intent(in) :: a, b 
        integer :: temp 
        if (b == 0) then
            temp = a 
        else 
            temp = calc_gcd(b, mod(a,b))
        end if
    end function calc_gcd
end program GCD