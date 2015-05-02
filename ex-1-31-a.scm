;; Exercise 1.31 a

(add-load-path "." :relative)

(load "ch-1.scm")

(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(define (pi-prod n)
  (define (pi-term x)
    (/ (* x (+ x 2.0))
       (square (+ x 1))))
  (define (pi-next x)
    (+ x 2))
  (product pi-term 2 pi-next n))
