;; Exercise 1.36
(load "./ch-1.scm")

(define tolerance 0.00001)
(define (fixed-point f guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "guess: ")
      (display guess)
      (display ", next: ")
      (display next)
      (newline)
      (if (close-enough? guess next)
        next
        (try next))))
  (try guess))

(define (f x)
  (/ (log 1000) (log x)))

(define (solve-x^x=1000)
  (fixed-point f 2.0))

(define (solve-x^x=1000-with-average-damping)
  (fixed-point (lambda (x)
                 (average x (f x)))
               2.0))
