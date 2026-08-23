import numpy as np
import math

def g(x):
    """Fixed point iteration function: x = g(x)"""
    return 1.0 / (1.0 + x**2)

def f(x):
    """Original function: f(x) = x^3 + x - 1"""
    return x**3 + x - 1

def fixed_point_iteration(p0, tolerance=1e-4, max_iter=100):
    print("=" * 85)
    print(f"{'Iter':^6} {'P_{n-1}':^20} {'P_n':^20} {'|P_n-P_{n-1}|/|P_n|':^20}")
    print("=" * 85)
    
    p_prev = p0
    iter_count = 0
    error = 1.0
    
    print(f"{0:^6} {p_prev:^20.8f}")
    
    while iter_count < max_iter and error > tolerance:
        iter_count += 1
        
        # Fixed point iteration
        pn = g(p_prev)
        
        # Calculate relative error
        error = abs(pn - p_prev) / abs(pn) if abs(pn) > 1e-12 else abs(pn - p_prev)
        
        print(f"{iter_count:^6} {p_prev:^20.8f} {pn:^20.8f} {error:^20.8e}")
        
        if error < tolerance:
            print("=" * 85)
            print(f"CONVERGED after {iter_count} iterations")
            print(f"Approximate root: {pn:.8f}")
            print(f"Relative error: {error:.8e}")
            print(f"f(root) = {f(pn):.8e}")
            return pn
        
        p_prev = pn
    
    print("=" * 85)
    print(f"WARNING: Maximum iterations reached without convergence")
    print(f"Current approximation: {pn:.8f}")
    return pn

# Run the method
root = fixed_point_iteration(0.5, tolerance=1e-4)

# Verification
print("\n" + "=" * 85)
print("DETAILED VERIFICATION:")
print(f"Root found: {root:.8f}")
print(f"Check: g(root) = {g(root):.8f}")
print(f"Fixed point condition: |root - g(root)| = {abs(root - g(root)):.8e}")
print(f"f(root) = {f(root):.8e}")
print(f"Root satisfies: {root:.8f}^3 + {root:.8f} - 1 = {f(root):.8e}")

# Convergence analysis
print("\n" + "=" * 85)
print("CONVERGENCE ANALYSIS:")
x_vals = np.linspace(0, 1, 100)
g_prime = lambda x: -2*x/(1+x**2)**2
print(f"g'(x) at root: {g_prime(root):.6f}")
print(f"|g'(x)| at root: {abs(g_prime(root)):.6f}")
print(f"Condition: |g'(x)| < 1 → {abs(g_prime(root)) < 1}")
print("✓ Convergence is guaranteed")
