program cycle
    implicit none
    integer :: i

    do i = 1, 10
        if (mod(i, 2)==0) cycle
        print *, i
    end do
end program cycle