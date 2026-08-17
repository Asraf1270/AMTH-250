# Fortran 90 Subroutines

This note provides a comprehensive explanation of subroutines in Fortran 90, including their syntax, usage, and best practices.

---

## 1. What is a Subroutine?

A **subroutine** is a reusable block of code that performs a specific task. Unlike functions, subroutines:

- **Do not return a value** directly through the function name
- Can return **multiple values** through arguments
- Are called using the `CALL` statement
- Can modify their input arguments (if declared with appropriate intent)

Subroutines are ideal for:
- Performing operations that don't naturally fit as a single return value
- Tasks that modify multiple variables
- Code that needs to be executed from multiple places
- Breaking complex programs into manageable pieces

---

## 2. Basic Syntax

### Subroutine Definition

```fortran
SUBROUTINE subroutine_name (argument1, argument2, ...)
  ! Declarations
  IMPLICIT NONE
  ! Arguments
  data_type, INTENT(in|out|inout) :: arg1, arg2, ...
  ! Local variables
  data_type :: local_var1, local_var2, ...
  ! Executable statements
  ! ...
END SUBROUTINE subroutine_name
```

### Calling a Subroutine

```fortran
CALL subroutine_name (argument1, argument2, ...)
```

---

## 3. Argument Intent

The `INTENT` attribute specifies how arguments are used within the subroutine:

| Intent | Description | Example |
|--------|-------------|---------|
| **`INTENT(IN)`** | Argument is read-only; cannot be modified | `INTEGER, INTENT(IN) :: x` |
| **`INTENT(OUT)`** | Argument is written to; old value is discarded | `INTEGER, INTENT(OUT) :: result` |
| **`INTENT(INOUT)`** | Argument can be read and modified | `INTEGER, INTENT(INOUT) :: x` |

### Best Practice:
Always specify `INTENT` for all arguments. This:
- Makes the code more readable
- Helps catch errors at compile time
- Allows compiler optimizations

---

## 4. Complete Examples

### Example 1: Simple Subroutine (No Arguments)

```fortran
PROGRAM test_subroutine
  IMPLICIT NONE
  
  PRINT *, 'Before calling subroutine'
  CALL print_message()
  PRINT *, 'After calling subroutine'
  
END PROGRAM test_subroutine

!-----------------------------------------------------------
SUBROUTINE print_message()
  IMPLICIT NONE
  
  PRINT *, 'Hello from the subroutine!'
  
END SUBROUTINE print_message
```

### Example 2: Subroutine with IN Arguments

```fortran
PROGRAM calc_area
  IMPLICIT NONE
  
  REAL :: radius = 5.0
  REAL :: area, circumference
  
  CALL circle_properties(radius, area, circumference)
  
  PRINT *, 'Radius:', radius
  PRINT *, 'Area:', area
  PRINT *, 'Circumference:', circumference
  
END PROGRAM calc_area

!-----------------------------------------------------------
SUBROUTINE circle_properties(r, area, circ)
  IMPLICIT NONE
  
  ! Arguments
  REAL, INTENT(IN) :: r          ! Input only
  REAL, INTENT(OUT) :: area      ! Output only
  REAL, INTENT(OUT) :: circ      ! Output only
  
  ! Local constant
  REAL, PARAMETER :: PI = 3.1415926535
  
  ! Calculations
  area = PI * r * r
  circ = 2.0 * PI * r
  
END SUBROUTINE circle_properties
```

### Example 3: Subroutine with INOUT Arguments

```fortran
PROGRAM swap_test
  IMPLICIT NONE
  
  INTEGER :: a = 10, b = 20
  
  PRINT *, 'Before swap: a =', a, 'b =', b
  CALL swap_values(a, b)
  PRINT *, 'After swap: a =', a, 'b =', b
  
END PROGRAM swap_test

!-----------------------------------------------------------
SUBROUTINE swap_values(x, y)
  IMPLICIT NONE
  
  INTEGER, INTENT(INOUT) :: x, y   ! Both read and modified
  INTEGER :: temp
  
  temp = x
  x = y
  y = temp
  
END SUBROUTINE swap_values
```

### Example 4: Subroutine with Arrays

