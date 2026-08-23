import numpy as np
import math

def g(x):
    # Fixed point iteration function
    return 1.0 / (1.0 + x**2)

def f(x):
    # Original function
    return x**3 + x -1

def fixed_point_itn(p0, tol = 1e-4, max_iter = 50):
    print("-"*90)
    print(f"{'Iter':^6} {'p_{n-1}':^20} {'P_n':^20} {'|P_n - P_{n-1}| / |P_n|':^20}")
    print("-"*90)

    p_prev = p0
    iter = 0
    error = 1.0

    print(f"{0:^6} {'p_prev':^20.8f}")
    while iter < max_iter and error > tol:
        iter += 1

        # Fixed point iteration
        pn = g(p_prev)

        error = abs(pn - p_prev) / abs(pn)

        print(f"{iter:^6} {p_prev:^20.8f} {pn:^20.8f} {error:^20.8e}")

        if error < tol:
            print("-"*90)
            print(f"\n converged after {iter} iterations")
            print(f"Appoximate root: {pn}")
            print(f"Relative error: {error}")
            print(f"f(root) = {f(pn):.8e}")
            return pn
        p_prev = pn

    print("-"*90)
    print("warning: maximu iterations reaches without convergence")
    print(f"Current approximation: {pn:.8f}")
    return pn

root = fixed_point_itn(0.5, tol=1e-4)
