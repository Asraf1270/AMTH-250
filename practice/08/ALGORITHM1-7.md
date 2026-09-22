# ALGORITHM SUMMARY: QUESTIONS 1 TO 7

---

### Question 1: Hospital Rules Equivalence Check
1. Open output file `out4q1.txt` and write table headers[cite: 1].
2. Iterate through all $2^3 = 8$ truth value combinations for $F, B, C \in \{\text{True}, \text{False}\}$[cite: 1].
3. For each combination, evaluate:
   * $R_1 = (F \wedge B) \vee (F \wedge C) \vee (B \wedge C)$[cite: 1]
   * $R_2 = (F \wedge B) \vee [C \wedge (F \vee B)]$[cite: 1]
4. Check if $R_1 \leftrightarrow R_2$ holds for all rows. Write truth table and equivalence conclusion to file.

---

### Question 2: Thermostat Rules Tautology Check
1. Open output file `out4q2.txt` and write table headers[cite: 1].
2. Iterate through all $2^3 = 8$ truth value combinations for $W, H, AC \in \{\text{True}, \text{False}\}$[cite: 1].
3. Compute:
   * Version A: $A = [AC \leftrightarrow (W \wedge H)]$[cite: 1]
   * Version B: $B = [(\neg W \vee \neg H) \rightarrow \neg AC]$[cite: 1]
4. Evaluate $(A) \leftrightarrow (B)$. If true for all rows, output "Tautology"; otherwise, output "Not a Tautology".

---

### Question 3: Biconditional Equivalence Proof
1. Open output file `out4q3.txt` and write headers[cite: 1].
2. Loop over all $2^2 = 4$ combinations for $p, q \in \{\text{True}, \text{False}\}$[cite: 1].
3. Compute $p \rightarrow q$, $p \leftrightarrow q$, and $E = (p \wedge q) \vee (\neg p \wedge \neg q)$[cite: 1].
4. Compare $(p \leftrightarrow q)$ with $E$. Output truth table and confirm logical equivalence.

---

### Question 4: Negated Biconditional Proof (via Subroutine)
1. Open output file `out4q4.txt` and write headers[cite: 1].
2. Loop over $p, q \in \{\text{True}, \text{False}\}$[cite: 1].
3. Call subroutine `compute_expressions(p, q, lhs, rhs)` which invokes `biconditional(a, b)` to get:
   * $\text{LHS} = \neg(p \leftrightarrow q)$[cite: 1]
   * $\text{RHS} = p \leftrightarrow \neg q$[cite: 1]
4. Verify $\text{LHS} == \text{RHS}$ for all rows and write results to file.

---

### Question 5: Tower of Hanoi Moves, Time, and Cost
1. Open output file `out4q5.txt` and print headers[cite: 1].
2. Define recursive function `hanoi(n)`: if $n \le 1$ return 1; else return $2 \times \text{hanoi}(n-1) + 1$[cite: 1].
3. Loop $n$ from 1 to 10[cite: 1]:
   * Calculate $H_n = \text{hanoi}(n)$, $\text{Time} = \frac{H_n \times 3}{60}$, and $\text{Cost} = H_n \times 0.02$[cite: 1].
4. Tabulate and write $n, H_n, \text{Time}$, and $\text{Cost}$ to file.

---

### Question 6: Mersenne Numbers Primality Test
1. Open output file `out4q6.txt` and print headers[cite: 1].
2. Loop $n$ from 0 to 14[cite: 1]:
   * Calculate $M_n = 2^n - 1$[cite: 1].
   * Call `is_prime(M_n)`: return false if $M_n \le 1$ or divisible by any odd $i \le \sqrt{M_n}$; else true.
3. Tabulate $n, M_n$, and prime status ("Prime", "Composite", or "Neither").

---

### Question 7: Hanoi Sequence vs. Mersenne Sequence Comparison
1. Open output file `out4q7.txt` and print headers[cite: 1].
2. Loop $n$ from 1 to 10[cite: 1]:
   * Compute $H_n$ using `hanoi(n)` and $M_n = 2^n - 1$[cite: 1].
   * Check if $H_n == M_n$.
3. Tabulate results side by side and state conclusion that $H_n = M_n$ for all $n \ge 1$[cite: 1].