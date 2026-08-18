# Fortran 90 Programming — Complete Beginner-Friendly Study Notes

These notes focus specifically on **Fortran 90 (F90)** and cover the syntax and programming concepts you need for beginner-to-intermediate programming.

---

# 1. What is Fortran 90?

**Fortran** stands for **FORmula TRANslation**. It is a programming language especially well known for:

* Scientific computing
* Numerical analysis
* Mathematical calculations
* Engineering applications
* High-performance computing

**Fortran 90** introduced many improvements over older Fortran versions, including:

* Free-form source code
* `DO` loops
* `IF-THEN-ELSE`
* `SELECT CASE`
* Arrays
* Modules
* Better functions and subroutines
* Recursion
* Structured programming

---

# 2. Basic Structure of a Fortran 90 Program

A simple Fortran 90 program looks like this:

```fortran
PROGRAM program_name

    IMPLICIT NONE

    ! Variable declarations
    INTEGER :: a, b, sum

    ! Statements
    a = 10
    b = 20
    sum = a + b

    PRINT *, sum

END PROGRAM program_name
```

### Structure

```text
PROGRAM statement
        ↓
IMPLICIT NONE
        ↓
Variable declarations
        ↓
Executable statements
        ↓
END PROGRAM
```

### Important parts

| Part                | Purpose                              |
| ------------------- | ------------------------------------ |
| `PROGRAM`           | Starts the main program              |
| `IMPLICIT NONE`     | Forces explicit variable declaration |
| Declaration section | Defines variables/constants          |
| Executable section  | Performs calculations/actions        |
| `END PROGRAM`       | Ends the program                     |

### Example

```fortran
PROGRAM hello

    IMPLICIT NONE

    PRINT *, "Hello, World!"

END PROGRAM hello
```

Output:

```text
Hello, World!
```

---

# 3. Fortran 90 Program Format

Fortran 90 uses **free-form source code**.

You don't have to write statements in fixed columns as in older Fortran.

For example:

```fortran
PROGRAM example
    IMPLICIT NONE

    INTEGER :: x

    x = 10
    PRINT *, x

END PROGRAM example
```

Indentation is not compulsory, but it makes the program easier to read.

---

# 4. Comments

Comments are text ignored by the compiler.

In Fortran 90, a comment begins with `!`.

### Syntax

```fortran
! This is a comment
```

or:

```fortran
INTEGER :: x    ! Declare integer variable
```

### Example

```fortran
PROGRAM comment_example

    IMPLICIT NONE

    ! Declare a variable
    INTEGER :: x

    x = 10

    ! Display the value
    PRINT *, x

END PROGRAM comment_example
```

### Why use comments?

Comments help explain:

* What the program does
* What a variable means
* What a calculation does
* Important sections of code

---

# 5. Keywords

**Keywords** are reserved words that have special meanings in Fortran.

Some important Fortran 90 keywords are:

| Keyword            | Purpose                     |
| ------------------ | --------------------------- |
| `PROGRAM`          | Defines main program        |
| `END`              | Ends a program/block        |
| `INTEGER`          | Integer data type           |
| `REAL`             | Real/decimal data           |
| `DOUBLE PRECISION` | Higher precision real       |
| `COMPLEX`          | Complex number              |
| `LOGICAL`          | True/False                  |
| `CHARACTER`        | Text                        |
| `PARAMETER`        | Defines constant            |
| `IF`               | Conditional statement       |
| `THEN`             | Starts IF block             |
| `ELSE`             | Alternative block           |
| `DO`               | Loop                        |
| `EXIT`             | Exit loop                   |
| `CYCLE`            | Skip current loop iteration |
| `SELECT CASE`      | Multiple-choice selection   |
| `FUNCTION`         | Defines function            |
| `SUBROUTINE`       | Defines subroutine          |
| `CALL`             | Calls subroutine            |
| `MODULE`           | Defines module              |
| `USE`              | Uses a module               |
| `READ`             | Reads input                 |
| `WRITE`            | Writes output               |
| `PRINT`            | Prints output               |
| `OPEN`             | Opens a file                |
| `CLOSE`            | Closes a file               |
| `RECURSIVE`        | Defines recursive procedure |

---

# 6. `IMPLICIT NONE`

`IMPLICIT NONE` tells Fortran:

> Every variable must be explicitly declared.

It is strongly recommended in Fortran 90 programs.

### Without `IMPLICIT NONE`

Fortran may automatically assign types based on variable names.

### With `IMPLICIT NONE`

```fortran
PROGRAM example

    IMPLICIT NONE

    INTEGER :: x
    REAL :: y

    x = 10
    y = 5.5

END PROGRAM example
```

This helps prevent typing mistakes.

---

# 7. Data Types

Fortran 90 provides several basic data types.

