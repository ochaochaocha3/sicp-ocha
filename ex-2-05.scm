;; Exercise 2.5

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car c)
  (define (exponent-2 x e)
    (if (zero? (remainder x 2))
      (exponent-2 (/ x 2) (+ e 1))
      e))
  (exponent-2 c 0))

(define (cdr c)
  (define (exponent-3 x e)
    (if (zero? (remainder x 3))
      (exponent-3 (/ x 3) (+ e 1))
      e))
  (exponent-3 c 0))
