;; Exercise 1.38
(load "./ex-1-37.scm")

(define (approx-e k)
  (+ 2 (cont-frac (lambda (i) 1.0)
                  (lambda (i)
                    (if (= (remainder i 3) 2)
                      (/ (* 2 (+ i 1)) 3)
                      1))
                  k)))
