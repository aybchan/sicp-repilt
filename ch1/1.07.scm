#| Exercise 1.7
 | The good-enough? test used in computing square roots will not be
 | very effective for finding the square roots of very small 
 | numbers. Also, in real computers, arithmetic operations are 
 | almost always performed with limited precision. This makes our 
 | test inadequate for very large numbers. Explain these statements,
 | with examples showing how the test fails for small and large 
 | numbers. An alternative strategy for implementing good-enough?
 | is to watch how guess changes from one iteration to the next and 
 | to stop when the change is a very small fraction of the guess.
 | Design a square-root procedure that uses this kind of end test. 
 | Does this work better for small and large numbers?
 |#

(define (ex1-7-sqrt x)
  (define (sqrt-iter guess x)
    (define (improve guess x)
      (define (average x y) 
        (/ (+ x y) 2))
      (average guess (/ x guess)))
    (define (good-enough? guess x) 
      (define tolerance 0.001)
      (define (square x) (* x x))
      (< (abs (- (square guess) x)) tolerance))
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    ))
  (sqrt-iter 1 x))

#| Answer:
 | 1. The use of a fixed tolerance value means that for small numbers, the 
 | tolerance could be a large proportion or even greater than the value 
 | itself which would mean the iterative routine would return a guess before 
 | a reasonable square root value is found. For example:
 |
 | > (ex1-7-sqrt 0.0001)
 | 0.03230844833048122
 |
 | > (- (* 0.03230844833048122 0.03230844833048122) 0.0001)
 | 9.438358335233747e-4
 | 
 | The error (difference of squares) using the returned guess is over 9x
 | greater than the expected square itself.
 | 
 | 2. Since computers use limited precision, the test which squares guesses 
 | to test that it produces an error within tolerance will result, for large 
 | guesses, in lost precision. This results in the error being very large 
 | and inaccuracte, and the test would not be useful. The iterative 
 | procedure would never converge to a value for the guess that produces an 
 | error within tolerance.
 |
 | 3. Iterative square root using relative improvement as a criterion:
 | Keep track of previous guess as a new state variable in the iterative 
 | procedure. This works beter for square roots of smaller numbers compared 
 | to larger numbers as the absolute difference bewtween guesses can be large
 | even if their relative difference falls within a tolerance (e.g. 0.0001% 
 | of 1e10 is 1e4)
 |# 
 
(define (ex1-7-sqrt-relative x)
  (define (sqrt-iter guess old-guess x)
    (define (improve guess x)
      (define (average x y) 
        (/ (+ x y) 2))
      (average guess (/ x guess)))
    (define (good-enough? guess old-guess) 
      (define tolerance 0.001)
      (< (abs (/ (- guess old-guess) guess)) tolerance))
    (if (good-enough? guess old-guess)
        guess
        (sqrt-iter (improve guess x) guess x)
    ))
  (sqrt-iter 1 0 x))
