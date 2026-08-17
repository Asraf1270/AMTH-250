# Fortran 90 Formatting

This note provides a comprehensive explanation of formatting in Fortran 90, covering format specifiers, advanced techniques, and practical examples for controlling input and output appearance.

---

## 1. Introduction to Formatting

Formatting in Fortran 90 controls how data is **read** (with `READ`) and **displayed** (with `WRITE` and `PRINT`). Formats allow you to:

- Align columns and create tables
- Control the number of decimal places
- Specify field widths
- Insert spaces and newlines
- Format numbers in scientific notation
- Handle character strings

### Two Ways to Specify Formats:

1. **FORMAT Statement**: A separate non-executable statement referenced by a label
2. **Character String Format**: A compile-time character constant directly in `READ`/`WRITE`

---

## 2. Format Statement

The `FORMAT` statement is a non-executable statement that defines a format specification.

### Syntax:

```fortran
label FORMAT (format_descriptor_list)
```

### Example:

```fortran
PROGRAM format_example
  IMPLICIT NONE
  
  INTEGER :: age = 25
  REAL :: salary = 45000.50
  CHARACTER(LEN=20) :: name = "John Doe"
  
  ! Define format with label 100
100 FORMAT (A20, 1X, I5, 1X, F10.2)
  
  ! Use the format
  WRITE(*, 100) name, age, salary
  
END PROGRAM format_example
```

---

## 3. Character String Format

You can specify the format directly as a character string in `READ` or `WRITE` statements.

### Syntax:

```fortran
WRITE(*, '(format_specifier)') variable_list
READ(*, '(format_specifier)') variable_list
```

### Example:

```fortran
PROGRAM char_format_example
  IMPLICIT NONE
  
  INTEGER :: age = 25
  REAL :: salary = 45000.50
  CHARACTER(LEN=20) :: name = "John Doe"
  
  ! Direct format string
  WRITE(*, '(A20, 1X, I5, 1X, F10.2)') name, age, salary
  
  ! Character variable as format
  CHARACTER(LEN=20) :: fmt = '(A20, 1X, I5, 1X, F10.2)'
  WRITE(*, fmt) name, age, salary
  
END PROGRAM char_format_example
```

---

## 4. Basic Format Descriptors

### Integer Descriptors

| Descriptor | Description | Example |
|------------|-------------|---------|
| **`Iw`** | Integer with width `w`, right-justified | `I5` → "  123" |
| **`Iw.m`** | Integer with width `w`, minimum `m` digits | `I5.3` → "  123" |
| **`Bw`** | Binary (base 2) | `B8` → " 1010" |
| **`Ow`** | Octal (base 8) | `O8` → "   12" |
| **`Zw`** | Hexadecimal (base 16) | `Z8` → "    A" |

#### Integer Examples:

```fortran
PROGRAM integer_format
  IMPLICIT NONE
  
  INTEGER :: num = 123
  INTEGER :: neg = -123
  INTEGER :: small = 5
  
  ! Standard integer
  WRITE(*, '(I5)') num        ! "  123"
  WRITE(*, '(I5)') neg        ! " -123"
  WRITE(*, '(I5)') small      ! "    5"
  
  ! Minimum digits
  WRITE(*, '(I5.3)') small    ! "  005"
  WRITE(*, '(I5.5)') small    ! "00005"
  
  ! Different bases
  WRITE(*, '(B8)') num        ! "1111011" (binary)
  WRITE(*, '(O8)') num        ! "   173"  (octal)
  WRITE(*, '(Z8)') num        ! "    7B"  (hex)
  
END PROGRAM integer_format
```

### Real/Decimal Descriptors

| Descriptor | Description | Example |
|------------|-------------|---------|
| **`Fw.d`** | Fixed-point decimal, width `w`, `d` decimal places | `F10.3` → "  123.456" |
| **`Ew.d`** | Scientific notation (exponential) | `E15.7` → "  1.234567E+02" |
| **`ESw.d`** | Scientific notation with leading digit | `ES15.7` → "  1.234567E+02" |
| **`ENw.d`** | Engineering notation | `EN15.3` → "  123.456E+00" |
| **`Gw.d`** | General format (chooses F or E) | `G15.7` |