| Data Type          | Meaning                  | Example          |
| ------------------ | ------------------------ | ---------------- |
| `INTEGER`          | Whole numbers            | `10`, `-5`       |
| `REAL`             | Decimal numbers          | `3.14`           |
| `DOUBLE PRECISION` | Higher precision decimal | `3.1415926535D0` |
| `COMPLEX`          | Complex numbers          | `(2.0, 3.0)`     |
| `LOGICAL`          | True/False               | `.TRUE.`         |
| `CHARACTER`        | Text                     | `"Hello"`        |

---

## 7.1 INTEGER

Stores whole numbers.

```fortran
INTEGER :: age
```

Example:

```fortran
PROGRAM integer_example

    IMPLICIT NONE

    INTEGER :: a, b, sum

    a = 10
    b = 20
    sum = a + b

    PRINT *, sum

END PROGRAM integer_example
```

Output:

```text
30
```

---

## 7.2 REAL

Stores decimal numbers.

```fortran
REAL :: x
```

Example:

```fortran
PROGRAM real_example

    IMPLICIT NONE

    REAL :: x

    x = 3.14

    PRINT *, x

END PROGRAM real_example
```

---

## 7.3 DOUBLE PRECISION

Used when more precision is required.

```fortran
DOUBLE PRECISION :: x

x = 3.141592653589793D0
```

The `D0` indicates double-precision notation.

---

## 7.4 COMPLEX

Stores complex numbers.

```fortran
COMPLEX :: z

z = (2.0, 3.0)
```

This represents:

[
z = 2 + 3i
]

---

## 7.5 LOGICAL

Stores Boolean values.

```fortran
LOGICAL :: flag

flag = .TRUE.
```

Possible values:

```fortran
.TRUE.
.FALSE.
```

---

## 7.6 CHARACTER

Stores text.

```fortran
CHARACTER :: name
```

For a specific length:

```fortran
CHARACTER(LEN=20) :: name
```

Example:

```fortran
PROGRAM character_example

    IMPLICIT NONE

    CHARACTER(LEN=20) :: name

    name = "Fortran"

    PRINT *, name

END PROGRAM character_example
```

---

# 8. Variables

A **variable** is a named memory location whose value can change during program execution.

### Syntax

```fortran
DATA_TYPE :: variable_name
```

Example:

```fortran
INTEGER :: x
REAL :: price
LOGICAL :: found
CHARACTER(LEN=30) :: name
```

Multiple variables:

```fortran
INTEGER :: a, b, c
```

Initialization:

```fortran
INTEGER :: x = 10
```

---

# 9. Constants

A constant is a value that should not change during program execution.

Fortran uses the `PARAMETER` attribute.

### Syntax

```fortran
DATA_TYPE, PARAMETER :: name = value
```

Example:

```fortran
PROGRAM constant_example

    IMPLICIT NONE

    REAL, PARAMETER :: PI = 3.14159265

    PRINT *, PI

END PROGRAM constant_example
```

You cannot normally change `PI` later.

---

# 10. Assignment Statement

The assignment operator is:

```text
=
```

### Example

```fortran
INTEGER :: x

x = 10
```

Another example:

```fortran
x = x + 5
```

This means:

[
x \leftarrow x+5
]

---

# 11. Arithmetic Operators

| Operator | Meaning        | Example  |
| -------- | -------------- | -------- |
| `+`      | Addition       | `a + b`  |
| `-`      | Subtraction    | `a - b`  |
| `*`      | Multiplication | `a * b`  |
| `/`      | Division       | `a / b`  |
| `**`     | Power          | `a ** 2` |

Example:

```fortran
PROGRAM arithmetic

    IMPLICIT NONE

    INTEGER :: a, b

    a = 10
    b = 3

    PRINT *, a + b
    PRINT *, a - b
    PRINT *, a * b
    PRINT *, a / b
    PRINT *, a ** 2

END PROGRAM arithmetic
```

### Important

For integers:

```fortran
10 / 3
```

gives:

```text
3
```

because integer division discards the fractional part.

But:

```fortran
10.0 / 3.0
```

gives approximately:

```text
3.3333333
```

---

# 12. Relational Operators

Fortran 90 supports symbolic relational operators.

| Operator | Meaning               |
| -------- | --------------------- |
| `==`     | Equal                 |
| `/=`     | Not equal             |
| `<`      | Less than             |
| `>`      | Greater than          |
| `<=`     | Less than or equal    |
| `>=`     | Greater than or equal |

Example:

```fortran
IF (x > 10) THEN
    PRINT *, "Greater than 10"
END IF
```

---

# 13. Logical Operators

| Operator | Meaning                 |
| -------- | ----------------------- |
| `.AND.`  | Logical AND             |
| `.OR.`   | Logical OR              |
| `.NOT.`  | Logical NOT             |
| `.EQV.`  | Logical equivalence     |
| `.NEQV.` | Logical non-equivalence |

Example:

```fortran
IF (age >= 18 .AND. age <= 60) THEN
    PRINT *, "Valid age"
END IF
```

---

# 14. Input and Output

Fortran 90 provides:

* `READ`
* `PRINT`
* `WRITE`

for input/output operations.

---

## 14.1 `PRINT`

Displays information on the screen.

### Syntax

