import numpy as np

def f(x):
    return x**3 - 4*x -9

def bisection_method(a, b, tolerance = 1e-4):
    if f(a)*f(b) >= 0:
        raise ValueError("f(a)*f(b) .= 0, no root guaranteed")
    iter_count = 0
    pn_prev = 0
    print(f"{'Iter':^6} {'a':^14} {'b':^14} {'p_n':^14} {'|p_n - p_n-1 / p_n':^16} ")
    print("-"*66)

    while True:
        iter_count += 1
        pn = (a +b) / 2
        error = 1.0 if iter_count == 1 else abs (pn - pn_prev) / abs(pn)

        print(f"{iter_count:^6} {a:^14.8f} {b:^14.8f} {pn:^14.8f} {error:^16.8e}")

        if error < tolerance and iter_count > 1:
            print(f"\nConverged after {iter_count} iterations")
            print(f"Approximate root : {pn:.8f}")
            break
        if f(a)*f(pn) < 0:
            b = pn
        else:
            a = pn

        pn_prev = pn

#Run this method
bisection_method(2.0, 3.0)