program newton_forwarn_interpolation
    implicit none
    integer :: i, j
    integer, parameter :: n=6
    real(8) :: x(n), y(n), diff(n,n), s, h, term, fact, sum, xp
    x = (/2000.0, 2005.0, 2010.0, 2015.0, 2020.0, 2025.0/)
    y = (/52.4,61.8,75.6,93.2,118.5,149.7/)
    xp = 2007.0
    h=x(2) -x(1)
    diff(:,1) =y 
    do j =2, n 
        do i = 1, n-j+1
            diff(i,j) = diff(i+1, j-1) - diff(i, j-1)
        end do
    end do
    do i = 1, n 
        do j = 1, n-i+1
            write(*, '(f10.2)', advance='no') diff(i, j)
        end do
        write(*,*) ""
    end do

    s = (xp - x(1)) / h
    fact = 1.0d0
    term = 1.0
    sum = diff(1,1)
    do j = 1, n-1
        fact = fact* j 
        term = term * (s - (j-1))
        sum = sum + (term * diff(1,j+1) / fact)
    end do 
    print*, "The sum is: ", sum
end program newton_forwarn_interpolation