```fortran
PRINT *, expression
```

Example:

```fortran
PRINT *, "Hello"
PRINT *, x
```

---

# 15. `READ`

`READ` takes input from the user.

### Syntax

```fortran
READ *, variable
```

Example:

```fortran
PROGRAM input_example

    IMPLICIT NONE

    INTEGER :: age

    PRINT *, "Enter your age:"
    READ *, age

    PRINT *, "Your age is:", age

END PROGRAM input_example
```

If the user enters:

```text
20
```

Output:

```text
Your age is: 20
```

---

# 16. `WRITE`

`WRITE` is another output statement.

Simple syntax:

```fortran
WRITE(*,*) expression
```

Example:

```fortran
PROGRAM write_example

    IMPLICIT NONE

    INTEGER :: x

    x = 25

    WRITE(*,*) "Value =", x

END PROGRAM write_example
```

---

# 17. `IF-THEN-ELSE`

Used to make decisions.

### Syntax

```fortran
IF (condition) THEN

    statements

ELSE

    statements

END IF
```

### Example

```fortran
PROGRAM if_example

    IMPLICIT NONE

    INTEGER :: x

    READ *, x

    IF (x > 0) THEN
        PRINT *, "Positive"
    ELSE IF (x < 0) THEN
        PRINT *, "Negative"
    ELSE
        PRINT *, "Zero"
    END IF

END PROGRAM if_example
```

### Flow

```text
             condition
                 |
        +--------+--------+
       TRUE             FALSE
        |                 |
    Statement        ELSE statement
```

---

# 18. `DO` Loop

A `DO` loop repeats a group of statements.

### Syntax

```fortran
DO variable = start, end, step

    statements

END DO
```

The step is optional.

### Example

```fortran
PROGRAM loop_example

    IMPLICIT NONE

    INTEGER :: i

    DO i = 1, 5
        PRINT *, i
    END DO

END PROGRAM loop_example
```

Output:

```text
1
2
3
4
5
```

---

## 18.1 `DO` with Step

```fortran
DO i = 2, 10, 2
    PRINT *, i
END DO
```

Output:

```text
2
4
6
8
10
```

---

# 19. `EXIT`

`EXIT` terminates a loop.

```fortran
DO i = 1, 100

    IF (i == 5) EXIT

    PRINT *, i

END DO
```

Output:

```text
1
2
3
4
```

---

# 20. `CYCLE`

`CYCLE` skips the current iteration and continues with the next iteration.

```fortran
DO i = 1, 5

    IF (i == 3) CYCLE

    PRINT *, i

END DO
```

Output:

```text
1
2
4
5
```

---

# 21. `SELECT CASE`

`SELECT CASE` is useful when there are many possible choices.

### Syntax

```fortran
SELECT CASE (expression)

CASE (value1)
    statements

CASE (value2)
    statements

CASE DEFAULT
    statements

END SELECT
```

### Example

```fortran
PROGRAM case_example

    IMPLICIT NONE

    INTEGER :: choice

    READ *, choice

    SELECT CASE (choice)

    CASE (1)
        PRINT *, "One"

    CASE (2)
        PRINT *, "Two"

    CASE (3)
        PRINT *, "Three"

    CASE DEFAULT
        PRINT *, "Invalid choice"

    END SELECT

END PROGRAM case_example
```

---

# 22. Arrays

An **array** stores multiple values of the same data type under one name.

For example:

```text
A = [10, 20, 30, 40, 50]
```

---

## 22.1 One-Dimensional Array

### Declaration

```fortran
INTEGER :: A(5)
```

This creates:

```text
A(1)
A(2)
A(3)
A(4)
A(5)
```

### Example

```fortran
PROGRAM array_example

    IMPLICIT NONE

    INTEGER :: A(5)
    INTEGER :: i

    A = (/ 10, 20, 30, 40, 50 /)

    DO i = 1, 5
        PRINT *, A(i)
    END DO

END PROGRAM array_example
```

---

# 23. Array Input

```fortran
PROGRAM array_input

    IMPLICIT NONE

    INTEGER :: A(5)
    INTEGER :: i

    DO i = 1, 5
        READ *, A(i)
    END DO

    PRINT *, "Array:"

    DO i = 1, 5
        PRINT *, A(i)
    END DO

END PROGRAM array_input
```

---

# 24. Two-Dimensional Arrays

A two-dimensional array can represent a matrix.

### Declaration

```fortran
INTEGER :: A(3,3)
```

This represents:

[
A =
\begin{bmatrix}
a_{11}&a_{12}&a_{13}\
a_{21}&a_{22}&a_{23}\
a_{31}&a_{32}&a_{33}
\end{bmatrix}
]

### Example

```fortran
PROGRAM matrix_example

    IMPLICIT NONE

    INTEGER :: A(2,2)

    A = RESHAPE((/1,2,3,4/), (/2,2/))

    PRINT *, A

END PROGRAM matrix_example
```

`RESHAPE` is a Fortran 90 intrinsic function used to arrange values into an array shape.

---

