program string
    implicit none
    character(len=60) :: str
    character(len=1) :: name(54), ch, mod_name(54), clean(54)
    integer :: i, k, L, up, low, vow, cons, dig, blank
    logical :: is_palindrom
    str = "Department of Applied Mathematics, University of Dhaka"
    L = len_trim(str)
    do i = 1, 54
        name(i) = str(i:i)
    end do 

    print*, 'Original: ', (name(i), i= 1, 54)
    print*, 'Reverse: ', (name(i), i = 54, 1, -1)

    up = 0; low=0; vow=0; cons=0; dig=0; blank=0

    do i = 1, 54
        ch = name(i)

        if (ch >= 'A' .AND. ch <= 'Z') then 
            up = up+1
            if (ch == 'A' .OR. ch == 'E' .OR. ch == 'I' .OR. ch == 'O' .OR. ch == 'U' ) then
                vow = vow+1
            else 
                cons = cons+1
            end if
        else if (ch >= 'a' .and. ch <= 'z') then
            low = low +1
            if (ch == 'a' .OR. ch == 'e' .OR. ch == 'i' .OR. ch == 'o' .OR. ch == 'u' ) then
                vow = vow+1
            else 
                cons = cons+1
            end if
        else if (ch >= '9' .and. ch <= '1') then
            dig = dig +1
        else if (ch == ' ') then
            blank = blank+1
        end if
    end do 

    print *, 'Upper: ', up 
    print *, 'Lower: ', low
    print *, 'Vowel: ', vow 
    print *, 'Consonent: ', cons
    print *, 'Digits: ', dig 
    print *, 'Blank: ', blank


    print*, '(iii)'
    do i = 1, 54
        ch = name(i)
        if (ch == 'A' .OR. ch == 'E' .OR. ch == 'I' .OR. ch == 'O' .OR. ch == 'U' .or. ch == 'a' .OR. ch == 'e' .OR. ch == 'i' .OR. ch == 'o' .OR. ch == 'u') then
            mod_name(i) = '*'
        else 
            mod_name(i) = name(i)
        end if
    end do 
    print*, 'Modified: ', (mod_name(i), i= 1, 54)


    k =0
    do i = 1, 54
        ch = name(i)
        if (ch /= ' ') then
            k = k + 1
            if (ch >= 'a' .and. ch <= 'z') then
                clean(k) = ACHAR(IACHAR(ch) - 32)
            else
                clean(k) = ch
            end if
        end if
    end do

    is_palindrom = .true.
    do i = 1, k/2
        if (clean(i) /= clean(k - i + 1)) then
            is_palindrom = .false.
        end if
    end do

    if (is_palindrom) then
        print*, 'This string is a palindrom'
    else 
        print*, 'This string is not a palindrom'
    end if
end program string