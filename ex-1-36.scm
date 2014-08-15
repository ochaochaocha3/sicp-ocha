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

(define (solve-x^x=1000 average-damping)
  (if average-damping
    (fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
                 2.0)
    (fixed-point (lambda (x) (/ (log 1000) (log x)))
                 2.0)))
