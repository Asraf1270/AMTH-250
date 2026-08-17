# Fortran 90 Functions

This note provides a comprehensive explanation of functions in Fortran 90, including their syntax, usage, differences from subroutines, and best practices.

---

## 1. What is a Function?

A **function** is a reusable block of code that:
- **Returns a single value** through the function name
- Can be used in expressions (like mathematical functions)
- Takes input arguments and produces a result
- Should not modify its input arguments (pure functions)

Functions are ideal for:
- Mathematical computations (e.g., `sin(x)`, `sqrt(x)`)
- Converting one data type to another
- Retrieving calculated values that fit naturally as a single result
- Code that needs to be used in expressions

---

## 2. Basic Syntax

### Function Definition

```fortran
FUNCTION function_name (argument1, argument2, ...) RESULT(result_var)
  ! Declarations
  IMPLICIT NONE
  ! Arguments
  data_type, INTENT(IN) :: arg1, arg2, ...
  ! Result variable
  data_type :: result_var
  ! Local variables
  data_type :: local_var1, local_var2, ...
  ! Executable statements
  ! ...
  result_var = expression
END FUNCTION function_name
```

### Alternative Syntax (Without RESULT)

```fortran
FUNCTION function_name (argument1, argument2, ...)
  IMPLICIT NONE
  data_type, INTENT(IN) :: arg1, arg2, ...
  data_type :: function_name    ! Same name as function
  ! ...
  function_name = expression
END FUNCTION function_name
```

### Calling a Function

```fortran
! Using in an expression
result = function_name (argument1, argument2, ...)

! Direct use
PRINT *, function_name(a, b)
```

---

## 3. The RESULT Clause

The `RESULT` clause allows you to specify a separate name for the return value, which is **strongly recommended** for clarity.

### Benefits of Using RESULT:
- Avoids confusion between function name and return variable
- Makes the code more readable
- Prevents errors when function name is used recursively

```fortran
! Good: Using RESULT
FUNCTION square(x) RESULT(ans)
  IMPLICIT NONE
  REAL, INTENT(IN) :: x
  REAL :: ans
  ans = x * x
END FUNCTION square

! Okay but less clear
FUNCTION square(x)
  IMPLICIT NONE
  REAL, INTENT(IN) :: x
  REAL :: square
  square = x * x
END FUNCTION square
```

---

## 4. Complete Examples

### Example 1: Simple Mathematical Function

```fortran
PROGRAM test_simple_function
  IMPLICIT NONE
  
  REAL :: radius = 3.0
  REAL :: area
  
  ! Using the function in an expression
  area = circle_area(radius)
  
  PRINT *, 'Radius:', radius
  PRINT *, 'Area:', area
  
  ! Direct use in output
  PRINT *, 'Area of circle with radius 5:', circle_area(5.0)
  
END PROGRAM test_simple_function

!-----------------------------------------------------------
FUNCTION circle_area(r) RESULT(area)
  IMPLICIT NONE
  
  REAL, INTENT(IN) :: r
  REAL :: area
  REAL, PARAMETER :: PI = 3.1415926535
  
  area = PI * r * r
  
END FUNCTION circle_area
```

### Example 2: Function with Multiple Arguments

```fortran
PROGRAM test_multiple_args
  IMPLICIT NONE
  
  REAL :: x = 2.0, y = 3.0
  
  PRINT *, 'Distance from origin:', distance(x, y)
  PRINT *, 'Hypotenuse of 3 and 4:', pythagorean(3.0, 4.0)
  
END PROGRAM test_multiple_args

!-----------------------------------------------------------
FUNCTION distance(x, y) RESULT(dist)
  IMPLICIT NONE
  
  REAL, INTENT(IN) :: x, y
  REAL :: dist
  
  dist = SQRT(x*x + y*y)
  
END FUNCTION distance

!-----------------------------------------------------------
FUNCTION pythagorean(a, b) RESULT(c)
  IMPLICIT NONE
  
  REAL, INTENT(IN) :: a, b
  REAL :: c
  
  c = SQRT(a**2 + b**2)
  
END FUNCTION pythagorean
```

### Example 3: Function with Arrays

```fortran
PROGRAM test_array_function
  IMPLICIT NONE
  
  REAL, DIMENSION(5) :: values = [1.0, 2.0, 3.0, 4.0, 5.0]
  REAL :: avg
  
  avg = array_mean(values)
  
  PRINT *, 'Values:', values
  PRINT *, 'Mean:', avg
  PRINT *, 'Standard deviation:', std_dev(values, avg)
  
END PROGRAM test_array_function

!-----------------------------------------------------------
FUNCTION array_mean(arr) RESULT(mean)
  IMPLICIT NONE
  
  REAL, DIMENSION(:), INTENT(IN) :: arr
  REAL :: mean
  
  mean = SUM(arr) / REAL(SIZE(arr))
  
END FUNCTION array_mean

!-----------------------------------------------------------
FUNCTION std_dev(arr, mean) RESULT(sd)
  IMPLICIT NONE
  
  REAL, DIMENSION(:), INTENT(IN) :: arr
  REAL, INTENT(IN) :: mean
  REAL :: sd
  
  REAL :: variance
  INTEGER :: n
  
  n = SIZE(arr)
  variance = SUM((arr - mean)**2) / REAL(n)
  sd = SQRT(variance)
  
END FUNCTION std_dev
```

