# Fortran 90 Recursive Functions

This note provides a comprehensive explanation of recursive functions in Fortran 90, including their syntax, usage, examples, and best practices.

---

## 1. What is a Recursive Function?

A **recursive function** is a function that calls itself to solve a problem by breaking it down into smaller, similar subproblems. Recursion is particularly useful for problems that have a recursive structure, such as:

- Mathematical sequences (factorials, Fibonacci numbers)
- Tree and graph traversals
- Divide-and-conquer algorithms
- Fractal generation
- Combinatorial problems

### Key Components of Recursive Functions:

1. **Base Case**: The stopping condition that prevents infinite recursion
2. **Recursive Case**: The function calls itself with modified arguments
3. **Progress**: Each recursive call moves toward the base case

---

## 2. Basic Syntax

In Fortran 90, recursive functions must be declared with the `RECURSIVE` keyword.

```fortran
RECURSIVE FUNCTION function_name (arguments) RESULT(result_var)
  IMPLICIT NONE
  ! Declarations
  data_type, INTENT(IN) :: arguments
  data_type :: result_var
  ! Local variables
  ! Executable statements
  IF (base_condition) THEN
    result_var = base_value
  ELSE
    result_var = expression_using_function_name(modified_arguments)
  END IF
END FUNCTION function_name
```

---

## 3. Simple Examples

### Example 1: Factorial (Classic Example)

```fortran
PROGRAM test_factorial
  IMPLICIT NONE
  
  INTEGER :: n = 5
  
  PRINT *, 'Factorial of', n, 'is:', factorial_recursive(n)
  
  ! Test with multiple values
  DO n = 0, 10
    PRINT *, 'Factorial(', n, ') =', factorial_recursive(n)
  END DO
  
END PROGRAM test_factorial

!-----------------------------------------------------------
RECURSIVE FUNCTION factorial_recursive(n) RESULT(fact)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: n
  INTEGER :: fact
  
  ! Base case: 0! = 1! = 1
  IF (n <= 1) THEN
    fact = 1
  ELSE
    ! Recursive case: n! = n * (n-1)!
    fact = n * factorial_recursive(n - 1)
  END IF
  
END FUNCTION factorial_recursive
```

**Trace of Execution** for `factorial_recursive(5)`:
```
factorial_recursive(5) = 5 * factorial_recursive(4)
                        = 5 * 4 * factorial_recursive(3)
                        = 5 * 4 * 3 * factorial_recursive(2)
                        = 5 * 4 * 3 * 2 * factorial_recursive(1)
                        = 5 * 4 * 3 * 2 * 1
                        = 120
```

### Example 2: Fibonacci Sequence

```fortran
PROGRAM test_fibonacci
  IMPLICIT NONE
  
  INTEGER :: n, fib
  
  DO n = 0, 10
    fib = fibonacci_recursive(n)
    PRINT *, 'Fibonacci(', n, ') =', fib
  END DO
  
  ! Calculate 20th Fibonacci number
  n = 20
  PRINT *, 'Fibonacci(', n, ') =', fibonacci_recursive(n)
  
END PROGRAM test_fibonacci

!-----------------------------------------------------------
RECURSIVE FUNCTION fibonacci_recursive(n) RESULT(fib)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: n
  INTEGER :: fib
  
  ! Base cases: F(0) = 0, F(1) = 1
  IF (n <= 0) THEN
    fib = 0
  ELSE IF (n == 1) THEN
    fib = 1
  ELSE
    ! Recursive case: F(n) = F(n-1) + F(n-2)
    fib = fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)
  END IF
  
END FUNCTION fibonacci_recursive
```

---

## 4. Real-World Examples

### Example 3: Power Function (Exponentiation)

```fortran
PROGRAM test_power
  IMPLICIT NONE
  
  REAL :: base
  INTEGER :: exponent
  
  base = 2.0
  exponent = 10
  
  PRINT *, base, '^', exponent, '=', power_recursive(base, exponent)
  PRINT *, '2^0 =', power_recursive(2.0, 0)
  PRINT *, '3^4 =', power_recursive(3.0, 4)
  PRINT *, '10^3 =', power_recursive(10.0, 3)
  
END PROGRAM test_power

!-----------------------------------------------------------
RECURSIVE FUNCTION power_recursive(base, exponent) RESULT(result)
  IMPLICIT NONE
  
  REAL, INTENT(IN) :: base
  INTEGER, INTENT(IN) :: exponent
  REAL :: result
  
  ! Base case: anything raised to 0 is 1
  IF (exponent == 0) THEN
    result = 1.0
  ELSE IF (exponent > 0) THEN
    ! Recursive case: base^exp = base * base^(exp-1)
    result = base * power_recursive(base, exponent - 1)
  ELSE
    ! Negative exponent: base^(-n) = 1 / base^n
    result = 1.0 / power_recursive(base, -exponent)
  END IF
  
END FUNCTION power_recursive
```