# 25. Array Bounds

You can specify lower and upper bounds.

```fortran
INTEGER :: A(0:4)
```

The indexes are:

```text
0, 1, 2, 3, 4
```

Another example:

```fortran
REAL :: X(-2:2)
```

Indexes:

```text
-2, -1, 0, 1, 2
```

---

# 26. Intrinsic Functions

Fortran has many built-in functions.

Some important ones:

| Function   | Purpose            |
| ---------- | ------------------ |
| `ABS(x)`   | Absolute value     |
| `SQRT(x)`  | Square root        |
| `SIN(x)`   | Sine               |
| `COS(x)`   | Cosine             |
| `TAN(x)`   | Tangent            |
| `EXP(x)`   | (e^x)              |
| `LOG(x)`   | Natural logarithm  |
| `LOG10(x)` | Base-10 logarithm  |
| `INT(x)`   | Convert to integer |
| `REAL(x)`  | Convert to real    |
| `MAX(x,y)` | Maximum            |
| `MIN(x,y)` | Minimum            |
| `MOD(x,y)` | Remainder          |

Example:

```fortran
PROGRAM intrinsic_example

    IMPLICIT NONE

    REAL :: x

    x = 25.0

    PRINT *, SQRT(x)
    PRINT *, ABS(-10.0)

END PROGRAM intrinsic_example
```

---

# 27. Function

A **function** is a procedure that performs a calculation and **returns one value**.

Think of it as:

```text
input → function → one result
```

For example:

[
f(x)=x^2
]

---

## 27.1 Function Syntax

```fortran
FUNCTION function_name(arguments)

    declarations

    statements

    function_name = result

END FUNCTION function_name
```

### Example

```fortran
PROGRAM function_example

    IMPLICIT NONE

    REAL :: x, result

    x = 5.0

    result = square(x)

    PRINT *, "Square =", result

CONTAINS

    REAL FUNCTION square(x)

        REAL :: x

        square = x * x

    END FUNCTION square

END PROGRAM function_example
```

Output:

```text
Square = 25
```

### Explanation

The function:

```fortran
REAL FUNCTION square(x)
```

takes `x`.

Then:

```fortran
square = x * x
```

stores the return value in the function name.

The main program calls it using:

```fortran
result = square(x)
```

---

# 28. Subroutine

A **subroutine** is a procedure used to perform an operation. Unlike a function, it is called using the `CALL` statement.

Think:

```text
CALL subroutine
```

A subroutine can return multiple values through its arguments.

### Syntax

```fortran
SUBROUTINE subroutine_name(arguments)

    declarations

    statements

END SUBROUTINE subroutine_name
```

Call:

```fortran
CALL subroutine_name(arguments)
```

---

## 28.1 Subroutine Example

```fortran
PROGRAM subroutine_example

    IMPLICIT NONE

    INTEGER :: a, b, result

    a = 10
    b = 20

    CALL add_numbers(a, b, result)

    PRINT *, "Sum =", result

CONTAINS

    SUBROUTINE add_numbers(x, y, sum)

        INTEGER :: x, y
        INTEGER :: sum

        sum = x + y

    END SUBROUTINE add_numbers

END PROGRAM subroutine_example
```

Output:

```text
Sum = 30
```

### How it works

Main program:

```fortran
CALL add_numbers(a, b, result)
```

passes three arguments.

Inside:

```fortran
sum = x + y
```

The result is returned through `sum`.

---

# 29. Function vs Subroutine

| Function                                       | Subroutine                   |
| ---------------------------------------------- | ---------------------------- |
| Returns a value                                | Performs an operation        |
| Usually used inside expressions                | Called with `CALL`           |
| `result = function(x)`                         | `CALL subroutine(x, result)` |
| Function name holds result                     | Arguments can return results |
| Can naturally represent mathematical functions | Useful for multiple outputs  |

### Function

```fortran
y = square(x)
```

### Subroutine

```fortran
CALL calculate(x, y)
```

---

# 30. `CONTAINS`

`CONTAINS` allows internal functions and subroutines to be placed inside a program.

Structure:

```fortran
PROGRAM main

    declarations

    executable statements

CONTAINS

    FUNCTION ...

    END FUNCTION

    SUBROUTINE ...

    END SUBROUTINE

END PROGRAM main
```

Example:

```fortran
PROGRAM main

    IMPLICIT NONE

    INTEGER :: x

    x = 5

    PRINT *, square(x)

CONTAINS

    INTEGER FUNCTION square(n)

        INTEGER :: n

        square = n * n

    END FUNCTION square

END PROGRAM main
```

---

# 31. Recursive Function

A **recursive function** is a function that calls itself.

A classic example is factorial:

[
n! = n(n-1)(n-2)\cdots1
]

and

[
0! = 1
]

Therefore:

[
n! = n(n-1)!
]

---

## 31.1 Recursive Function Syntax

Fortran requires the `RECURSIVE` keyword.