### Example 4: Character String Functions

```fortran
PROGRAM test_string_functions
  IMPLICIT NONE
  
  CHARACTER(LEN=20) :: name = "John Smith"
  CHARACTER(LEN=30) :: full_name
  
  PRINT *, 'Original:', name
  PRINT *, 'Length:', string_length(name)
  PRINT *, 'Uppercase:', to_upper(name)
  
  full_name = concatenate("Mr.", name)
  PRINT *, 'Full name:', full_name
  
END PROGRAM test_string_functions

!-----------------------------------------------------------
FUNCTION string_length(str) RESULT(len_str)
  IMPLICIT NONE
  
  CHARACTER(LEN=*), INTENT(IN) :: str
  INTEGER :: len_str
  
  len_str = LEN_TRIM(str)    ! Length without trailing spaces
  
END FUNCTION string_length

!-----------------------------------------------------------
FUNCTION to_upper(str) RESULT(uppercase)
  IMPLICIT NONE
  
  CHARACTER(LEN=*), INTENT(IN) :: str
  CHARACTER(LEN=LEN(str)) :: uppercase
  
  INTEGER :: i
  
  DO i = 1, LEN(str)
    IF (str(i:i) >= 'a' .AND. str(i:i) <= 'z') THEN
      uppercase(i:i) = ACHAR(IACHAR(str(i:i)) - 32)
    ELSE
      uppercase(i:i) = str(i:i)
    END IF
  END DO
  
END FUNCTION to_upper

!-----------------------------------------------------------
FUNCTION concatenate(prefix, name) RESULT(full)
  IMPLICIT NONE
  
  CHARACTER(LEN=*), INTENT(IN) :: prefix, name
  CHARACTER(LEN=LEN(TRIM(prefix)) + LEN(TRIM(name)) + 1) :: full
  
  full = TRIM(prefix) // ' ' // TRIM(name)
  
END FUNCTION concatenate
```

---

## 5. Elemental Functions

The `ELEMENTAL` keyword allows a function to operate on arrays element-by-element. This is very powerful for array operations.

```fortrain
PROGRAM test_elemental
  IMPLICIT NONE
  
  REAL, DIMENSION(5) :: x = [1.0, 2.0, 3.0, 4.0, 5.0]
  REAL, DIMENSION(5) :: y
  
  ! The elemental function works on arrays automatically
  y = square_root(x)     ! Element-wise operation
  
  PRINT *, 'x:', x
  PRINT *, 'sqrt(x):', y
  
  ! Also works with scalars
  PRINT *, 'sqrt(25.0):', square_root(25.0)
  
END PROGRAM test_elemental

!-----------------------------------------------------------
ELEMENTAL FUNCTION square_root(x) RESULT(sqrt_x)
  IMPLICIT NONE
  
  REAL, INTENT(IN) :: x
  REAL :: sqrt_x
  
  sqrt_x = SQRT(x)
  
END FUNCTION square_root
```

---

## 6. Pure Functions

The `PURE` keyword indicates that a function has no side effects:
- Doesn't modify its arguments
- Doesn't perform I/O operations
- Doesn't use global variables (except PARAMETER)
- Returns the same result for the same inputs

Pure functions are useful for:
- Parallel computing
- Optimizations
- Clear, predictable code

```fortran
PROGRAM test_pure
  IMPLICIT NONE
  
  REAL :: a = 5.0, b = 3.0
  
  PRINT *, 'Hypotenuse:', hypotenuse(a, b)
  
END PROGRAM test_pure

!-----------------------------------------------------------
PURE FUNCTION hypotenuse(side1, side2) RESULT(hyp)
  IMPLICIT NONE
  
  REAL, INTENT(IN) :: side1, side2
  REAL :: hyp
  
  hyp = SQRT(side1**2 + side2**2)
  
END FUNCTION hypotenuse
```

---

## 7. Functions in Modules

Putting functions in modules is the recommended way to organize code. Modules provide automatic interface checking.

