;; Exercise 1.40
(load "./ch-1.scm")

(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))
