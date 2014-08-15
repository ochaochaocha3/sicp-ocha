;; Exercise 2.3 対角線

(add-load-path "." :relative)
(load "ex-2-02.scm")
(load "ex-2-03-common.scm")

(define (make-rectangle diagonal) diagonal)
(define (diagonal-rectangle r) r)

(define (width-rectangle r)
  (let ((diagonal (diagonal-rectangle r)))
    (abs (- (x-point (end-segment diagonal))
            (x-point (start-segment diagonal))))))
(define (height-rectangle r)
  (let ((diagonal (diagonal-rectangle r)))
    (abs (- (y-point (end-segment diagonal))
            (y-point (start-segment diagonal))))))