### Example 4: Greatest Common Divisor (GCD)

```fortran
PROGRAM test_gcd
  IMPLICIT NONE
  
  INTEGER :: a, b
  
  a = 48
  b = 18
  
  PRINT *, 'GCD of', a, 'and', b, 'is:', gcd_recursive(a, b)
  PRINT *, 'GCD of 1071 and 462:', gcd_recursive(1071, 462)
  PRINT *, 'GCD of 15 and 25:', gcd_recursive(15, 25)
  
END PROGRAM test_gcd

!-----------------------------------------------------------
RECURSIVE FUNCTION gcd_recursive(a, b) RESULT(gcd)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: a, b
  INTEGER :: gcd
  
  ! Base case: GCD(a, 0) = a
  IF (b == 0) THEN
    gcd = a
  ELSE
    ! Recursive case: GCD(a, b) = GCD(b, a mod b)
    gcd = gcd_recursive(b, MOD(a, b))
  END IF
  
END FUNCTION gcd_recursive
```

### Example 5: Sum of Array Elements

```fortran
PROGRAM test_array_sum
  IMPLICIT NONE
  
  INTEGER, DIMENSION(5) :: numbers = [1, 2, 3, 4, 5]
  
  PRINT *, 'Array:', numbers
  PRINT *, 'Sum of all elements:', array_sum_recursive(numbers, 5)
  PRINT *, 'Sum of first 3 elements:', array_sum_recursive(numbers, 3)
  
END PROGRAM test_array_sum

!-----------------------------------------------------------
RECURSIVE FUNCTION array_sum_recursive(arr, n) RESULT(sum)
  IMPLICIT NONE
  
  INTEGER, DIMENSION(:), INTENT(IN) :: arr
  INTEGER, INTENT(IN) :: n
  INTEGER :: sum
  
  ! Base case: sum of 0 elements is 0
  IF (n <= 0) THEN
    sum = 0
  ELSE
    ! Recursive case: sum = last element + sum of remaining
    sum = arr(n) + array_sum_recursive(arr, n - 1)
  END IF
  
END FUNCTION array_sum_recursive
```

---

## 5. Advanced Examples

### Example 6: Binary Search (Search in Sorted Array)

```fortran
PROGRAM test_binary_search
  IMPLICIT NONE
  
  INTEGER, DIMENSION(10) :: sorted_array
  INTEGER :: target, index
  
  ! Initialize sorted array
  sorted_array = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
  
  target = 13
  index = binary_search_recursive(sorted_array, target, 1, 10)
  
  IF (index > 0) THEN
    PRINT *, 'Found', target, 'at position', index
  ELSE
    PRINT *, target, 'not found in array'
  END IF
  
  target = 6
  index = binary_search_recursive(sorted_array, target, 1, 10)
  
  IF (index > 0) THEN
    PRINT *, 'Found', target, 'at position', index
  ELSE
    PRINT *, target, 'not found in array'
  END IF
  
END PROGRAM test_binary_search

!-----------------------------------------------------------
RECURSIVE FUNCTION binary_search_recursive(arr, target, low, high) RESULT(pos)
  IMPLICIT NONE
  
  INTEGER, DIMENSION(:), INTENT(IN) :: arr
  INTEGER, INTENT(IN) :: target, low, high
  INTEGER :: pos
  INTEGER :: mid
  
  ! Base case: target not found
  IF (low > high) THEN
    pos = -1
    RETURN
  END IF
  
  ! Calculate middle index
  mid = (low + high) / 2
  
  ! Check if target is at middle
  IF (arr(mid) == target) THEN
    pos = mid
  ELSE IF (arr(mid) > target) THEN
    ! Search left half
    pos = binary_search_recursive(arr, target, low, mid - 1)
  ELSE
    ! Search right half
    pos = binary_search_recursive(arr, target, mid + 1, high)
  END IF
  
END FUNCTION binary_search_recursive
```

### Example 7: Tower of Hanoi

