program palindrom
    implicit none
    character(len=35) :: str
    character(len=1) :: ch
    character(len=:), allocatable :: clean
    integer :: len_str, n, i, k
    logical :: is_palindrom
    is_palindrom= .false.
    str = "Department of Applied Mathematics"
    !str = "ab cde fgh ijji hgf edc ba"
    len_str = len_trim(str)
    n = len_str
    allocate(character(len=n) :: clean)
    k=0
    do i = 1, n 
        ch = str(i:i)
        if(ch /= ' ') then
            k = k+1  
            if (ch >= 'a' .and. ch <= 'z') then
                ch = achar(iachar(str(i:i)) - 32)
                clean(k:k) = ch 
            else
                clean(k:k) = ch 
            end if 
        end if 
    end do

    do i = 1, k/2
        if (clean(i:i) == clean(k-i+1:k-i+1)) then
            is_palindrom= .true.
        end if 
    end do 
    if(is_palindrom) then
        print*, "This is a palindrom"
    else
        print*, "This is not a palindrom"
    end if 
    print*, "The clean text is: "
    write(*, '(a)', advance='no') (clean(i:i), i=1,k)
    write(*,*) ""
    write(*, '(A)') (str(n-i+1:n-i+1), i=1,n)

end program palindrom