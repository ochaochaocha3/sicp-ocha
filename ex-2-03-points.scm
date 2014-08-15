;; Exercise 2.3 2点

(add-load-path "." :relative)
(load "ex-2-02.scm")
(load "ex-2-03-common.scm")

(define (make-rectangle start end) (cons start end))
(define (start-rectangle r) (car r))
(define (end-rectangle r) (cdr r))

(define (width-rectangle r)
  (abs (- (x-point (end-rectangle r))
          (x-point (start-rectangle r)))))
(define (height-rectangle r)
  (abs (- (y-point (end-rectangle r))
          (y-point (start-rectangle r)))))
