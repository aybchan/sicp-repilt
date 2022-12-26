#| Exercise 1.10
 | The following procedure computes a mathematical function called Ackermann’s 
 | function.
 |#

(define (ex1-10-A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (ex1-10-A (- x 1) (ex1-10-A x (- y 1))))))
#| 
 | What are the values of the following expressions?
 | > (A 1 10)
 | 1024
 |
 | > (A 2 4)
 | 65536
 |
 | > (A 3 3)
 | 65536
 | 
 | Consider the following procedures, where A is the procedure defined above:
 |
 | (define (f n) (A 0 n))
 | (define (g n) (A 1 n))
 | (define (h n) (A 2 n))
 |
 | Give concise mathematical definitions for the functions computed by the 
 | procedures f, g, and h for positive integer values of n.
 | 
 | > (f n)
 | = (A 0 n)
 | = (* 2 n)
 | f(n) is equal to 2n
 | 
 | > (g n)
 | = (A 1 n)
 | = (A 0 (A 1 (- n 1)))
 | = (A 0 (g (- n 1)))
 | = (A 0 (A 0 (A 1 (- n 2)))
 | = (A 0 (A 0 (A 0 (A 1 (- n 3)))
 | ... until n - y == 1
 | g(n) is equal to 2^n
 |
 | > (h n)
 | = (A 2 n)
 | = (A 1 (A 2 (- n 1)))
 | = (g (A 2 (- n 1)))
 | = (g (h (- n 1)))
 | = (g (g (h (- n 2))))
 | = (g (g (g (h (- n 3)))))
 | ...
 | h(n) is equal to 2^2^2... n times
 |#