```fortran
MODULE math_functions
  IMPLICIT NONE
  
CONTAINS
  
  ! Factorial function
  FUNCTION factorial(n) RESULT(fact)
    INTEGER, INTENT(IN) :: n
    INTEGER :: fact
    INTEGER :: i
    
    fact = 1
    DO i = 1, n
      fact = fact * i
    END DO
  END FUNCTION factorial
  
  ! Power function
  FUNCTION power(base, exponent) RESULT(result)
    REAL, INTENT(IN) :: base
    INTEGER, INTENT(IN) :: exponent
    REAL :: result
    INTEGER :: i
    
    result = 1.0
    DO i = 1, exponent
      result = result * base
    END DO
  END FUNCTION power
  
END MODULE math_functions

!-----------------------------------------------------------
PROGRAM use_math_functions
  USE math_functions
  IMPLICIT NONE
  
  PRINT *, 'Factorial of 5:', factorial(5)
  PRINT *, '2^10:', power(2.0, 10)
  
END PROGRAM use_math_functions
```

---

## 8. Generic Functions

You can define multiple functions with the same name but different argument types using an interface block.

```fortran
MODULE generic_functions
  IMPLICIT NONE
  
  INTERFACE square
    MODULE PROCEDURE square_int, square_real, square_complex
  END INTERFACE square
  
CONTAINS
  
  FUNCTION square_int(x) RESULT(ans)
    INTEGER, INTENT(IN) :: x
    INTEGER :: ans
    ans = x * x
  END FUNCTION square_int
  
  FUNCTION square_real(x) RESULT(ans)
    REAL, INTENT(IN) :: x
    REAL :: ans
    ans = x * x
  END FUNCTION square_real
  
  FUNCTION square_complex(x) RESULT(ans)
    COMPLEX, INTENT(IN) :: x
    COMPLEX :: ans
    ans = x * x
  END FUNCTION square_complex
  
END MODULE generic_functions

!-----------------------------------------------------------
PROGRAM test_generic
  USE generic_functions
  IMPLICIT NONE
  
  PRINT *, 'Square of 5 (integer):', square(5)
  PRINT *, 'Square of 3.5 (real):', square(3.5)
  PRINT *, 'Square of (2+3i):', square((2.0, 3.0))
  
END PROGRAM test_generic
```

---

## 9. Optional and Keyword Arguments

Functions can have optional arguments, similar to subroutines.

```fortran
PROGRAM test_optional
  IMPLICIT NONE
  
  PRINT *, 'Average of 5 numbers:', average(1.0, 2.0, 3.0, 4.0, 5.0)
  PRINT *, 'Average with weight:', average(1.0, 2.0, 3.0, weight=0.8)
  
END PROGRAM test_optional

!-----------------------------------------------------------
FUNCTION average(values, weight) RESULT(avg)
  IMPLICIT NONE
  
  REAL, DIMENSION(:), INTENT(IN) :: values
  REAL, INTENT(IN), OPTIONAL :: weight
  REAL :: avg
  REAL :: total
  INTEGER :: n
  
  n = SIZE(values)
  total = SUM(values)
  
  IF (PRESENT(weight)) THEN
    avg = (1.0 - weight) * (total / REAL(n)) + weight * MAXVAL(values)
  ELSE
    avg = total / REAL(n)
  END IF
  
END FUNCTION average
```

---

## 10. Recursive Functions

Functions can call themselves. Use the `RECURSIVE` keyword.

```fortran
PROGRAM test_recursive_factorial
  IMPLICIT NONE
  
  INTEGER :: n = 5
  
  PRINT *, 'Factorial of', n, 'is:', factorial_recursive(n)
  PRINT *, 'Fibonacci of', n, 'is:', fibonacci(n)
  
END PROGRAM test_recursive_factorial

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
RECURSIVE FUNCTION fibonacci(n) RESULT(fib)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: n
  INTEGER :: fib
  
  IF (n <= 0) THEN
    fib = 0
  ELSE IF (n == 1) THEN
    fib = 1
  ELSE
    fib = fibonacci(n - 1) + fibonacci(n - 2)
  END IF
  
END FUNCTION fibonacci
```

---

## 11. Function vs. Subroutine Comparison

| Feature | Function | Subroutine |
|---------|----------|------------|
| **Returns Value** | Yes, through function name | No (returns via arguments) |
| **Called in Expressions** | Yes | No |
| **Number of Return Values** | Exactly 1 | Unlimited (through arguments) |
| **Syntax** | `result = func(args)` | `CALL sub(args)` |
| **Can Modify Arguments** | Should not (use PURE) | Yes (with INTENT) |
| **Use Case** | Mathematical operations | Complex operations |
| **Typical Purpose** | Calculate a single result | Perform actions, modify variables |
| **Syntax** | `FUNCTION func(args) RESULT(r)` | `SUBROUTINE sub(args)` |

---

## 12. Best Practices

### 1. Always Use RESULT Clause

