program fileio
    implicit none
    integer :: i, num

    open(10, file='output.txt', status='replace', action='write')

    do i = 1, 5
        write(10, '(A, I2)') 'This is line number: ', i
    end do

    close(10)

    open(20, file='output.txt', status='old', action='read')
    print*, "from file:"
    do i = 1, 5
        read(20, '(A, I2)') num
        print*, num
    end do
    close(20)

end program fileio