#### Real Number Examples:

```fortran
PROGRAM real_format
  IMPLICIT NONE
  
  REAL :: pi = 3.1415926535
  REAL :: large = 1234567.89
  REAL :: small = 0.0000123
  REAL :: negative = -45.678
  
  ! Fixed-point format
  WRITE(*, '(F10.4)') pi        ! "   3.1416"
  WRITE(*, '(F10.2)') pi        ! "     3.14"
  WRITE(*, '(F10.6)') pi        ! " 3.141593"
  WRITE(*, '(F8.2)') negative   ! " -45.68"
  
  ! Scientific notation
  WRITE(*, '(E15.7)') pi        ! "  0.3141593E+01"
  WRITE(*, '(E15.7)') large     ! "  0.1234568E+07"
  WRITE(*, '(E15.7)') small     ! "  0.1230000E-04"
  
  ! Engineering notation
  WRITE(*, '(EN15.3)') large    ! "  123.456E+04"
  WRITE(*, '(EN15.3)') small    ! "   12.300E-06"
  
  ! General format
  WRITE(*, '(G15.7)') pi        ! "   3.141593"
  WRITE(*, '(G15.7)') large     ! "   1234568."
  
  ! Leading zeros
  WRITE(*, '(F10.3)') small     ! "     0.000"
  WRITE(*, '(F10.3)') 0.0       ! "     0.000"
  
END PROGRAM real_format
```

### Character/String Descriptors

| Descriptor | Description | Example |
|------------|-------------|---------|
| **`A`** | Character string, full length | `A` → "Hello" |
| **`Aw`** | Character string with width `w` | `A10` → "Hello     " |
| **`Aw`** with TRIM | Character string without trailing spaces | `A` with TRIM() |

#### Character Examples:

```fortran
PROGRAM string_format
  IMPLICIT NONE
  
  CHARACTER(LEN=20) :: name = "John Smith"
  CHARACTER(LEN=10) :: city = "New York"
  CHARACTER(LEN=5) :: short = "Hi"
  
  ! Full string
  WRITE(*, '(A)') name          ! "John Smith          "
  WRITE(*, '(A)') TRIM(name)    ! "John Smith"
  
  ! Fixed width
  WRITE(*, '(A20)') name        ! "John Smith          "
  WRITE(*, '(A10)') city        ! "New York "
  WRITE(*, '(A5)') short        ! "Hi   "
  
  ! Combining strings
  WRITE(*, '(A, 1X, A)') TRIM(name), TRIM(city)  ! "John Smith New York"
  
END PROGRAM string_format
```

### Logical Descriptors

| Descriptor | Description | Example |
|------------|-------------|---------|
| **`Lw`** | Logical value, width `w` | `L5` → "  T" or "  F" |

#### Logical Examples:

```fortran
PROGRAM logical_format
  IMPLICIT NONE
  
  LOGICAL :: flag1 = .TRUE.
  LOGICAL :: flag2 = .FALSE.
  
  WRITE(*, '(L5)') flag1        ! "  T"
  WRITE(*, '(L5)') flag2        ! "  F"
  WRITE(*, '(L1)') flag1        ! "T"
  WRITE(*, '(L10)') flag1       ! "         T"
  
END PROGRAM logical_format
```

### Special Descriptors

