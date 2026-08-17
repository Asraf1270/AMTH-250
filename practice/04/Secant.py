import numpy as np

def f(x):
    return np.exp(-x) - x

def secand_method(x0, x1, tolerance = 1e-6, max_iter = 100):
    print("-" * 85)
    print(f"{'Iter':^6} {'x_(n-1)':^16} {'x_n':^16} {'x_(n+1)':^16} {'f(x_{n+1})':^16} {'|x+{n+1} - x_n':^16}")
    print("-"*85)

    iter_count = 0
    fx0 = f(x0)
    fx1 = f(x1)
    error = 1.0

    print(f"{0:^6} {x0:^16.8f} {x1:^16.8f}")
    while iter_count < max_iter and error > tolerance:
        iter_count += 1

        # Check for divisio by zero
        if abs(fx1 - fx0) < 1e-12:
            print(f"ERROR : division by zero or nearly zero !")
            return None

        # secand formula
        x2 = x1 - f(x1)* (x1 - x0) / (fx1 - fx0)
        fx2 = f(x2)
        error = abs(x2 - x1)

        print(f"{iter_count:^6} {x0:^16.8f} {x1:^16.8f} {x2:^16.8f} {fx2:^16.8e} {error:^18.8e}")

        if error < tolerance:
            print("="*85)
            print(f"converged after {iter_count} iterations")
            print(f"Approximate root : {x2:.8f}")
            print(f"f(root) = {fx2:.8e}")
            print(f"Error = {error:.8e}")
            return x2

        x0, x1 = x1, x2
        fx0, fx1 = fx1, fx2

    print("-"*85)
    print(f"WARNING : Maximum iterations reached without convergence")
    print(f"Current approximation : {x2:.8f}")
    return x2


root = secand_method(0.0, 1.0, tolerance=1e-6)


# verification
print("\n" + "=" *85)
print("verification:")
print("The equation e^(-x) = x is equivalent to x = W(1)")
print(f"Known value ; W(1) ~ 015671432904")
print(f"Our result : {root:.10f}")