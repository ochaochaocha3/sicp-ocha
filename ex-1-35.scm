;; Exercise 1.35

(add-load-path "." :relative)

(load "ch-1.scm")

;; 不動点探索で求めた黄金比
(define golden-ratio-as-fixed-point
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))

;; 正確な黄金比
(define accurate-golden-ratio
  (/ (+ 1 (sqrt 5)) 2.0))