| Descriptor | Description | Example |
|------------|-------------|---------|
| **`X`** | Horizontal space | `1X` → one space |
| **`/`** | Vertical space (newline) | `/` → new record |
| **`\`** | Suppress newline (non-standard) | `\` → continue same line |
| **`$`** | Suppress newline (non-standard) | `$` → continue same line |
| **`:`** | Stop formatting if no more items | `:` |

---

## 5. Format Editing

### Space Insertion (`X` Descriptor)

The `X` descriptor inserts blank spaces.

```fortran
PROGRAM space_example
  IMPLICIT NONE
  
  INTEGER :: a = 10, b = 20
  
  ! One space
  WRITE(*, '(I5, 1X, I5)') a, b   ! "   10    20"
  
  ! Multiple spaces
  WRITE(*, '(I5, 3X, I5)') a, b   ! "   10     20"
  
  ! Using X without number (1X)
  WRITE(*, '(I5, X, I5)') a, b    ! "   10    20"
  
  ! Leading spaces
  WRITE(*, '(5X, I5)') a          ! "     10"
  
END PROGRAM space_example
```

### Newline Control (`/` Descriptor)

The slash (`/`) forces a new record (line).

```fortran
PROGRAM newline_example
  IMPLICIT NONE
  
  INTEGER :: a = 1, b = 2, c = 3, d = 4
  
  ! Single newline
  WRITE(*, '(I5, /, I5)') a, b
  ! Output:
  !     1
  !     2
  
  ! Multiple newlines
  WRITE(*, '(I5, /, /, I5)') a, b
  ! Output:
  !     1
  !
  !     2
  
  ! Newlines in data
  WRITE(*, '(I5, /, I5, /, I5, /, I5)') a, b, c, d
  ! Output:
  !     1
  !     2
  !     3
  !     4
  
END PROGRAM newline_example
```

### Suppressing Newline (`\` Descriptor)

The backslash (`\`) suppresses the automatic newline at the end of a `WRITE`. Note that `\` is **non-standard** but supported by many compilers (gfortran, ifort).

```fortran
PROGRAM no_newline_example
  IMPLICIT NONE
  
  ! Using backslash (non-standard)
  WRITE(*, '(A, \)') "Downloading"
  WRITE(*, '(A)') "... Done!"
  ! Output: "Downloading... Done!"
  
  ! Using dollar sign (non-standard)
  WRITE(*, '(A, $)') "Processing"
  WRITE(*, '(A)') "... Complete!"
  ! Output: "Processing... Complete!"
  
  ! Without suppression (two lines)
  WRITE(*, '(A)') "Downloading"
  WRITE(*, '(A)') "... Done!"
  ! Output:
  ! Downloading
  ! ... Done!
  
END PROGRAM no_newline_example
```

### Stopping Formatting (`:` Descriptor)

The colon (`:`) descriptor stops the formatting if there are no more items in the I/O list.

```fortran
PROGRAM colon_example
  IMPLICIT NONE
  
  INTEGER :: a = 1, b = 2, c = 3, d = 4
  
  ! With colon - stops if no more items
  WRITE(*, '(I5, :, 1X, I5, :, 1X, I5)') a, b, c
  ! Output: "    1     2     3"
  
  WRITE(*, '(I5, :, 1X, I5, :, 1X, I5)') a, b
  ! Output: "    1     2"
  
  ! Without colon - may cause errors
  WRITE(*, '(I5, 1X, I5, 1X, I5)') a, b
  ! May cause runtime error or unexpected output
  
END PROGRAM colon_example
```

---

## 6. Advanced Formatting Techniques

### Repeating Descriptors

Use a number before a descriptor or group to repeat it.

```fortran
PROGRAM repeat_example
  IMPLICIT NONE
  
  INTEGER :: a = 1, b = 2, c = 3, d = 4
  
  ! Repeat individual descriptors
  WRITE(*, '(3I5)') a, b, c      ! "    1    2    3"
  WRITE(*, '(4I5)') a, b, c, d  ! "    1    2    3    4"
  
  ! Equivalent to I5, 1X, I5, 1X, I5
  WRITE(*, '(3(I5, 1X))') a, b, c  ! "    1     2     3 "
  
  ! Nested repetition
  WRITE(*, '(2(I3, 1X, F6.2))') a, 1.5, b, 2.5
  ! Output: "  1   1.50   2   2.50"
  
