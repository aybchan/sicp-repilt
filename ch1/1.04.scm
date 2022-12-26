(define (a-plus-abs-b a b) 
  ((if (> b 0) + -) a b))

#| Describe the above procedure:
 | If b is positive, return a + b. Otherwise, if b is
 | negative, return a - b. This definition is equivalent
 | to a + |b| (i.e. a plus the absolute value of b)
 |#