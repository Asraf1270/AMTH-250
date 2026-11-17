program nb
    implicit none
    integer :: i, j
    integer, parameter :: n=5
    real(8) :: x(n), y(n), diff(n,n), s, h, term, fact, sum, xp
    x = (/1.0,2.0,3.0,4.0,5.0/)
    y = (/106500.0,113420.0,120790.0,128620.0,136950.0/)
    xp = 4.5
    h=x(2) -x(1)
    diff(:,1) =y 
    do j = 2, n
        do i = j, n 
            diff(i, j) = diff(i, j-1) - diff(i-1, j-1)
        end do
    end do
    ! write the table
    do i = 1, n 
        do j = 1, i
            write(*,'(f15.4)', advance='no') diff(i,j)
        end do
        write(*,*) ""
    end do
    s = (xp - x(n)) /h
    sum = diff(n,1)
    fact = 1.0
    term = 1.0
    do j = 1, n-1
        fact = fact * real(j)
        term = term * (s + (j-1))
        sum = sum + term * diff(n,j+1) / fact
    end do
    print *, "The approximate is: ", sum
end program nb