END PROGRAM repeat_example
```

### Grouping Descriptors with Parentheses

Parentheses group descriptors, allowing repetition and nested formats.

```fortran
PROGRAM grouping_example
  IMPLICIT NONE
  
  INTEGER :: a = 1, b = 2, c = 3
  REAL :: x = 1.5, y = 2.5, z = 3.5
  
  ! Group of three fields
  WRITE(*, '(3(I3, 1X, F5.2, 2X))') a, x, b, y, c, z
  ! Output: "  1  1.50   2  2.50   3  3.50  "
  
  ! Nested grouping
  WRITE(*, '(2(I3, 1X, F5.2, 1X))') a, x, b, y
  ! Output: "  1  1.50   2  2.50 "
  
END PROGRAM grouping_example
```

### Dynamic Formatting

You can create formats dynamically using character variables.

```fortran
PROGRAM dynamic_format
  IMPLICIT NONE
  
  INTEGER :: width = 10, decimals = 3
  CHARACTER(LEN=50) :: fmt
  REAL :: value = 123.456789
  
  ! Build format string dynamically
  WRITE(fmt, '(A, I2, A, I2, A)') '(F', width, '.', decimals, ')'
  PRINT *, 'Format:', TRIM(fmt)
  
  ! Use the dynamic format
  WRITE(*, fmt) value
  ! Output: "  123.457"
  
  ! Another dynamic format
  WRITE(fmt, '(A, I2, A)') '(A', width, ')'
  WRITE(*, fmt) "Hello"
  ! Output: "Hello     "
  
END PROGRAM dynamic_format
```

### Constructing Complex Formats

```fortran
PROGRAM complex_format_example
  IMPLICIT NONE
  
  ! Define a table format
  WRITE(*, '(A)') "====================="
  WRITE(*, '(A)') "   Name    Age Salary"
  WRITE(*, '(A)') "====================="
  
  WRITE(*, '(A10, 1X, I3, 1X, F8.2)') "John", 30, 45000.00
  WRITE(*, '(A10, 1X, I3, 1X, F8.2)') "Mary", 28, 52000.50
  WRITE(*, '(A10, 1X, I3, 1X, F8.2)') "Bob", 35, 61000.75
  
  WRITE(*, '(A)') "====================="
  
END PROGRAM complex_format_example
```

---

## 7. Practical Examples

### Example 1: Creating a Table

```fortran
PROGRAM table_format
  IMPLICIT NONE
  
  INTEGER :: i
  REAL :: x, y
  
  ! Headers
  WRITE(*, '(A)') "+----------+----------+----------+"
  WRITE(*, '(A)') "|    X     |    Y     |  X^2+Y^2 |"
  WRITE(*, '(A)') "+----------+----------+----------+"
  
  ! Data rows
  DO i = 1, 5
    x = REAL(i)
    y = REAL(i * i)
    WRITE(*, '(A, F8.2, A, F8.2, A, F8.2, A)') &
          "|", x, " |", y, " |", x*x + y*y, " |"
  END DO
  
  WRITE(*, '(A)') "+----------+----------+----------+"
  
END PROGRAM table_format
```

### Example 2: Reading Formatted Data

```fortran
PROGRAM read_format_example
  IMPLICIT NONE
  
  CHARACTER(LEN=100) :: line = "John Doe     25 45000.50"
  CHARACTER(LEN=20) :: name
  INTEGER :: age
  REAL :: salary
  
  ! Read from a string (internal file)
  READ(line, '(A20, I5, F10.2)') name, age, salary
  
  PRINT *, "Name:", TRIM(name)
  PRINT *, "Age:", age
  PRINT *, "Salary:", salary
  
  ! Read from user input with formatting
  PRINT *, "Enter name, age, salary:"
  READ(*, '(A20, I5, F10.2)') name, age, salary
  
END PROGRAM read_format_example
```

### Example 3: Formatting Multiple Data Types

```fortran
PROGRAM mixed_data_format
  IMPLICIT NONE
  
  INTEGER :: id = 1001
  CHARACTER(LEN=15) :: name = "Smith"
  REAL :: gpa = 3.75
  LOGICAL :: honors = .TRUE.
  COMPLEX :: z = (1.5, 2.5)
  
  ! Define a mixed format
