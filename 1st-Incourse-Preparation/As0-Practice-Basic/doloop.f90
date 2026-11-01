program doloop
    implicit none
    integer :: i 

    do i = 1, 10
        if(i == 5)  cycle
        print*, i, ') ', i 
    end do
end program doloop