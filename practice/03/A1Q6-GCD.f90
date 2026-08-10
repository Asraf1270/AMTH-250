program array_gcd
    implicit none

    integer, allocatable :: arr(:)
    integer :: n, i, overall_gcd
    integer :: num1, num2, single_gcd

    ! -------------------------------------------------------------
    ! Part (i): Test the recursive GCD function for two numbers
    ! -------------------------------------------------------------
    print *, '--- Part (i): Recursive GCD of Two Numbers ---'
    print *, 'Enter two positive integers (a and b):'
    read (*, *) num1, num2

    single_gcd = gcd(num1, num2)
    print '(A, I0, A, I0, A, I0)', 'gcd(', num1, ', ', num2, ') = ', single_gcd
    print *

    ! -------------------------------------------------------------
    ! Part (ii): GCD of an Array of n Positive Integers
    ! -------------------------------------------------------------
    print *, '--- Part (ii): GCD of n Positive Integers ---'
    print *, 'Enter the total number of elements (n):'
    read (*, *) n

    allocate(arr(n))

    print *, 'Enter the elements of the array:'
    read (*, *) (arr(i), i = 1, n)

    ! Initialize overall GCD with the first element of the array
    overall_gcd = arr(1)

    ! Repeatedly apply the recursive GCD function across the array
    do i = 2, n
        overall_gcd = gcd(overall_gcd, arr(i))
    end do

    print '(A, I0)', 'The GCD of all elements in the array is: ', overall_gcd

    deallocate(arr)

contains

    ! =============================================================
    ! Recursive Function to Compute GCD based on the recurrence:
    !   gcd(a, b) = b,                   if a (mod b) == 0
    !   gcd(a, b) = gcd(b, a (mod b)),   if a (mod b) /= 0
    ! =============================================================
    recursive function gcd(a, b) result(res)
        implicit none
        integer, intent(in) :: a, b
        integer             :: res
        integer             :: remainder

        remainder = mod(a, b)

        if (remainder == 0) then
            res = b
        else
            res = gcd(b, remainder)
        end if
    end function gcd

end program array_gcd