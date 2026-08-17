# Fortran 90 Basic Syntax

This note provides a comprehensive guide to the fundamental syntax and structure of Fortran 90, covering everything from program organization to operators and control structures.

---

## 1. Program Structure

A Fortran 90 program consists of a main program and optionally modules, subroutines, and functions. The basic structure follows a hierarchical organization.

### Main Program Structure

```fortran
PROGRAM program_name
  ! Declaration section
  IMPLICIT NONE
  ! Variable declarations
  ! ...
  
  ! Execution section
  ! Executable statements
  ! ...
  
  ! Termination
END PROGRAM program_name
```

### Complete Example

```fortran
PROGRAM hello_world
  IMPLICIT NONE
  ! This is a simple program that prints "Hello, World!"
  
  PRINT *, "Hello, World!"
  
END PROGRAM hello_world
```

### Program Layout

Fortran 90 uses **free-form source code**, meaning:
- Statements can start in any column
- Lines can be up to 132 characters
- No special column requirements (unlike Fortran 77's fixed form)

---

## 2. Comments

Comments in Fortran 90 start with an exclamation mark (`!`). Everything after `!` on a line is ignored by the compiler.

### Types of Comments

```fortran
! This is a full-line comment

PROGRAM comments_demo
  IMPLICIT NONE
  
  INTEGER :: x = 5  ! This is an inline comment
  
  ! Comments can span multiple lines
  ! by starting each line with an exclamation mark
  
  x = x + 1  ! More code with comment
END PROGRAM comments_demo
```

---

## 3. Case Sensitivity

Fortran 90 is **case-insensitive**. The following are all equivalent:

```fortran
PROGRAM my_program
program my_program
Program My_Program
```

However, **best practice** is:
- Use **UPPERCASE** for keywords (`PROGRAM`, `INTEGER`, `IF`, `DO`)
- Use **lowercase** for variables, functions, and subroutines
- Be consistent throughout your code

```fortran
PROGRAM consistent_style
  IMPLICIT NONE
  
  INTEGER :: my_variable = 10
  REAL :: result_value
  
  result_value = my_variable * 2.0
  
  PRINT *, result_value
  
END PROGRAM consistent_style
```

---

## 4. Lines and Continuation

### Line Length

- Maximum line length: **132 characters**
- Lines longer than 132 characters are non-standard and may cause compiler errors

### Line Continuation

Use an ampersand (`&`) at the end of a line to continue it.

```fortran
! Continuing a statement
long_statement = variable1 + variable2 + variable3 + &
                 variable4 + variable5 + variable6

! Continuing a character string
long_string = "This is a very long string that needs to be " // &
              "continued on the next line."
```

### Multiple Statements on One Line

Use a semicolon (`;`) to separate multiple statements on the same line.

```fortran
x = 1.0; y = 2.0; z = x + y
PRINT *, x, y, z
```

---

## 5. Data Types

Fortran 90 has several intrinsic data types:

### Integer Types

```fortran
INTEGER :: count          ! Default integer
INTEGER(KIND=4) :: i4     ! 4-byte integer
INTEGER(KIND=8) :: i8     ! 8-byte integer
INTEGER, PARAMETER :: short = SELECTED_INT_KIND(4)
```

### Real Types

```fortran
REAL :: x                 ! Default real (single precision)
REAL(KIND=8) :: y         ! Double precision
DOUBLE PRECISION :: z     ! Double precision (old style)
REAL, PARAMETER :: dp = KIND(0.0D0)  ! Kind parameter for double
```

### Character Types

```fortran
CHARACTER :: c            ! Single character
CHARACTER(LEN=20) :: name ! String of length 20
CHARACTER(LEN=*), PARAMETER :: greeting = "Hello" ! Automatic length
```

### Complex Types

```fortran
COMPLEX :: z              ! Complex number: (real, imag)
COMPLEX(KIND=8) :: zc     ! Double precision complex
z = (1.0, 2.0)            ! 1 + 2i
```

### Logical Types

```fortran
LOGICAL :: flag           ! .TRUE. or .FALSE.
LOGICAL :: is_valid = .TRUE.
LOGICAL :: is_done = .FALSE.
```

---

## 6. Variable Declaration

### Basic Declaration

Variables must be declared before use. The syntax is:

```fortran
data_type :: variable_name
```

### Examples

```fortran
PROGRAM declarations
  IMPLICIT NONE
  
  INTEGER :: i, j, k
  REAL :: x, y, z
  CHARACTER(LEN=20) :: first_name, last_name
  LOGICAL :: is_valid
  COMPLEX :: c
  
  ! Assignment
  i = 10
  x = 3.14159
  first_name = "John"
  is_valid = .TRUE.
  c = (1.0, 2.0)
  
END PROGRAM declarations
```

### Initializing Variables

Variables can be initialized at declaration:

```fortran
INTEGER :: counter = 0
REAL :: pi = 3.1415926535
CHARACTER(LEN=10) :: name = "Fortran"
LOGICAL :: done = .FALSE.
```

### Constants (PARAMETER)

Use the `PARAMETER` attribute for constants:

```fortran
REAL, PARAMETER :: PI = 3.1415926535
INTEGER, PARAMETER :: MAX_ITER = 1000
CHARACTER(LEN=*), PARAMETER :: VERSION = "1.0.0"
```

---

## 7. IMPLICIT NONE

**Always use `IMPLICIT NONE`** at the beginning of every program unit. This:

- Forces explicit declaration of all variables
- Prevents typos from creating new variables
- Makes code more readable and maintainable

```fortran
PROGRAM implicit_none_demo
  IMPLICIT NONE  ! Always include this
  
  INTEGER :: my_var = 5
  ! my_varr = 10  ! This would cause a compilation error
  
  PRINT *, my_var
  
END PROGRAM implicit_none_demo
```

### What Happens Without IMPLICIT NONE?

```fortran
! BAD: Without IMPLICIT NONE
PROGRAM bad_program
  INTEGER :: x = 5
  y = 10          ! y is automatically created (implicit typing)
  ! This can lead to hard-to-find bugs
  PRINT *, x, y
END PROGRAM bad_program
```

---

## 8. Assignment and Operators

### Assignment Statement

```fortran
variable = expression
```

### Arithmetic Operators

| Operator | Operation | Example |
|----------|-----------|---------|
| `+` | Addition | `x + y` |
| `-` | Subtraction | `x - y` |
| `*` | Multiplication | `x * y` |
| `/` | Division | `x / y` |
| `**` | Exponentiation | `x ** y` |

### Examples

```fortran
PROGRAM operators_demo
  IMPLICIT NONE
  
  INTEGER :: a = 10, b = 3
  REAL :: x = 5.0, y = 2.0
  
  PRINT *, "a + b =", a + b      ! 13
  PRINT *, "a - b =", a - b      ! 7
  PRINT *, "a * b =", a * b      ! 30
  PRINT *, "a / b =", a / b      ! 3 (integer division)
  PRINT *, "x / y =", x / y      ! 2.5
  PRINT *, "a ** b =", a ** b    ! 1000
  
END PROGRAM operators_demo
```

---

## 9. Arrays

### Declaration

```fortran
! One-dimensional arrays
INTEGER, DIMENSION(10) :: arr1          ! 10 elements, indices 1..10
REAL, DIMENSION(0:9) :: arr2            ! 10 elements, indices 0..9
REAL :: arr3(5)                         ! Alternative syntax

! Two-dimensional arrays
INTEGER, DIMENSION(3, 4) :: matrix      ! 3 rows, 4 columns
REAL :: table(5, 5)                     ! 5x5 array

! Allocatable arrays
REAL, DIMENSION(:), ALLOCATABLE :: dyn_arr
ALLOCATE(dyn_arr(100))
```

### Array Operations

```fortran
PROGRAM array_demo
  IMPLICIT NONE
  
  INTEGER, DIMENSION(5) :: arr = [1, 2, 3, 4, 5]
  INTEGER, DIMENSION(5) :: arr2
  
  ! Element-wise operations
  arr2 = arr * 2                     ! [2, 4, 6, 8, 10]
  arr2 = arr + 1                     ! [2, 3, 4, 5, 6]
  
  ! Array sections
  arr2(1:3) = 0                      ! Set first 3 elements to 0
  arr2(2:4) = arr(1:3)               ! Copy section
  
  ! Array functions
  PRINT *, "Sum:", SUM(arr)          ! 15
  PRINT *, "Max:", MAXVAL(arr)       ! 5
  PRINT *, "Size:", SIZE(arr)        ! 5
  
  ! Array assignment
  arr = [10, 20, 30, 40, 50]
  
END PROGRAM array_demo
```

### Array Constructors

```fortran
! Using square brackets
INTEGER, DIMENSION(5) :: arr = [1, 2, 3, 4, 5]

! Using implied DO loop
arr = [(i, i = 1, 5)]               ! [1, 2, 3, 4, 5]
arr = [(i*2, i = 1, 5)]             ! [2, 4, 6, 8, 10]

! 2D array constructor
INTEGER, DIMENSION(3, 3) :: matrix = RESHAPE([1,2,3,4,5,6,7,8,9], [3,3])
```

---

## 10. Control Structures

### IF Statements

#### Simple IF

```fortran
IF (condition) THEN
  ! Statements
END IF
```

#### IF-ELSE

```fortran
IF (condition) THEN
  ! Statements if true
ELSE
  ! Statements if false
END IF
```

#### IF-ELSE IF

```fortran
IF (condition1) THEN
  ! Statements for condition1
ELSE IF (condition2) THEN
  ! Statements for condition2
ELSE
  ! Statements for all other cases
END IF
```

#### Examples

```fortran
PROGRAM if_demo
  IMPLICIT NONE
  
  INTEGER :: score = 85
  
  IF (score >= 90) THEN
    PRINT *, "Grade: A"
  ELSE IF (score >= 80) THEN
    PRINT *, "Grade: B"
  ELSE IF (score >= 70) THEN
    PRINT *, "Grade: C"
  ELSE IF (score >= 60) THEN
    PRINT *, "Grade: D"
  ELSE
    PRINT *, "Grade: F"
  END IF
  
END PROGRAM if_demo
```

### SELECT CASE Statement

```fortran
SELECT CASE (expression)
  CASE (value1)
    ! Statements for value1
  CASE (value2, value3)
    ! Statements for value2 or value3
  CASE (lower:upper)
    ! Statements for values in range
  CASE DEFAULT
    ! Statements for all other cases
END SELECT
```

#### Example

```fortran
PROGRAM select_demo
  IMPLICIT NONE
  
  INTEGER :: day = 3
  
  SELECT CASE (day)
    CASE (1)
      PRINT *, "Monday"
    CASE (2)
      PRINT *, "Tuesday"
    CASE (3)
      PRINT *, "Wednesday"
    CASE (4)
      PRINT *, "Thursday"
    CASE (5)
      PRINT *, "Friday"
    CASE (6, 7)
      PRINT *, "Weekend"
    CASE DEFAULT
      PRINT *, "Invalid day"
  END SELECT
  
END PROGRAM select_demo
```

### DO Loops

#### Simple DO Loop

```fortran
DO index = start, end, step
  ! Statements
END DO
```

#### Examples

```fortran
PROGRAM do_demo
  IMPLICIT NONE
  
  INTEGER :: i, sum = 0
  
  ! Simple loop
  DO i = 1, 10
    sum = sum + i
  END DO
  PRINT *, "Sum of 1..10:", sum
  
  ! Loop with step
  DO i = 1, 10, 2
    PRINT *, i
  END DO
  
  ! Infinite loop with EXIT
  i = 1
  DO
    i = i + 1
    IF (i > 10) EXIT
  END DO
  
  ! CYCLE statement
  DO i = 1, 10
    IF (MOD(i, 2) == 0) CYCLE  ! Skip even numbers
    PRINT *, i
  END DO
  
END PROGRAM do_demo
```

### DO WHILE Loop

```fortran
DO WHILE (condition)
  ! Statements
END DO
```

#### Example

```fortran
PROGRAM dowhile_demo
  IMPLICIT NONE
  
  INTEGER :: x = 1
  
  DO WHILE (x <= 10)
    PRINT *, "x =", x
    x = x + 1
  END DO
  
END PROGRAM dowhile_demo
```

### Nested Loops

```fortran
PROGRAM nested_loop_demo
  IMPLICIT NONE
  
  INTEGER :: i, j
  
  ! Print a multiplication table
  DO i = 1, 5
    DO j = 1, 5
      WRITE(*, '(I4, $)') i * j
    END DO
    PRINT *  ! Newline
  END DO
  
END PROGRAM nested_loop_demo
```

---

## 11. Modules

Modules are used to group related procedures and data.

### Module Structure

```fortran
MODULE module_name
  IMPLICIT NONE
  
  ! Public declarations (accessible from outside)
  INTEGER, PUBLIC :: public_var
  
  ! Private declarations (only accessible inside module)
  INTEGER, PRIVATE :: private_var
  
  ! Subroutines and functions
CONTAINS
  
  SUBROUTINE sub1()
    ! ...
  END SUBROUTINE sub1
  
  FUNCTION func1()
    ! ...
  END FUNCTION func1
  
END MODULE module_name
```

### Using Modules

```fortran
PROGRAM use_module
  USE module_name     ! Access all public entities
  ! USE module_name, ONLY: public_var, sub1  ! Selective access
  IMPLICIT NONE
  
  ! Use the module's variables and procedures
  public_var = 10
  CALL sub1()
  
END PROGRAM use_module
```

### Complete Example

```fortran
MODULE math_constants
  IMPLICIT NONE
  
  REAL, PARAMETER :: PI = 3.1415926535
  REAL, PARAMETER :: E = 2.7182818285
  
  INTEGER, PARAMETER :: MAX_DIM = 100
  
CONTAINS
  
  FUNCTION factorial(n) RESULT(fact)
    INTEGER, INTENT(IN) :: n
    INTEGER :: fact
    INTEGER :: i
    
    fact = 1
    DO i = 2, n
      fact = fact * i
    END DO
  END FUNCTION factorial
  
END MODULE math_constants

!-----------------------------------------------------------
PROGRAM module_demo
  USE math_constants
  IMPLICIT NONE
  
  PRINT *, "PI =", PI
  PRINT *, "E =", E
  PRINT *, "MAX_DIM =", MAX_DIM
  PRINT *, "Factorial of 5 =", factorial(5)
  
END PROGRAM module_demo
```

---

## 12. Intrinsic Functions

Fortran 90 provides many built-in functions:

### Mathematical Functions

```fortran
PROGRAM math_functions
  IMPLICIT NONE
  
  REAL :: x = 45.0, y
  
  y = ABS(-10)                    ! Absolute value: 10
  y = SQRT(25.0)                  ! Square root: 5.0
  y = SIN(3.14159/2.0)            ! Sine: 1.0
  y = COS(0.0)                    ! Cosine: 1.0
  y = TAN(3.14159/4.0)            ! Tangent: 1.0
  y = EXP(1.0)                    ! Exponential: 2.71828
  y = LOG(2.71828)                ! Natural log: 1.0
  y = LOG10(100.0)                ! Base-10 log: 2.0
  
  ! Trigonometric functions in degrees
  y = SIN(x * 3.14159 / 180.0)    ! Convert to radians
  
  ! Min and Max
  y = MAX(10, 20, 30, 40)         ! 40
  y = MIN(10, 20, 30, 40)         ! 10
  
END PROGRAM math_functions
```

### Character Functions

```fortran
PROGRAM string_functions
  IMPLICIT NONE
  
  CHARACTER(LEN=20) :: str = "  Hello World  "
  
  PRINT *, "Length with spaces:", LEN(str)        ! 20
  PRINT *, "Trimmed length:", LEN_TRIM(str)       ! 13
  PRINT *, "Trimmed string:", TRIM(str)           ! "Hello World"
  PRINT *, "Uppercase:", UPPER(str)               ! (if implemented)
  
  ! Character comparisons
  IF (str == "Hello") THEN
    PRINT *, "Match"
  END IF
  
END PROGRAM string_functions
```

### Array Functions

```fortran
PROGRAM array_functions
  IMPLICIT NONE
  
  INTEGER, DIMENSION(5) :: arr = [1, 3, 5, 2, 4]
  
  PRINT *, "Size:", SIZE(arr)                      ! 5
  PRINT *, "Sum:", SUM(arr)                        ! 15
  PRINT *, "Max:", MAXVAL(arr)                    ! 5
  PRINT *, "Min:", MINVAL(arr)                    ! 1
  PRINT *, "Mean:", SUM(arr) / REAL(SIZE(arr))    ! 3.0
  
  ! Sorting and searching
  PRINT *, "Max location:", MAXLOC(arr)           ! 3
  PRINT *, "Min location:", MINLOC(arr)           ! 1
  
END PROGRAM array_functions
```

---

## 13. Common Syntax Patterns

### Program Template

```fortran
!-----------------------------------------------------------------------
! PROGRAM: program_name
! PURPOSE: Brief description of what the program does
! AUTHOR: Author name
! DATE: Date created
!-----------------------------------------------------------------------
PROGRAM program_name
  IMPLICIT NONE
  
  ! 1. Variable declarations
  ! 2. Constants (PARAMETER)
  ! 3. Interface blocks (if needed)
  
  ! Execution section
  ! 1. Initialize variables
  ! 2. Read input
  ! 3. Process data
  ! 4. Write output
  
END PROGRAM program_name
```

### Variable Declaration Patterns

```fortran
! Scalar variables
INTEGER :: i, j, k
REAL :: x, y, z
CHARACTER(LEN=20) :: name
LOGICAL :: flag

! Arrays
INTEGER, DIMENSION(10) :: arr
REAL, DIMENSION(3, 3) :: matrix
CHARACTER(LEN=20), DIMENSION(100) :: names

! Allocatable arrays
REAL, DIMENSION(:), ALLOCATABLE :: dyn_arr
INTEGER, DIMENSION(:, :), ALLOCATABLE :: dyn_matrix

! Constants
REAL, PARAMETER :: PI = 3.14159
INTEGER, PARAMETER :: MAX_ITER = 1000
```

---

## 14. Common Mistakes and Tips

### ❌ Forgetting IMPLICIT NONE

```fortran
! BAD
PROGRAM bad
  ! Missing IMPLICIT NONE
  integer :: x = 5
  y = 10  ! Bug: y is implicitly typed
END PROGRAM bad
```

### ✅ Always Use IMPLICIT NONE

```fortran
! GOOD
PROGRAM good
  IMPLICIT NONE
  INTEGER :: x = 5
  INTEGER :: y = 10  ! Explicit declaration
END PROGRAM good
```

### ❌ Using Old Fixed-Form Syntax

```fortran
! BAD (Fortran 77 style)
      PROGRAM OLD
      IMPLICIT NONE
      INTEGER X
      X = 5
      PRINT *, X
      END
```

### ✅ Use Free-Form Syntax

```fortran
! GOOD (Fortran 90+ style)
PROGRAM new
  IMPLICIT NONE
  INTEGER :: x = 5
  PRINT *, x
END PROGRAM new
```

### ❌ Mismatched Data Types

```fortran
! BAD
REAL :: x = 5 / 2    ! Integer division: x = 2.0
REAL :: y = 5.0 / 2  ! Real division: y = 2.5
```

### ✅ Use Explicit Type Conversions

```fortran
! GOOD
REAL :: x = REAL(5) / 2.0
REAL :: y = 5.0 / 2
```

### ❌ Exceeding Array Bounds

```fortran
! BAD
REAL, DIMENSION(5) :: arr
arr(6) = 10.0  ! Runtime error: out of bounds
```

### ✅ Check Array Bounds

```fortran
! GOOD
REAL, DIMENSION(5) :: arr
INTEGER :: idx = 5
arr(idx) = 10.0  ! Valid
```

---

## 15. Summary

### Key Points

| Feature | Description |
|---------|-------------|
| **Program Structure** | `PROGRAM` ... `END PROGRAM` |
| **Comments** | `!` for comments |
| **Case Sensitivity** | Case-insensitive, but use consistent style |
| **Line Continuation** | `&` at end of line |
| **Multiple Statements** | `;` to separate statements |
| **Data Types** | INTEGER, REAL, CHARACTER, LOGICAL, COMPLEX |
| **Declaration** | `type :: variable` |
| **IMPLICIT NONE** | Always include |
| **Assignment** | `variable = expression` |
| **Arrays** | `DIMENSION(n)` or `array(n)` |
| **Modules** | Group related procedures and data |
| **Intrinsic Functions** | Many built-in functions available |

### Quick Reference

```fortran
! Basic program skeleton
PROGRAM name
  IMPLICIT NONE
  ! Declarations
  ! Executable statements
END PROGRAM name

! Variable declaration
INTEGER :: i = 0
REAL :: x = 1.0
CHARACTER(LEN=20) :: str
LOGICAL :: flag = .TRUE.

! Array declaration
REAL, DIMENSION(10) :: arr
INTEGER :: matrix(3, 3)

! Control structures
IF (condition) THEN
  ! statements
ELSE IF (condition) THEN
  ! statements
ELSE
  ! statements
END IF

SELECT CASE (var)
  CASE (value)
    ! statements
  CASE DEFAULT
    ! statements
END SELECT

DO i = 1, 10
  ! statements
END DO

DO WHILE (condition)
  ! statements
END DO
```

### Best Practices Checklist

- [ ] Always use `IMPLICIT NONE`
- [ ] Declare all variables
- [ ] Use meaningful variable names
- [ ] Use uppercase for keywords, lowercase for variables
- [ ] Add comments to explain complex code
- [ ] Use modules to organize code
- [ ] Validate array bounds
- [ ] Use `INTENT` for procedure arguments
- [ ] Test edge cases
- [ ] Keep lines under 132 characters