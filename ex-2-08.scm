;; Exercise 2.8

(add-load-path "." :relative)
(load "ch-2.scm")

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))
