program ifelse
    implicit none
    integer :: a, b, choice
    logical :: ok

    print*, 'write two number'
    read(*, *) a
    read(*, *) b

    print*, '---- Choice One option'
    print*, ' 1) Option one'
    print*, ' 2) Option two'

    read(*,*) choice

    select case (choice)

    case(1)
        if(a > b) then
            print*, 'The biggest number is ', a
        else
            print*, 'The biggest number is ', b
        end if

    case(2)
        if (a > b) then
            ok = .true.
        else
            ok = .false.
        end if

        if(ok) then
            print*, 'The biggest number is ', a
        else
            print*, 'The biggest number is ', b 
        end if
    end select
end program ifelse