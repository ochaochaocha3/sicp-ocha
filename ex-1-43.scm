;; Exercise 1.43
(load "./ex-1-42.scm")
(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))