```fortran
PROGRAM test_hanoi
  IMPLICIT NONE
  
  INTEGER :: n = 3
  
  PRINT *, 'Tower of Hanoi with', n, 'disks:'
  CALL hanoi_recursive(n, 1, 3, 2)
  
END PROGRAM test_hanoi

!-----------------------------------------------------------
RECURSIVE SUBROUTINE hanoi_recursive(n, source, target, auxiliary)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: n, source, target, auxiliary
  
  ! Base case: move 1 disk directly
  IF (n == 1) THEN
    PRINT *, 'Move disk 1 from tower', source, 'to tower', target
  ELSE
    ! Move n-1 disks from source to auxiliary using target as helper
    CALL hanoi_recursive(n - 1, source, auxiliary, target)
    
    ! Move the largest disk from source to target
    PRINT *, 'Move disk', n, 'from tower', source, 'to tower', target
    
    ! Move n-1 disks from auxiliary to target using source as helper
    CALL hanoi_recursive(n - 1, auxiliary, target, source)
  END IF
  
END SUBROUTINE hanoi_recursive
```

### Example 8: Permutations of a String

```fortran
PROGRAM test_permutations
  IMPLICIT NONE
  
  CHARACTER(LEN=3) :: str = 'ABC'
  INTEGER :: n = 3
  
  PRINT *, 'All permutations of "', TRIM(str), '":'
  CALL permutations_recursive(str, 1, n)
  
END PROGRAM test_permutations

!-----------------------------------------------------------
RECURSIVE SUBROUTINE permutations_recursive(str, left, right)
  IMPLICIT NONE
  
  CHARACTER(LEN=*), INTENT(INOUT) :: str
  INTEGER, INTENT(IN) :: left, right
  INTEGER :: i
  CHARACTER :: temp
  
  ! Base case: we have a complete permutation
  IF (left == right) THEN
    PRINT *, str
  ELSE
    ! Recursive case: swap each character to the left position
    DO i = left, right
      ! Swap str(left) and str(i)
      temp = str(left:left)
      str(left:left) = str(i:i)
      str(i:i) = temp
      
      ! Recursively permute the rest
      CALL permutations_recursive(str, left + 1, right)
      
      ! Swap back (backtrack)
      temp = str(left:left)
      str(left:left) = str(i:i)
      str(i:i) = temp
    END DO
  END IF
  
END SUBROUTINE permutations_recursive
```

---

## 6. Recursive vs. Iterative Approaches

### Comparison Table

| Aspect | Recursive | Iterative |
|--------|-----------|-----------|
| **Code Clarity** | Often more intuitive | Can be complex |
| **Memory Usage** | Uses stack memory | Uses heap/registers |
| **Performance** | Overhead from function calls | Generally faster |
| **Risk** | Stack overflow (deep recursion) | Less risk |
| **Best For** | Problems with recursive structure | Simple repetitions |

### Example: Factorial Comparison

```fortran
PROGRAM compare_factorial
  IMPLICIT NONE
  
  INTEGER :: n = 10
  
  PRINT *, 'Recursive factorial:', factorial_recursive(n)
  PRINT *, 'Iterative factorial:', factorial_iterative(n)
  
END PROGRAM compare_factorial

!-----------------------------------------------------------
RECURSIVE FUNCTION factorial_recursive(n) RESULT(fact)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: n
  INTEGER :: fact
  
  IF (n <= 1) THEN
    fact = 1
  ELSE
    fact = n * factorial_recursive(n - 1)
  END IF
END FUNCTION factorial_recursive

!-----------------------------------------------------------
FUNCTION factorial_iterative(n) RESULT(fact)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: n
  INTEGER :: fact
  INTEGER :: i
  
  fact = 1
  DO i = 2, n
    fact = fact * i
  END DO
END FUNCTION factorial_iterative
```

---

## 7. Optimizing Recursion

### Tail Recursion

A function is **tail-recursive** if the recursive call is the last operation. Some compilers can optimize tail recursion.

```fortran
PROGRAM test_tail_recursion
  IMPLICIT NONE
  
  INTEGER :: n = 5
  
  PRINT *, 'Sum of 1..', n, ':', sum_tail_recursive(n, 0)
  
END PROGRAM test_tail_recursion

!-----------------------------------------------------------
RECURSIVE FUNCTION sum_tail_recursive(n, accumulator) RESULT(sum)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: n, accumulator
  INTEGER :: sum
  
  ! Base case: return accumulator
  IF (n <= 0) THEN
    sum = accumulator
  ELSE
    ! Recursive call is the last operation (tail recursion)
    sum = sum_tail_recursive(n - 1, accumulator + n)
  END IF
  
END FUNCTION sum_tail_recursive
```

### Memoization

Cache results to avoid redundant calculations (especially useful for Fibonacci).

