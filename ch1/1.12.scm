#| Exercise 1.12
 | Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.
 |#

(define (pascal row col)
  (if (or (= row 1) (= col 1) (= col row))
      1
      (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col))))