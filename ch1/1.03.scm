#| Exercise 1.3
 | Define a procedure that takes three numbers as arguments 
 | and returns the sum of the squares of the two larger numbers.
 |#
(define (ex1-3 x y z)
  (define (square x) (* x x))
  (define (sum-of-squares x y) (+ (square x) (square y)))
  (cond ((and (> x y) (> y z)) (sum-of-squares x y))
        ((and (> x y) (> z y)) (sum-of-squares x z))
        (else (sum-of-squares y z)))
)

#|
 | > (ex1-3 3 4 5)
 | 41
 | > (ex1-3 5 2 1)
 | 29
 |#