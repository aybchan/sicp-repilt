#| Exercise 1.8
 | Newton’s method for cube roots is based on the fact that if y is an 
 | approximation to the cube root of x, then a better approximation is given 
 | by the value
 |
 | ( x / (y^2) + 2y) / 3
 | 
 | Use this formula to implement a cube-root procedure analogous to the 
 | square-root procedure.
 |
 |#

(define (ex1-8-cube-root x)
  (define (cube-iter guess)
    (define (good-enough? guess)
      (define tolerance 0.0001)
      (define (cube x) (* x x x))
      (< (abs (- (cube guess) x)) tolerance))
    (define (improve guess)
     (/ (+ (/ x
              (* guess guess))
           (* 2 guess))
        3))
    (if (good-enough? guess)
        guess
        (cube-iter (improve guess))))
  (cube-iter 1))
