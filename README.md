
# AMTH-250 — Fortran Programming

A curated collection of Fortran assignments, examples, and utilities for AMTH-250 (Fortran Programming), Department of Applied Mathematics, University of Dhaka.

Table of Contents
-----------------
- Course summary
- Repository layout
- Requirements
- Build & run
- Contributing
- Academic integrity
- Contact

Course summary
--------------
This repository contains practical assignments and example code used in AMTH-250 (Fortran Programming). The codebase is intended for learning core Fortran language features and numerical programming techniques applied to problems in applied mathematics.

Repository layout
-----------------
- Assignment-01/: Assignment solutions and related data files.
- practice/: Example programs and small exercises organized by topic.
- README.md: This file.

Requirements
------------
- GNU Fortran (`gfortran`) — recommended. Verify with:

```bash
gfortran --version
```

Build & run
-----------
To compile a Fortran source file:

```bash
gfortran -Wall -Wextra -fcheck=all program.f90 -o program
```

Run on Linux/macOS:

```bash
./program
```

Tips
----
- Use `implicit none` in every program.
- Prefer descriptive variable and file names.
- Keep numerical kernels isolated in subroutines or modules for reuse and testing.

Contributing
------------
Contributions should follow course policies. If you add or modify code:

- Provide a clear description of the change in the commit message.
- Include input files and sample output if applicable.
- Keep implementations focused and well-documented.

Academic integrity
------------------
All submissions must be the student's own work. Cite any external references and do not submit uncredited copied code.

License & contact
-----------------
This repository is for educational use. For questions or corrections, contact: Md. Asraful Islam (AE-123-051), Department of Applied Mathematics, University of Dhaka.

----
If you want, I can also:
- Add a short CONTRIBUTING.md
- Add a sample build script or Makefile
- Run a quick compilation check for a chosen file
Tell me which of these you want next.
