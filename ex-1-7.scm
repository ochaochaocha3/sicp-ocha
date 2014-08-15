;; Exercise 1.7
(define (good-enough?-change before after)
  (< (abs (- after before)) (* before 1e-8)))

(define (sqrt-iter-change guess x)
  (if (good-enough?-change guess (improve guess x))
    guess
    (sqrt-iter-change (improve guess x) x)))