```fortran
PROGRAM test_memoization
  IMPLICIT NONE
  
  INTEGER :: n = 30
  
  PRINT *, 'Fibonacci with memoization:', fibonacci_memo(n)
  
END PROGRAM test_memoization

!-----------------------------------------------------------
RECURSIVE FUNCTION fibonacci_memo(n) RESULT(fib)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: n
  INTEGER :: fib
  
  ! Static array to cache results (persists between calls)
  INTEGER, SAVE :: cache(0:100) = -1
  
  ! Check if result is cached
  IF (cache(n) /= -1) THEN
    fib = cache(n)
    RETURN
  END IF
  
  ! Compute and cache result
  IF (n <= 0) THEN
    fib = 0
  ELSE IF (n == 1) THEN
    fib = 1
  ELSE
    fib = fibonacci_memo(n - 1) + fibonacci_memo(n - 2)
  END IF
  
  cache(n) = fib
  
END FUNCTION fibonacci_memo
```

---

## 8. Common Pitfalls and Solutions

### Pitfall 1: Infinite Recursion

```fortran
! ❌ BAD: No base case
RECURSIVE FUNCTION bad_recursion(n) RESULT(result)
  INTEGER :: result
  result = bad_recursion(n + 1)   ! Infinite recursion
END FUNCTION bad_recursion

! ✅ GOOD: Has base case
RECURSIVE FUNCTION good_recursion(n) RESULT(result)
  INTEGER, INTENT(IN) :: n
  INTEGER :: result
  IF (n <= 0) THEN
    result = 0
  ELSE
    result = good_recursion(n - 1) + n
  END IF
END FUNCTION good_recursion
```

### Pitfall 2: Stack Overflow

Deep recursion can cause stack overflow. Consider iterative solutions for very deep recursion.

```fortran
! This will cause stack overflow for large n
RECURSIVE FUNCTION deep_recursion(n) RESULT(result)
  INTEGER, INTENT(IN) :: n
  INTEGER :: result
  IF (n <= 1) THEN
    result = 1
  ELSE
    result = 1 + deep_recursion(n - 1)  ! Stack grows with each call
  END IF
END FUNCTION deep_recursion

! Use iteration or tail recursion instead
```

### Pitfall 3: Forgetting RECURSIVE Keyword

```fortran
! ❌ BAD: Missing RECURSIVE keyword
FUNCTION bad_factorial(n) RESULT(fact)
  INTEGER, INTENT(IN) :: n
  INTEGER :: fact
  IF (n <= 1) THEN
    fact = 1
  ELSE
    fact = n * bad_factorial(n - 1)   ! ERROR: Not declared RECURSIVE
  END IF
END FUNCTION bad_factorial

! ✅ GOOD: With RECURSIVE
RECURSIVE FUNCTION good_factorial(n) RESULT(fact)
  INTEGER, INTENT(IN) :: n
  INTEGER :: fact
  IF (n <= 1) THEN
    fact = 1
  ELSE
    fact = n * good_factorial(n - 1)
  END IF
END FUNCTION good_factorial
```

### Pitfall 4: Not Using INTENT Properly

```fortran
! ❌ BAD: Modifying INTENT(IN) argument
RECURSIVE FUNCTION bad_power(base, exp) RESULT(result)
  REAL, INTENT(IN) :: base
  INTEGER, INTENT(IN) :: exp
  REAL :: result
  ! Cannot modify base or exp
  base = base * base   ! ERROR
END FUNCTION bad_power

! ✅ GOOD: Use INTENT(IN) and don't modify
RECURSIVE FUNCTION good_power(base, exp) RESULT(result)
  REAL, INTENT(IN) :: base
  INTEGER, INTENT(IN) :: exp
  REAL :: result
  IF (exp == 0) THEN
    result = 1.0
  ELSE
    result = base * good_power(base, exp - 1)   ! Pass original base
  END IF
END FUNCTION good_power
```

---

## 9. Best Practices

### 1. Always Define a Base Case

```fortran
RECURSIVE FUNCTION safe_recursion(n) RESULT(result)
  INTEGER, INTENT(IN) :: n
  INTEGER :: result
  
  ! Clear base case first
  IF (n <= 0) THEN
    result = 0
    RETURN
  END IF
  
  ! Then recursive case
  result = n + safe_recursion(n - 1)
  
END FUNCTION safe_recursion
```

### 2. Use Tail Recursion When Possible