100 FORMAT (A, I6, A, A, A, F5.2, A, L3, A, F6.2, A, F6.2, A)
  
  ! Write with formatting
  WRITE(*, 100) "ID:", id, " Name:", TRIM(name), " GPA:", &
                gpa, " Honors:", honors, " Z:", z%RE, ",", z%IM
  
  ! Alternative direct format
  WRITE(*, '(A, I6, A, A, A, F5.2, A, L3, A, F6.2, A, F6.2, A)') &
                "ID:", id, " Name:", TRIM(name), " GPA:", &
                gpa, " Honors:", honors, " Z:", z%RE, ",", z%IM
  
END PROGRAM mixed_data_format
```

### Example 4: Formatting Arrays

```fortran
PROGRAM array_format
  IMPLICIT NONE
  
  INTEGER :: i
  INTEGER, DIMENSION(10) :: arr
  
  ! Fill array
  DO i = 1, 10
    arr(i) = i * i
  END DO
  
  ! Print array in a row
  WRITE(*, '(10I5)') arr
  ! Output: "    1    4    9   16   25   36   49   64   81  100"
  
  ! Print array with labels
  WRITE(*, '(A, /, 10I5)') "Squares:", arr
  ! Output:
  ! Squares:
  !     1    4    9   16   25   36   49   64   81  100
  
  ! Print in multiple rows
  WRITE(*, '(5I5)') arr
  ! Output:
  !     1    4    9   16   25
  !    36   49   64   81  100
  
END PROGRAM array_format
```

### Example 5: Scientific Data Formatting

```fortran
PROGRAM scientific_format
  IMPLICIT NONE
  
  REAL :: avogadro = 6.02214076e23
  REAL :: planck = 6.62607015e-34
  REAL :: electron_mass = 9.1093837e-31
  REAL :: pi = 3.1415926535
  
  ! Scientific notation
  WRITE(*, '(A, E15.7)') "Avogadro's number:", avogadro
  WRITE(*, '(A, E15.7)') "Planck constant:", planck
  WRITE(*, '(A, E15.7)') "Electron mass:", electron_mass
  WRITE(*, '(A, E15.7)') "Pi:", pi
  
  ! Engineering notation
  WRITE(*, '(A, EN15.3)') "Avogadro's number:", avogadro
  WRITE(*, '(A, EN15.3)') "Planck constant:", planck
  
  ! Comparison of formats
  WRITE(*, '(A)') "Comparison:"
  WRITE(*, '(A, F15.8)') "Fixed:", pi
  WRITE(*, '(A, E15.8)') "Scientific:", pi
  WRITE(*, '(A, G15.8)') "General:", pi
  
END PROGRAM scientific_format
```

### Example 6: File I/O with Formatting

```fortran
PROGRAM file_format
  IMPLICIT NONE
  
  INTEGER :: i, ios
  REAL :: x, y, z
  
  ! Write data to file with formatting
  OPEN(10, FILE='data.dat', STATUS='REPLACE', ACTION='WRITE')
  
  ! Write header
  WRITE(10, '(A)') "# x   y   z"
  WRITE(10, '(A)') "# ---------"
  
  ! Write data with format
  DO i = 1, 10
    x = REAL(i)
    y = SIN(x)
    z = COS(x)
    WRITE(10, '(F6.2, 2X, F8.4, 2X, F8.4)') x, y, z
  END DO
  
  CLOSE(10)
  
  ! Read data back
  OPEN(20, FILE='data.dat', STATUS='OLD', ACTION='READ')
  
  ! Skip header lines
  READ(20, '(A)')  ! Skip first line
  READ(20, '(A)')  ! Skip second line
  
  PRINT *, "Data read from file:"
  DO
    READ(20, '(F6.2, 2X, F8.4, 2X, F8.4)', IOSTAT=ios) x, y, z
    IF (ios /= 0) EXIT
    PRINT *, x, y, z
  END DO
  
  CLOSE(20)
  
