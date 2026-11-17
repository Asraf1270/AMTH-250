program bisection
    implicit none
    integer :: iter
    real :: a, b, pn, p0, tol, err

    a = 2.0
    b = 3.0
    iter = 0
    tol = 0.000001
    write(*, '(A, 3A10)') 'Iter', 'a', 'b', 'Pn', 'Err'
    if (f(a)*f(b) < 0) then
        do 
            pn = (a+b)/2.0
            iter = iter + 1
            if (iter == 1) then 
                write(*, '(i4, 3f10.4, a4)') iter, a, b, pn, '-'
            else
                err = abs(pn-p0) / abs(pn)
                write(*, '(i4, 4f10.6)') iter, a, b, pn, err
                if(err < tol) exit
            end if
            if (f(a)*f(pn) < 0.0) then
                a = pn
            else 
                b = pn 
            end if
            p0 = pn
        end do
    else
        print*, "Bisection method do not work."
    end if

    contains
    function f(x)
        implicit none 
        real :: x, f
        f = x**3 - 4*x -9
    end function
end program bisection