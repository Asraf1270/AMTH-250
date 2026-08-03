program fileio
    implicit none
    integer :: i, num

    open(10, file='output.txt', status='replace', action='write')

    do i = 1, 5
        write(10, '(A, I2)') 'This is line number: ', i
    end do

    close(10)

end program fileio