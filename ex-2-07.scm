;; Exercise 2.7

(add-load-path "." :relative)
(load "ch-2.scm")

;; make-interval に必ず lower, upper の順で渡すことを仮定する
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))