```fortran
RECURSIVE FUNCTION function_name(argument) RESULT(result_name)

    declarations

    IF (base_condition) THEN
        result_name = base_value
    ELSE
        result_name = ...
    END IF

END FUNCTION function_name
```

Using `RESULT` gives the function's return value a separate name.

---

## 31.2 Factorial Example

```fortran
PROGRAM factorial_program

    IMPLICIT NONE

    INTEGER :: n

    n = 5

    PRINT *, "Factorial =", factorial(n)

CONTAINS

    RECURSIVE FUNCTION factorial(n) RESULT(f)

        INTEGER :: n
        INTEGER :: f

        IF (n == 0) THEN
            f = 1
        ELSE
            f = n * factorial(n - 1)
        END IF

    END FUNCTION factorial

END PROGRAM factorial_program
```

Output:

```text
Factorial = 120
```

### How recursion works

For:

```text
factorial(5)
```

the calls become:

```text
5 × factorial(4)
    ↓
5 × 4 × factorial(3)
        ↓
5 × 4 × 3 × factorial(2)
            ↓
5 × 4 × 3 × 2 × factorial(1)
                ↓
5 × 4 × 3 × 2 × 1 × factorial(0)
```

Since:

```text
factorial(0) = 1
```

the result is:

```text
120
```

### Important

Every recursive function needs a **base case**. Otherwise, recursion will continue indefinitely.

---

# 32. Modules

A **module** is a container used to organize:

* Variables
* Constants
* Functions
* Subroutines
* Other definitions

Modules are extremely useful for large programs.

---

## 32.1 Module Syntax

```fortran
MODULE module_name

    IMPLICIT NONE

    declarations

CONTAINS

    procedures

END MODULE module_name
```

A program can use the module with:

```fortran
USE module_name
```

---

## 32.2 Module Example

```fortran
MODULE math_module

    IMPLICIT NONE

CONTAINS

    INTEGER FUNCTION square(x)

        INTEGER :: x

        square = x * x

    END FUNCTION square

END MODULE math_module
```

Main program:

```fortran
PROGRAM main

    USE math_module

    IMPLICIT NONE

    INTEGER :: x

    x = 5

    PRINT *, square(x)

END PROGRAM main
```

Output:

```text
25
```

### Advantage

Instead of putting everything in one huge program, we can organize related procedures into modules.

---

# 33. File Handling

Fortran 90 can read from and write to files.

The main commands are:

```text
OPEN
READ
WRITE
CLOSE
```

---

# 34. Opening a File

### Syntax

```fortran
OPEN(UNIT=10, FILE="data.txt", STATUS="OLD")
```

Some common `STATUS` values:

| Status      | Meaning                 |
| ----------- | ----------------------- |
| `"OLD"`     | Existing file           |
| `"NEW"`     | New file                |
| `"UNKNOWN"` | File status unspecified |
| `"SCRATCH"` | Temporary file          |

---

# 35. Writing to a File

Example:

```fortran
PROGRAM file_write

    IMPLICIT NONE

    INTEGER :: unit

    unit = 10

    OPEN(UNIT=unit, FILE="output.txt", STATUS="UNKNOWN")

    WRITE(unit,*) "Hello from Fortran 90"
    WRITE(unit,*) 100

    CLOSE(unit)

END PROGRAM file_write
```

This creates/writes:

```text
output.txt
```

---

# 36. Reading from a File

Suppose `data.txt` contains:

```text
10
20
30
```

Program:

```fortran
PROGRAM file_read

    IMPLICIT NONE

    INTEGER :: unit
    INTEGER :: x

    unit = 10

    OPEN(UNIT=unit, FILE="data.txt", STATUS="OLD")

    READ(unit,*) x
    PRINT *, x

    READ(unit,*) x
    PRINT *, x

    READ(unit,*) x
    PRINT *, x

    CLOSE(unit)

END PROGRAM file_read
```

Output:

```text
10
20
30
```

---

# 37. File Handling with a Loop

A common approach is to read data repeatedly.

```fortran
PROGRAM read_file

    IMPLICIT NONE

    INTEGER :: unit
    INTEGER :: x
    INTEGER :: ios

    unit = 10

    OPEN(UNIT=unit, FILE="data.txt", STATUS="OLD")

    DO

        READ(unit,*,IOSTAT=ios) x

        IF (ios /= 0) EXIT

        PRINT *, x

    END DO

    CLOSE(unit)

END PROGRAM read_file
```

### `IOSTAT`

`IOSTAT` can be used to detect whether reading was successful.

For example:

```fortran
READ(unit,*,IOSTAT=ios) x
```

If an error or end-of-file occurs, `ios` becomes nonzero.

---

# 38. Format Statements

Fortran allows you to control how data is displayed.

Basic example:

```fortran
PROGRAM format_example

    IMPLICIT NONE

    REAL :: x

    x = 12.34567

    WRITE(*,100) x

100 FORMAT(F10.2)

END PROGRAM format_example
```

`F10.2` means approximately:

* Total field width = 10
* Digits after decimal = 2

---

# 39. Common Format Codes