END PROGRAM file_format
```

---

## 8. Formatting Best Practices

### 1. Use Named Constants for Formats

```fortran
! Good: Named format constant
CHARACTER(LEN=*), PARAMETER :: fmt_table = '(A20, I5, F10.2)'
WRITE(*, fmt_table) name, age, salary

! Better: Multiple formats
CHARACTER(LEN=*), PARAMETER :: fmt_header = '(A)'
CHARACTER(LEN=*), PARAMETER :: fmt_data = '(A20, 1X, I5, 1X, F10.2)'
CHARACTER(LEN=*), PARAMETER :: fmt_separator = '(A)'
```

### 2. Align Columns Properly

```fortran
! Right-justified numbers
WRITE(*, '(I5, 1X, I5, 1X, F10.2)') a, b, c

! Left-justified strings
WRITE(*, '(A20, 1X, I5)') name, age
```

### 3. Use TRIM() for Character Strings

```fortran
! Bad: Extra spaces
WRITE(*, '(A)') name  ! "John Doe          "

! Good: Trimmed
WRITE(*, '(A)') TRIM(name)  ! "John Doe"
```

### 4. Handle Edge Cases

```fortran
! Check for negative numbers
WRITE(*, '(I5)') negative_number  ! " -123"

! Handle zeros
WRITE(*, '(F10.2)') 0.0  ! "      0.00"
```

### 5. Test Formatting with Different Data

```fortran
! Test with small, large, and negative values
CALL test_format(1.0)
CALL test_format(123456.789)
CALL test_format(-45.67)
```

---

## 9. Common Formatting Issues

### Issue 1: Field Width Too Small

```fortran
! Problem: Width too small for data
WRITE(*, '(I3)') 12345  ! Output: "***" (overflow indicator)

! Solution: Use adequate width
WRITE(*, '(I6)') 12345  ! Output: " 12345"

! Or use * for automatic formatting
WRITE(*, '(I*)') 12345  ! Output: "12345"
```

### Issue 2: Extra Spaces in Strings

```fortran
! Problem: Trailing spaces
CHARACTER(LEN=20) :: name = "John"

WRITE(*, '(A)') name  ! "John                "

! Solution: Use TRIM
WRITE(*, '(A)') TRIM(name)  ! "John"
```

### Issue 3: Decimal Places

```fortran
! Problem: Too many decimal places
WRITE(*, '(F10.6)') 3.14  ! "  3.140000"

! Solution: Use fewer decimal places
WRITE(*, '(F10.2)') 3.14  ! "      3.14"
```

### Issue 4: Format String Errors

```fortran
! Problem: Mismatched format and data
WRITE(*, '(I5)') "Hello"  ! Runtime error

! Solution: Match data type
WRITE(*, '(A)') "Hello"   ! Correct
```

---

## 10. Summary

### Quick Reference Table

| Descriptor | Purpose | Example |
|------------|---------|---------|
| **`Iw`** | Integer output | `I5` → "  123" |
| **`Fw.d`** | Fixed-point real | `F10.3` → "  123.456" |
| **`Ew.d`** | Scientific notation | `E15.7` |
| **`Aw`** | Character string | `A20` |
| **`Lw`** | Logical | `L5` → "  T" |
| **`X`** | Space | `1X` |
| **`/`** | Newline | `/` |
| **`\`** | No newline (non-standard) | `\` |
| **`:`** | Stop formatting | `:` |

### Formatting Checklist

- [ ] Use `FORMAT` statement or character string
- [ ] Ensure field widths are adequate
- [ ] Match format descriptors to data types
- [ ] Use `TRIM()` for character strings
- [ ] Align columns for tables
- [ ] Test with edge cases (negative, zero, large)
- [ ] Use `IOSTAT` for file I/O error handling
- [ ] Document complex formats