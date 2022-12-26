#| Exercise 1.11
 | A function f is defined by the rule that
 |     f(n) = { n, if n < 3
 |            { f(n - 1) + 2f(n - 2) + 3f(n - 3), if n ≥ 3
 | Write a procedure that computes f by means of a recursive process. Write a 
 | procedure that computes f by means of an iterative process.
 |#

(define (ex1-11-f-recursive n)
  (if (< n 3)
      n
      (+ (ex1-11-f-recursive (- n 1)) (* 2 (ex1-11-f-recursive (- n 2))) (* 3 (ex1-11-f-recursive (- n 3)))) ))


(define (ex1-11-f-iterative n)
  (define (f-iter count fn-1 fn-2 fn-3)
    (define (f fn-1 fn-2 fn-3) 
      (+ fn-1
         (* 2 fn-2)
         (* 3 fn-3)))
    (if (< count n) 
        (f-iter (+ count 1) (f fn-1 fn-2 fn-3) fn-1 fn-2)
        (f fn-1 fn-2 fn-3))
    )
  (if (< n 3) 
      n
      (f-iter 3 2 1 0)))