| Format  | Meaning                          |
| ------- | -------------------------------- |
| `I5`    | Integer, width 5                 |
| `F10.2` | Real, width 10, 2 decimal places |
| `E12.4` | Scientific notation              |
| `A20`   | Character, width 20              |
| `X`     | Space                            |

Example:

```fortran
WRITE(*,100) x
100 FORMAT(F10.2)
```

---

# 40. Scope of Variables

Scope means:

> Where a variable can be accessed.

For example, a variable declared inside a function normally belongs to that procedure.

```fortran
INTEGER FUNCTION square(x)

    INTEGER :: x
    INTEGER :: temp

    temp = x * x
    square = temp

END FUNCTION square
```

`temp` is local to the function.

---

# 41. Passing Arguments

Fortran procedures can receive arguments.

Example:

```fortran
SUBROUTINE calculate(a, b, result)

    REAL :: a, b, result

    result = a + b

END SUBROUTINE calculate
```

Call:

```fortran
CALL calculate(x, y, answer)
```

Conceptually:

```text
Main program
     |
     | x, y
     ↓
Subroutine
     |
     | result
     ↓
Main program
```

---

# 42. `INTENT`

Fortran 90 supports `INTENT` for procedure arguments.

There are three forms:

| Intent  | Meaning          |
| ------- | ---------------- |
| `IN`    | Input only       |
| `OUT`   | Output           |
| `INOUT` | Input and output |

Example:

```fortran
SUBROUTINE add(a, b, result)

    INTEGER, INTENT(IN) :: a, b
    INTEGER, INTENT(OUT) :: result

    result = a + b

END SUBROUTINE add
```

This makes the purpose of arguments much clearer.

---

# 43. Example: Complete Student Result Program

This example combines:

* Variables
* Input
* Arithmetic
* `IF`
* Function
* Output

```fortran
PROGRAM student_result

    IMPLICIT NONE

    REAL :: marks1, marks2, marks3
    REAL :: average

    PRINT *, "Enter three marks:"
    READ *, marks1, marks2, marks3

    average = (marks1 + marks2 + marks3) / 3.0

    PRINT *, "Average =", average

    IF (average >= 40.0) THEN
        PRINT *, "Pass"
    ELSE
        PRINT *, "Fail"
    END IF

END PROGRAM student_result
```

### Explanation

First, three marks are read:

```fortran
READ *, marks1, marks2, marks3
```

Then:

```fortran
average = (marks1 + marks2 + marks3) / 3.0
```

calculates the average.

Finally, `IF` determines whether the student passes.

---

# 44. Example: Sum of Array Elements

```fortran
PROGRAM array_sum

    IMPLICIT NONE

    INTEGER :: A(5)
    INTEGER :: i
    INTEGER :: sum

    A = (/ 10, 20, 30, 40, 50 /)

    sum = 0

    DO i = 1, 5
        sum = sum + A(i)
    END DO

    PRINT *, "Sum =", sum

END PROGRAM array_sum
```

Output:

```text
Sum = 150
```

---

# 45. Example: Function + Array

```fortran
PROGRAM array_function

    IMPLICIT NONE

    INTEGER :: A(5)
    INTEGER :: i
    INTEGER :: result

    A = (/ 2, 4, 6, 8, 10 /)

    result = array_sum(A, 5)

    PRINT *, "Sum =", result

CONTAINS

    INTEGER FUNCTION array_sum(A, n)

        INTEGER :: A(n)
        INTEGER :: n
        INTEGER :: i

        array_sum = 0

        DO i = 1, n
            array_sum = array_sum + A(i)
        END DO

    END FUNCTION array_sum

END PROGRAM array_function
```

This demonstrates how an array can be passed to a function.

---

# 46. Important Fortran 90 Statements

A useful summary:

| Statement     | Purpose               |
| ------------- | --------------------- |
| `PROGRAM`     | Main program          |
| `END PROGRAM` | End main program      |
| `INTEGER`     | Integer declaration   |
| `REAL`        | Real declaration      |
| `CHARACTER`   | Character/string      |
| `LOGICAL`     | Boolean               |
| `PARAMETER`   | Constant              |
| `READ`        | Input                 |
| `PRINT`       | Screen output         |
| `WRITE`       | Output                |
| `IF`          | Conditional           |
| `ELSE`        | Alternative condition |
| `DO`          | Loop                  |
| `EXIT`        | Exit loop             |
| `CYCLE`       | Skip iteration        |
| `SELECT CASE` | Multiple choices      |
| `FUNCTION`    | Function procedure    |
| `SUBROUTINE`  | Subroutine procedure  |
| `CALL`        | Call subroutine       |
| `RECURSIVE`   | Recursive procedure   |
| `MODULE`      | Module                |
| `USE`         | Use module            |
| `OPEN`        | Open file             |
| `CLOSE`       | Close file            |
| `CONTAINS`    | Internal procedures   |

---

# 47. Important Fortran 90 Intrinsic Functions

### Mathematical