```fortran
! Good
FUNCTION square(x) RESULT(ans)
  REAL, INTENT(IN) :: x
  REAL :: ans
  ans = x * x
END FUNCTION square

! Avoid
FUNCTION square(x)
  REAL, INTENT(IN) :: x
  REAL :: square
  square = x * x
END FUNCTION square
```

### 2. Use PURE When Possible

```fortran
PURE FUNCTION add(a, b) RESULT(sum)
  REAL, INTENT(IN) :: a, b
  REAL :: sum
  sum = a + b
END FUNCTION add
```

### 3. Use ELEMENTAL for Array Operations

```fortran
ELEMENTAL FUNCTION increment(x) RESULT(y)
  REAL, INTENT(IN) :: x
  REAL :: y
  y = x + 1.0
END FUNCTION increment
```

### 4. Keep Functions Focused and Simple

```fortran
! Good: Single purpose
FUNCTION circle_area(radius) RESULT(area)
  area = PI * radius * radius
END FUNCTION

! Bad: Does too much
FUNCTION circle_stuff(radius) RESULT(result)
  ! Calculates area, circumference, volume, etc.
END FUNCTION
```

### 5. Use Meaningful Names

```fortran
! Good
FUNCTION calculate_mean(values) RESULT(mean)

! Bad
FUNCTION calc(x) RESULT(y)
```

### 6. Document Your Functions

```fortran
!-----------------------------------------------------------
! PURPOSE: Calculates the binomial coefficient C(n,k)
!
! ARGUMENTS:
!   n - Total number of items (INTEGER, INTENT(IN))
!   k - Number of items to choose (INTEGER, INTENT(IN))
!
! RETURNS:
!   The binomial coefficient as INTEGER
!
! NOTES: Uses the formula C(n,k) = n! / (k! * (n-k)!)
!-----------------------------------------------------------
FUNCTION binomial(n, k) RESULT(coeff)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: n, k
  INTEGER :: coeff
  coeff = factorial(n) / (factorial(k) * factorial(n - k))
END FUNCTION binomial
```

---

## 13. Common Mistakes and Tips

### ❌ Forgetting to Assign the Result

```fortran
! Bad
FUNCTION bad_divide(a, b) RESULT(result)
  REAL, INTENT(IN) :: a, b
  REAL :: result
  ! Missing assignment: result = a / b
END FUNCTION bad_divide
```

### ✅ Always Assign the Result Variable

```fortran
! Good
FUNCTION good_divide(a, b) RESULT(result)
  REAL, INTENT(IN) :: a, b
  REAL :: result
  result = a / b
END FUNCTION good_divide
```

### ❌ Trying to Modify INTENT(IN) Arguments

```fortran
! Bad
FUNCTION bad_modify(x) RESULT(y)
  REAL, INTENT(IN) :: x
  REAL :: y
  x = x * 2.0    ! Error: x is INTENT(IN)
  y = x
END FUNCTION bad_modify
```

### ✅ Use INTENT(INOUT) if Needed

```fortran
! Good
FUNCTION good_modify(x) RESULT(y)
  REAL, INTENT(INOUT) :: x   ! Now x can be modified
  REAL :: y
  x = x * 2.0
  y = x
END FUNCTION good_modify
```

### ❌ Using Functions for Side Effects

```fortran
! Bad: Function with side effects
FUNCTION bad_func(x) RESULT(y)
  INTEGER, INTENT(IN) :: x
  INTEGER :: y
  OPEN(10, FILE='output.txt')   ! Side effect: File I/O
  WRITE(10, *) x
  CLOSE(10)
  y = x * 2
END FUNCTION bad_func
```

### ✅ Use Subroutines for Side Effects

```fortran
! Good: Use subroutine for I/O
SUBROUTINE write_to_file(x)
  INTEGER, INTENT(IN) :: x
  OPEN(10, FILE='output.txt')
  WRITE(10, *) x
  CLOSE(10)
END SUBROUTINE write_to_file

! Use function for calculation
FUNCTION double_value(x) RESULT(y)
  INTEGER, INTENT(IN) :: x
  INTEGER :: y
  y = x * 2
END FUNCTION double_value
```

---

## 14. Summary

| Feature | Description |
|---------|-------------|
| **Definition** | `FUNCTION name(args) RESULT(ret)` ... `END FUNCTION` |
| **Calling** | `result = function_name(args)` |
| **Return Value** | Exactly one, through RESULT variable |
| **Intent** | Usually `INTENT(IN)` (shouldn't modify arguments) |
| **RESULT Clause** | Recommended for clarity |
| **ELEMENTAL** | Works on arrays element-by-element |
| **PURE** | No side effects, deterministic |
| **RECURSIVE** | Can call itself |
| **Generic** | Same name for different argument types |
| **Optional Args** | Use `OPTIONAL` and `PRESENT()` |
| **Best Practice** | Put functions in modules for interface checking |