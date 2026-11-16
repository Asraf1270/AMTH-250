program random
    implicit none
    integer, parameter :: n=7
    real :: A(n,n), mx, mn, su
    integer :: i, j, count

    call RANDOM_SEED()
    call RANDOM_NUMBER(A)

    do i = 1, n 
        write(*, '(7f10.4)') (A(i, j), j=1,n)
    end do 
    mx = maxval(A)
    mn = minval(A)
    su = sum(A)

    do i = 1, n 
        do j = 1, n 
            if (A(i, j) > 0.5) then 
                count = count + 1 
                write(*, '(f10.4, a)', advance='no') A(i, j), ', '
            end if 
        end do
    end do
    write(*,*) ''
    write(*,*) 'Total: ', count

    print*, mx, mn, su
end program random