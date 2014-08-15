;; Exercise 1.12

(define (pascal m n)
  (cond ((or (< n 0) (< m n)) 0)
        ((or (= n 1) (= n m)) 1)
        (else (+ (pascal (- m 1) (- n 1))
                 (pascal (- m 1) n)))))
