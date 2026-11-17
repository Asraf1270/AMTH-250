program ndd
    implicit none
    integer, parameter :: n= 5
    integer :: i, j
    real(8) :: dd(n,n), x(n), y(n), sum, term, xp
    x = (/0.0,1.0,2.5,4.0,6.0/)
    y = (/118.20d0,118.45d0,118.93d0,119.36d0,120.05d0/)
    xp = 3.0
    dd = 0.0
    dd(:,1) = y
    do j = 2, n 
        do i = 1, n-j+1 
            dd(i, j) = (dd(i+1, j-1) - dd(i, j-1)) / (x(i+j-1) - x(i))
        end do
    end do 
    do i = 1, n 
        do j = 1, n-i+1
            write(*, '(f10.6)', advance='no') dd(i, j)
        end do
        write(*,*) ""
    end do
    sum = dd(1,1)
    term = 1.0d0
    do j = 2, n
        term = term * (xp - x(j-1))
        sum = sum + term * dd(1, j)
        print*, sum, term, dd(1, j)
    end do 
    print*, sum
end program ndd