```fortran
PROGRAM array_operations
  IMPLICIT NONE
  
  INTEGER, DIMENSION(5) :: numbers = [1, 2, 3, 4, 5]
  INTEGER :: sum
  
  CALL sum_array(numbers, sum)
  PRINT *, 'Array:', numbers
  PRINT *, 'Sum:', sum
  
  CALL double_array(numbers)
  PRINT *, 'After doubling:', numbers
  
END PROGRAM array_operations

!-----------------------------------------------------------
SUBROUTINE sum_array(arr, total)
  IMPLICIT NONE
  
  INTEGER, DIMENSION(:), INTENT(IN) :: arr    ! Assumed-shape array
  INTEGER, INTENT(OUT) :: total
  
  INTEGER :: i
  
  total = 0
  DO i = 1, SIZE(arr)
    total = total + arr(i)
  END DO
  
END SUBROUTINE sum_array

!-----------------------------------------------------------
SUBROUTINE double_array(arr)
  IMPLICIT NONE
  
  INTEGER, DIMENSION(:), INTENT(INOUT) :: arr
  
  INTEGER :: i
  
  DO i = 1, SIZE(arr)
    arr(i) = arr(i) * 2
  END DO
  
END SUBROUTINE double_array
```

---

## 5. Optional Arguments

You can make arguments optional using the `OPTIONAL` attribute. Check if an argument is present using the `PRESENT()` function.

```fortran
PROGRAM optional_test
  IMPLICIT NONE
  
  INTEGER :: x = 10
  
  CALL print_value(x)                    ! Only required argument
  CALL print_value(x, 'Value is: ')      ! Both arguments
  
END PROGRAM optional_test

!-----------------------------------------------------------
SUBROUTINE print_value(val, prefix)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: val
  CHARACTER(LEN=*), INTENT(IN), OPTIONAL :: prefix
  
  IF (PRESENT(prefix)) THEN
    PRINT *, TRIM(prefix), val
  ELSE
    PRINT *, 'Value:', val
  END IF
  
END SUBROUTINE print_value
```

---

## 6. Keyword Arguments

When calling a subroutine, you can use **keyword arguments** to specify arguments by name. This is especially useful for subroutines with many arguments or optional arguments.

```fortran
PROGRAM keyword_test
  IMPLICIT NONE
  
  INTEGER :: a = 5, b = 3, result
  
  ! Positional arguments
  CALL add_numbers(a, b, result)
  
  ! Keyword arguments (order doesn't matter)
  CALL add_numbers(b=a, a=b, result=result)
  CALL add_numbers(result=result, a=a, b=b)
  
END PROGRAM keyword_test

!-----------------------------------------------------------
SUBROUTINE add_numbers(x, y, sum)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: x, y
  INTEGER, INTENT(OUT) :: sum
  
  sum = x + y
  
END SUBROUTINE add_numbers
```

---

## 7. Local Variables

Variables declared inside a subroutine are **local** and exist only while the subroutine is executing.

```fortran
SUBROUTINE example_local()
  IMPLICIT NONE
  
  INTEGER :: local_var     ! Exists only during subroutine execution
  REAL :: temp_result
  LOGICAL :: flag
  
  local_var = 10
  temp_result = 45.6
  flag = .TRUE.
  
  ! These variables cannot be accessed outside this subroutine
  
END SUBROUTINE example_local
```

### The SAVE Attribute

By default, local variables are reinitialized each time the subroutine is called. Use the `SAVE` attribute to preserve their values between calls.

```fortran
SUBROUTINE counter_sub()
  IMPLICIT NONE
  
  INTEGER, SAVE :: call_count = 0  ! Initialized once, value preserved
  
  call_count = call_count + 1
  PRINT *, 'This subroutine has been called', call_count, 'times'
  
END SUBROUTINE counter_sub
```

---

## 8. Subroutines in Modules

Putting subroutines in **modules** is the recommended way to organize code. Modules automatically handle interface checking.

```fortran
MODULE math_operations
  IMPLICIT NONE
  
CONTAINS
  
  SUBROUTINE add(x, y, result)
    INTEGER, INTENT(IN) :: x, y
    INTEGER, INTENT(OUT) :: result
    result = x + y
  END SUBROUTINE add
  
  SUBROUTINE multiply(x, y, result)
    INTEGER, INTENT(IN) :: x, y
    INTEGER, INTENT(OUT) :: result
    result = x * y
  END SUBROUTINE multiply
  
END MODULE math_operations

!-----------------------------------------------------------
PROGRAM use_module
  USE math_operations
  IMPLICIT NONE
  
  INTEGER :: a = 10, b = 5, c
  
  CALL add(a, b, c)
  PRINT *, 'Sum:', c
  
  CALL multiply(a, b, c)
  PRINT *, 'Product:', c
  
END PROGRAM use_module
```

---

## 9. Recursive Subroutines

Subroutines can call themselves (recursion). You need to declare them with the `RECURSIVE` keyword.

