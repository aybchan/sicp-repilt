#| Exercise 1.5
 | Ben Bitdiddle has invented a test to determine whether the
 | interpreter he is faced with is using applicative- order 
 | evaluation or normal-order evaluation. He defines the following 
 | two procedures:
 |#
 
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

#| Then he evaluates the expression
 |     (test 0 (p))
 | What behavior will Ben observe with an interpreter that uses
 | applicative-order evaluation? What behavior will he observe with 
 | an interpreter that uses normal-order evaluation? Explain your 
 | answer. (Assume that the evaluation rule for the special form if 
 | is the same whether the interpreter is using normal or 
 | applicative order: The predicate expression is evaluated first, 
 | and the result determines whether to evaluate the consequent or 
 | the alternative expression.)
 |
 | Answer:
 | In applicative-order evaluation, all expressions in a procedure's  | arguments are evaluated when the procedure is applied. Therefore p
 | will be evaluated but never resolve to any value.
 |
 | In normal-order evaluation, the evaluation of expressions is 
 | deferred until the value is needed. In the case of the test 
 | procedure, the consequent 0 is returned since the predicate 
 | evaluates to true. The alternative, y, equivalent to (p), is
 | never evaluated 
 |#
