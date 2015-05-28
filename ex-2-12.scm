;; Exercise 2.12

(add-load-path "." :relative)
(load "ch-2.scm")
(load "ex-2-07.scm")

(define (make-center-percent c p)
  (make-center-width c
                     (/ (* c p) 100)))

(define (percent i)
  (let ((c (center i)))
        (/ (* 100 (- (upper-bound i) c))
           c)))