```fortran
PROGRAM recursive_test
  IMPLICIT NONE
  
  INTEGER :: n = 5
  
  CALL print_numbers(n)
  
END PROGRAM recursive_test

!-----------------------------------------------------------
RECURSIVE SUBROUTINE print_numbers(n)
  IMPLICIT NONE
  
  INTEGER, INTENT(IN) :: n
  
  IF (n > 0) THEN
    CALL print_numbers(n - 1)   ! Recursive call
    PRINT *, n
  END IF
  
END SUBROUTINE print_numbers
```

---

## 10. Best Practices

### 1. Always Use IMPLICIT NONE

```fortran
SUBROUTINE example()
  IMPLICIT NONE   ! Always include this
  ! ...
END SUBROUTINE example
```

### 2. Specify INTENT for All Arguments

```fortran
SUBROUTINE process_data(input, output, temp)
  IMPLICIT NONE
  
  REAL, INTENT(IN) :: input      ! Read-only
  REAL, INTENT(OUT) :: output    ! Write-only
  REAL, INTENT(INOUT) :: temp    ! Read and write
  ! ...
END SUBROUTINE process_data
```

### 3. Use Meaningful Names

```fortran
! Good
SUBROUTINE calculate_statistics(data, mean, variance)
  REAL, DIMENSION(:), INTENT(IN) :: data
  REAL, INTENT(OUT) :: mean, variance

! Bad
SUBROUTINE calc(a, b, c)
  REAL, DIMENSION(:), INTENT(IN) :: a
  REAL, INTENT(OUT) :: b, c
```

### 4. Keep Subroutines Focused

Each subroutine should do **one thing** and do it well. If a subroutine is doing too much, break it into smaller subroutines.

```fortran
! Good: Single responsibility
SUBROUTINE read_data(filename, data)
  ! Only reads data from file
END SUBROUTINE read_data

SUBROUTINE process_data(data)
  ! Only processes data
END SUBROUTINE process_data

! Bad: Does everything
SUBROUTINE read_and_process(filename, data)
  ! Reads file, processes data, writes output...
END SUBROUTINE read_and_process
```

### 5. Document Your Subroutines

Use comments to explain what the subroutine does, what arguments mean, and any assumptions.

```fortran
!-----------------------------------------------------------
! PURPOSE: Calculates the factorial of a positive integer
! 
! ARGUMENTS:
!   n - Positive integer (INTENT(IN))
!   result - Factorial of n (INTENT(OUT))
!
! NOTES: Uses iterative algorithm (more efficient than recursive)
!-----------------------------------------------------------
SUBROUTINE factorial(n, result)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: n
  INTEGER, INTENT(OUT) :: result
  ! ...
END SUBROUTINE factorial
```

---

## 11. Common Mistakes and Tips

### ❌ Forgetting INTENT

```fortran
! Bad
SUBROUTINE bad(x)
  INTEGER :: x    ! No intent specified
  x = x + 1
END SUBROUTINE bad
```

### ✅ Always Specify INTENT

```fortran
! Good
SUBROUTINE good(x)
  INTEGER, INTENT(INOUT) :: x
  x = x + 1
END SUBROUTINE good
```

### ❌ Using Outdated Fixed-Form Syntax

```fortran
! Bad (Fortran 77 style)
SUBROUTINE OLD(X)
  INTEGER X
  X = X + 1
  RETURN
  END
```

### ✅ Use Free-Form Syntax

```fortran
! Good (Fortran 90+ style)
SUBROUTINE new(x)
  IMPLICIT NONE
  INTEGER, INTENT(INOUT) :: x
  x = x + 1
END SUBROUTINE new
```

### ❌ Not Using Modules for Interfaces

```fortran
! Bad: No explicit interface
SUBROUTINE calc(a, b)
  ! ...
END SUBROUTINE calc
```

### ✅ Put Subroutines in Modules

```fortran
MODULE my_module
CONTAINS
  SUBROUTINE calc(a, b)
    ! ...
  END SUBROUTINE calc
END MODULE my_module
```

---

## 12. Summary

| Feature | Description |
|---------|-------------|
| **Definition** | `SUBROUTINE name(args)` ... `END SUBROUTINE` |
| **Calling** | `CALL name(args)` |
| **Return Values** | Through `INTENT(OUT)` or `INTENT(INOUT)` arguments |
| **Intent Types** | `IN` (read-only), `OUT` (write-only), `INOUT` (read/write) |
| **Optional Args** | Use `OPTIONAL` attribute and `PRESENT()` function |
| **Keyword Args** | Specify by name: `name(arg=value)` |
| **Local Variables** | Exist only during subroutine execution |
| **SAVE Attribute** | Preserves local variable values between calls |
| **Recursive** | Use `RECURSIVE` keyword |
| **Best Practice** | Put subroutines in modules for interface checking |