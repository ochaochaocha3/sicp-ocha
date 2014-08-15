;; Exercise 1.44
(load "./ex-1-43.scm")

(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x)
      (/ (+ (f (- x dx)) (f x) (f (+ x dx)))
         3))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
