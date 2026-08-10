# AMTH-250 — Fortran Programming

## Applied Mathematics

### University of Dhaka

This repository contains the assignments, source codes, and related materials for **AMTH-250: Fortran Programming** under the **Department of Applied Mathematics, University of Dhaka**.

The purpose of this course is to develop a strong foundation in the **Fortran programming language** and its applications to mathematical, scientific, and numerical computing.

---

## 📚 Course Information

| Information              | Details             |
| ------------------------ | ------------------- |
| **Course Code**          | AMTH-250            |
| **Course Title**         | Fortran Programming |
| **Department**           | Applied Mathematics |
| **University**           | University of Dhaka |
| **Programming Language** | Fortran             |
| **Academic Session**     | ***2024-25***  |

---

## 🎯 Objectives

The main objectives of this course are to:

* Learn the fundamentals of the Fortran programming language.
* Develop structured and efficient programming techniques.
* Understand variables, data types, operators, and expressions.
* Work with conditional statements and loops.
* Use arrays for mathematical and numerical computations.
* Develop programs using functions and subroutines.
* Understand file input/output operations.
* Implement mathematical and numerical algorithms.
* Apply programming techniques to problems in applied mathematics.
* Develop good programming, documentation, and problem-solving practices.

---

## 🧑‍💻 Topics Covered

The assignments in this repository cover fundamental and advanced concepts of Fortran programming, including:

### 1. Introduction to Fortran

* History and features of Fortran
* Structure of a Fortran program
* Source files and compilation
* Program execution
* Comments and documentation
* Free-form source code

### 2. Variables and Data Types

* Integer
* Real
* Double precision
* Complex
* Logical
* Character
* Constants and parameters
* Variable declaration
* Implicit and explicit typing

### 3. Operators and Expressions

* Arithmetic operators
* Relational operators
* Logical operators
* Assignment statements
* Mathematical expressions
* Operator precedence

### 4. Input and Output

* Standard input and output
* `READ` statement
* `PRINT` statement
* `WRITE` statement
* Formatted input/output
* File handling
* Opening and closing files

### 5. Conditional Statements

* `IF`
* `IF...ELSE`
* `IF...ELSE IF`
* Nested conditional statements
* `SELECT CASE`

### 6. Loops and Iteration

* `DO` loops
* `DO WHILE`
* Nested loops
* Loop control
* `EXIT`
* `CYCLE`

### 7. Arrays

* One-dimensional arrays
* Two-dimensional arrays
* Multidimensional arrays
* Array initialization
* Array operations
* Array intrinsic functions

### 8. Functions and Subroutines

* User-defined functions
* Subroutines
* Arguments and parameters
* Passing values between procedures
* Intrinsic functions
* Modular programming

### 9. Strings and Character Handling

* Character variables
* String manipulation
* String comparison
* Character intrinsic functions

### 10. Modules

* Creating modules
* Using modules
* Sharing variables and procedures
* Organizing larger programs

### 11. File Processing

* Opening files
* Reading from files
* Writing to files
* Formatted files
* Sequential file processing
* Error handling during file operations

### 12. Numerical and Mathematical Programming

The course also focuses on applying Fortran to mathematical problems such as:

* Polynomial calculations
* Matrix operations
* Solving systems of equations
* Numerical differentiation
* Numerical integration
* Root-finding methods
* Interpolation
* Series calculations
* Statistical calculations
* Other computational mathematics problems

---

## ⚙️ Requirements

To compile and run the programs, a Fortran compiler is required.

### Recommended Compiler

**GNU Fortran (`gfortran`)** is recommended.

It is part of the GNU Compiler Collection (GCC).

Check whether `gfortran` is installed:

```bash
gfortran --version
```

If the compiler is installed correctly, the command will display the installed version.

---

## ▶️ How to Compile and Run

For a Fortran source file named `program.f90`:

### Compile

```bash
gfortran program.f90 -o program
```

### Run

On Linux/macOS:

```bash
./program
```

On Windows:

```bash
program.exe
```

### Example

```bash
gfortran hello.f90 -o hello
./hello
```

---

## 📌 Programming Guidelines

The following practices should be followed throughout the assignments:

1. Use `implicit none` in every program.
2. Use meaningful variable and procedure names.
3. Add comments where necessary.
4. Maintain consistent indentation.
5. Avoid unnecessary repetition of code.
6. Use appropriate data types and precision.
7. Validate user input when appropriate.
8. Keep programs organized and readable.
9. Use functions and subroutines for reusable operations.
10. Clearly document numerical algorithms and mathematical formulas.

---

## 📐 Mathematical Problem-Solving

For assignments involving mathematical or numerical methods, the solution should ideally contain:

1. **Problem statement**
2. **Mathematical formulation**
3. **Algorithm or method**
4. **Fortran implementation**
5. **Input**
6. **Output**
7. **Result and discussion**

For numerical methods, appropriate attention should also be given to:

* Accuracy
* Convergence
* Error estimation
* Computational efficiency
* Choice of numerical method

---

## 📄 Assignment Format

Each assignment should preferably contain:

```text
Assignment Title
----------------
Course: AMTH-250
Course: Fortran Programming
Department: Applied Mathematics
University: University of Dhaka

Problem Statement
-----------------
Description of the problem.

Method
------
Mathematical method or algorithm used.

Source Code
-----------
Fortran implementation.

Input
-----
Required input values.

Output
------
Expected/output results.

Discussion
----------
Explanation of the result.
```

---

## 🔬 Compilation Flags

For development and debugging, the following command is useful:

```bash
gfortran -Wall -Wextra -fcheck=all program.f90 -o program
```

For stricter checking, additional compiler options can be used depending on the compiler version and development environment.

---

## 🗂️ File Naming Convention

Fortran source files should preferably use the `.f90` extension:

```text
program.f90
matrix_operations.f90
numerical_integration.f90
root_finding.f90
```

Use descriptive names that clearly indicate the purpose of the program.

---

## 🎓 Academic Integrity

All programs submitted for this course should represent the student's own work.

Students are encouraged to:

* Understand every part of the submitted code.
* Properly acknowledge external references.
* Avoid submitting copied code without understanding it.
* Follow the academic policies and guidelines of the University of Dhaka.

---

## 📚 References

Useful resources for learning Fortran include:

* Fortran language documentation
* GNU Fortran documentation
* Fortran programming textbooks
* Numerical methods textbooks
* Course lectures and materials provided by the Department of Applied Mathematics

---

## 👨‍🎓 Student Information

**Name:** *Md. Asraful Islam*
**Student ID:** *AE-123-051*
**Department:** Applied Mathematics
**University:** University of Dhaka
**Course:** AMTH-250 — Fortran Programming

---

## 📌 Note

This repository is intended for coursework and educational purposes. It contains Fortran programs developed as part of the **AMTH-250: Fortran Programming** course in the **Department of Applied Mathematics, University of Dhaka**.

---

## ⭐ Acknowledgement

Developed as part of the academic coursework for **AMTH-250 — Fortran Programming**, Department of Applied Mathematics, University of Dhaka.
