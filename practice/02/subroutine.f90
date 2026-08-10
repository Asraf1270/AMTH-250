program subroutines
    implicit none
    integer :: x, y, z

    read(*,*) x
    read(*,*) y 

    call add(x, y, z)
    print*, z

end program subroutines

SUBROUTINE add(a, b, c)
    implicit none
    integer :: a, b, c
    c = a + b

end SUBROUTINE
