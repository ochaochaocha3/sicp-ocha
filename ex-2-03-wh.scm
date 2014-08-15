;; Exercise 2.3 幅と高さ

(add-load-path "." :relative)
(load "ex-2-03-common.scm")

(define (make-rectangle width height) (cons width height))
(define (width-rectangle r) (car r))
(define (height-rectangle r) (cdr r))