```fortran
! Standard recursion
RECURSIVE FUNCTION fact(n) RESULT(f)
  INTEGER, INTENT(IN) :: n
  INTEGER :: f
  IF (n <= 1) THEN
    f = 1
  ELSE
    f = n * fact(n - 1)   ! Not tail recursive
  END IF
END FUNCTION fact

! Tail recursive
RECURSIVE FUNCTION fact_tail(n, acc) RESULT(f)
  INTEGER, INTENT(IN) :: n, acc
  INTEGER :: f
  IF (n <= 1) THEN
    f = acc
  ELSE
    f = fact_tail(n - 1, n * acc)   ! Tail recursive
  END IF
END FUNCTION fact_tail
```

### 3. Document Recursive Functions Clearly

```fortran
!-----------------------------------------------------------
! PURPOSE: Computes the nth Fibonacci number recursively
!
! ARGUMENTS:
!   n - Non-negative integer (0, 1, 2, ...)
!
! RETURNS:
!   The nth Fibonacci number:
!   F(0) = 0, F(1) = 1, F(n) = F(n-1) + F(n-2)
!
! COMPLEXITY: O(2^n) time, O(n) space (without memoization)
!
! NOTE: Not efficient for large n (> 30) without memoization
!-----------------------------------------------------------
RECURSIVE FUNCTION fibonacci(n) RESULT(fib)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: n
  INTEGER :: fib
  ! ... implementation
END FUNCTION fibonacci
```

### 4. Consider Memoization for Performance

```fortran
MODULE memoized_fibonacci
  IMPLICIT NONE
  
  INTEGER, SAVE :: fib_cache(0:1000) = 0
  
CONTAINS
  
  RECURSIVE FUNCTION fib_memo(n) RESULT(fib)
    INTEGER, INTENT(IN) :: n
    INTEGER :: fib
    
    IF (n <= 0) THEN
      fib = 0
    ELSE IF (n == 1) THEN
      fib = 1
    ELSE IF (fib_cache(n) /= 0) THEN
      fib = fib_cache(n)
    ELSE
      fib = fib_memo(n - 1) + fib_memo(n - 2)
      fib_cache(n) = fib
    END IF
  END FUNCTION fib_memo
  
END MODULE memoized_fibonacci
```

### 5. Use Modules to Organize Recursive Functions

```fortran
MODULE recursive_algorithms
  IMPLICIT NONE
  
CONTAINS
  
  RECURSIVE FUNCTION factorial(n) RESULT(fact)
    INTEGER, INTENT(IN) :: n
    INTEGER :: fact
    IF (n <= 1) THEN
      fact = 1
    ELSE
      fact = n * factorial(n - 1)
    END IF
  END FUNCTION factorial
  
  RECURSIVE FUNCTION gcd(a, b) RESULT(g)
    INTEGER, INTENT(IN) :: a, b
    INTEGER :: g
    IF (b == 0) THEN
      g = a
    ELSE
      g = gcd(b, MOD(a, b))
    END IF
  END FUNCTION gcd
  
END MODULE recursive_algorithms

! Usage:
PROGRAM use_recursive
  USE recursive_algorithms
  IMPLICIT NONE
  PRINT *, factorial(5)
  PRINT *, gcd(48, 18)
END PROGRAM use_recursive
```

---

## 10. Summary

| Feature | Description |
|---------|-------------|
| **Keyword** | Must use `RECURSIVE` before `FUNCTION` |
| **Base Case** | Essential to prevent infinite recursion |
| **Recursive Case** | Function calls itself with modified arguments |
| **Stack Usage** | Each call adds to the call stack |
| **Performance** | Generally slower than iterative solutions |
| **Readability** | Often more intuitive for recursive problems |
| **Optimization** | Use tail recursion and memoization |
| **Memory** | Risk of stack overflow for deep recursion |

### When to Use Recursion

✅ **Use Recursion When:**
- The problem has a natural recursive structure
- The code is significantly clearer and easier to maintain
- The recursion depth is moderate (safe stack limit)
- You're working with tree/ graph structures

❌ **Avoid Recursion When:**
- The recursion depth is very large (thousands of calls)
- Performance is critical
- An iterative solution is straightforward
- Memory usage is a concern

### Quick Reference

```fortran
! Template for recursive functions
RECURSIVE FUNCTION function_name(args) RESULT(result)
  IMPLICIT NONE
  data_type, INTENT(IN) :: args
  data_type :: result
  
  IF (base_case_condition) THEN
    result = base_value
    RETURN
  ELSE
    ! Ensure progress toward base case
    result = expression_using_function_name(modified_args)
  END IF
  
END FUNCTION function_name
```