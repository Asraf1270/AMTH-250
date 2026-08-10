program A1Q4I
    implicit none
    INTEGER :: n, tau, sigma

    print*, "Enter the value for n"
    read(*,*) n

    call divisor(n, tau, sigma)
    print*, "N = ", n
    print*,"Tau = ", tau
    print*, "sigma = ", sigma
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