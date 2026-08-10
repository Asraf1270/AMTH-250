program A1Q4I
    implicit none
    INTEGER :: n, tau, sigma, count

    !initial
    count = 0
    n = 1

    print*, "perfect numbers"
    
    do while (count < 4) 
        n = n + 1
        call divisor(n, tau, sigma)

        if (sigma == 2 * n) then 
            count = count + 1
            print*, count , " : ", n
        end if
    end do

    
end program A1Q4I

SUBROUTINE divisor(n, tau, sigma)
    implicit none
    integer :: n, i, tau, sigma

    tau = 0
    sigma = 0

    do i = 1, n
        if (mod(n, i) == 0) then 
            tau = tau + 1
            sigma = sigma + i
        end if
    end do
end SUBROUTINE