```fortran
SQRT(x)
ABS(x)
SIN(x)
COS(x)
TAN(x)
EXP(x)
LOG(x)
LOG10(x)
```

### Conversion

```fortran
INT(x)
REAL(x)
```

### Maximum/Minimum

```fortran
MAX(a,b)
MIN(a,b)
```

### Remainder

```fortran
MOD(a,b)
```

Example:

```fortran
PRINT *, MOD(10,3)
```

Output:

```text
1
```

---

# 48. Operator Precedence

Consider:

```fortran
x = 2 + 3 * 4
```

Multiplication happens first:

[
2+(3\times4)=14
]

Generally:

1. Parentheses
2. Exponentiation `**`
3. Multiplication/division `* /`
4. Addition/subtraction `+ -`
5. Relational operators
6. Logical operators

When in doubt, use parentheses:

```fortran
x = (a + b) * c
```

---

# 49. Character Operations

Fortran 90 supports character strings.

### Concatenation

The operator is:

```fortran
//
```

Example:

```fortran
PROGRAM string_example

    IMPLICIT NONE

    CHARACTER(LEN=10) :: first
    CHARACTER(LEN=10) :: last
    CHARACTER(LEN=25) :: full

    first = "John"
    last = "Smith"

    full = first // " " // last

    PRINT *, full

END PROGRAM string_example
```

---

# 50. Array Operations

One powerful feature of Fortran is that many operations can be performed directly on arrays.

```fortran
PROGRAM array_operation

    IMPLICIT NONE

    INTEGER :: A(3)
    INTEGER :: B(3)
    INTEGER :: C(3)

    A = (/ 1, 2, 3 /)
    B = (/ 4, 5, 6 /)

    C = A + B

    PRINT *, C

END PROGRAM array_operation
```

Conceptually:

[
C =
\begin{bmatrix}
1\2\3
\end{bmatrix}
+
\begin{bmatrix}
4\5\6
\end{bmatrix}
=============

\begin{bmatrix}
5\7\9
\end{bmatrix}
]

---

# 51. Useful Array Functions

| Function           | Purpose                 |
| ------------------ | ----------------------- |
| `SUM(A)`           | Sum of elements         |
| `MAXVAL(A)`        | Maximum element         |
| `MINVAL(A)`        | Minimum element         |
| `SIZE(A)`          | Number of elements      |
| `SHAPE(A)`         | Array dimensions        |
| `RESHAPE(A,shape)` | Change shape            |
| `COUNT(A)`         | Count `.TRUE.` elements |

Example:

```fortran
PROGRAM array_functions

    IMPLICIT NONE

    INTEGER :: A(5)

    A = (/ 10, 20, 30, 40, 50 /)

    PRINT *, SUM(A)
    PRINT *, MAXVAL(A)
    PRINT *, MINVAL(A)
    PRINT *, SIZE(A)

END PROGRAM array_functions
```

---

# 52. Complete Fortran 90 Program Template

A good template to remember:

```fortran
PROGRAM program_name

    IMPLICIT NONE

    ! =========================
    ! Variable declarations
    ! =========================

    INTEGER :: i
    REAL :: x
    CHARACTER(LEN=20) :: name

    ! =========================
    ! Input
    ! =========================

    READ *, x

    ! =========================
    ! Processing
    ! =========================

    x = x * 2.0

    ! =========================
    ! Output
    ! =========================

    PRINT *, "Result =", x

CONTAINS

    ! =========================
    ! Functions/Subroutines
    ! =========================

END PROGRAM program_name
```

---

# 53. Basic Problem-Solving Pattern

When solving a Fortran programming problem, think in this order:

```text
          Problem
             ↓
          Input
             ↓
      Variable declaration
             ↓
        Processing
             ↓
       Decision/Loop
             ↓
          Output
```

For example, to calculate the average of `N` numbers:

```text
1. Read N
2. Declare variables
3. Initialize sum = 0
4. Repeat N times
5. Read number
6. Add number to sum
7. Calculate average
8. Print average
```

---

# 54. Common Beginner Mistakes

### Mistake 1: Forgetting `IMPLICIT NONE`

Prefer:

```fortran
PROGRAM example
    IMPLICIT NONE
```

---

### Mistake 2: Using integer division accidentally

```fortran
average = (a + b + c) / 3
```

If everything is integer, the result may be integer division.

Use:

```fortran
average = REAL(a + b + c) / 3.0
```

or use `REAL` variables.

---

### Mistake 3: Forgetting `END IF`

Wrong:

```fortran
IF (x > 0) THEN
    PRINT *, "Positive"
```

Correct:

```fortran
IF (x > 0) THEN
    PRINT *, "Positive"
END IF
```

---

### Mistake 4: Forgetting `END DO`

Correct:

```fortran
DO i = 1, 10
    PRINT *, i
END DO
```

---

### Mistake 5: Forgetting `CALL`

Subroutine:

```fortran
SUBROUTINE test()
```

must be called as:

```fortran
CALL test()
```

---

### Mistake 6: Forgetting the recursive keyword

For a recursive function, use:

