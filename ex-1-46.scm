;; Exercise 1.46
(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (try guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
          next
          (try next))))
    (try first-guess)))

(define (sqrt x)
  (define (good-enough? before after)
    (let ((tolerance 0.00001))
      (< (abs (- 1 (/ after before))) tolerance)))
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.00001))
      (< (abs (- v1 v2)) tolerance)))
  (define (improve guess)
    (f guess))
  ((iterative-improve close-enough? improve) first-guess))