```fortran
RECURSIVE FUNCTION factorial(n)
```

---

# 55. Fortran 90 vs C/C++ — Quick Comparison

| Concept         | Fortran 90      | C/C++                           |
| --------------- | --------------- | ------------------------------- |
| Main program    | `PROGRAM`       | `main()`                        |
| Integer         | `INTEGER`       | `int`                           |
| Decimal         | `REAL`          | `float`/`double`                |
| Boolean         | `LOGICAL`       | `bool`                          |
| String          | `CHARACTER`     | `string`                        |
| Input           | `READ`          | `cin`/`scanf`                   |
| Output          | `PRINT`/`WRITE` | `cout`/`printf`                 |
| Function        | `FUNCTION`      | Function                        |
| Subroutine      | `SUBROUTINE`    | No direct equivalent            |
| Loop            | `DO`            | `for`/`while`                   |
| Condition       | `IF`            | `if`                            |
| Multiple choice | `SELECT CASE`   | `switch`                        |
| Module          | `MODULE`        | Header/class/namespace concepts |

---

# 56. Most Important Syntax to Memorize

## Program

```fortran
PROGRAM name

    IMPLICIT NONE

    declarations

    statements

END PROGRAM name
```

## Variable

```fortran
INTEGER :: x
REAL :: y
CHARACTER(LEN=20) :: name
LOGICAL :: flag
```

## Constant

```fortran
REAL, PARAMETER :: PI = 3.14159
```

## Input

```fortran
READ *, x
```

## Output

```fortran
PRINT *, x
```

or:

```fortran
WRITE(*,*) x
```

## IF

```fortran
IF (condition) THEN
    statements
ELSE
    statements
END IF
```

## DO

```fortran
DO i = start, end, step
    statements
END DO
```

## SELECT CASE

```fortran
SELECT CASE (x)

CASE (1)
    statements

CASE (2)
    statements

CASE DEFAULT
    statements

END SELECT
```

## Function

```fortran
INTEGER FUNCTION add(a,b)

    INTEGER :: a,b

    add = a + b

END FUNCTION add
```

## Subroutine

```fortran
SUBROUTINE add(a,b,result)

    INTEGER :: a,b,result

    result = a + b

END SUBROUTINE add
```

Call:

```fortran
CALL add(a,b,result)
```

## Recursive Function

```fortran
RECURSIVE FUNCTION factorial(n) RESULT(f)

    INTEGER :: n
    INTEGER :: f

    IF (n == 0) THEN
        f = 1
    ELSE
        f = n * factorial(n-1)
    END IF

END FUNCTION factorial
```

## Module

```fortran
MODULE my_module

    IMPLICIT NONE

CONTAINS

    ! procedures

END MODULE my_module
```

Use:

```fortran
USE my_module
```

## File

```fortran
OPEN(UNIT=10, FILE="data.txt", STATUS="OLD")

READ(10,*) x

CLOSE(10)
```

---

# 57. Final Fortran 90 Learning Roadmap

A good order for learning Fortran 90 is:

```text
1. Basic syntax
       ↓
2. PROGRAM / END PROGRAM
       ↓
3. IMPLICIT NONE
       ↓
4. Data types
       ↓
5. Variables and constants
       ↓
6. Operators
       ↓
7. READ / PRINT / WRITE
       ↓
8. IF-THEN-ELSE
       ↓
9. DO loops
       ↓
10. EXIT / CYCLE
       ↓
11. SELECT CASE
       ↓
12. Arrays
       ↓
13. Intrinsic functions
       ↓
14. User-defined functions
       ↓
15. Subroutines
       ↓
16. Recursive functions
       ↓
17. Modules
       ↓
18. File handling
       ↓
19. Larger scientific programs
```

## One-page mental model

```text
FORTRAN 90
│
├── Program
│   ├── Declarations
│   └── Executable statements
│
├── Data
│   ├── INTEGER
│   ├── REAL
│   ├── DOUBLE PRECISION
│   ├── COMPLEX
│   ├── LOGICAL
│   └── CHARACTER
│
├── Input / Output
│   ├── READ
│   ├── PRINT
│   └── WRITE
│
├── Control
│   ├── IF
│   ├── DO
│   ├── EXIT
│   ├── CYCLE
│   └── SELECT CASE
│
├── Data Structures
│   └── Arrays
│
├── Procedures
│   ├── FUNCTION
│   ├── SUBROUTINE
│   └── RECURSIVE FUNCTION
│
├── Organization
│   ├── MODULE
│   └── USE
│
└── Files
    ├── OPEN
    ├── READ / WRITE
    └── CLOSE
```

### Key idea to remember

The most important distinction is:

> **Function → returns a value**
> **Subroutine → performs an operation and can return values through arguments**
> **Recursive function → a function that calls itself**
> **Module → organizes reusable variables, functions, and subroutines**

For beginner programming exercises, mastering **variables → input/output → operators → conditions → loops → arrays → functions → subroutines → modules → files** will give you a strong Fortran 90 foundation.
