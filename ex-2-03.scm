;; Exercise 2.3

(add-load-path "." :relative)
(load "ex-2-02.scm")

; $B;OE@$H=*E@$GD9J}7A$rDj5A$9$k(B
(define (make-rectangle-p start end) (cons start end))
(define (start-rectangle-p r) (car r))
(define (end-rectangle-p r) (cdr r))

(define (width-rectangle-p r)
  (abs (- (x-point (end-rectangle-p r))
          (x-point (start-rectangle-p r)))))
(define (height-rectangle-p r)
  (abs (- (y-point (end-rectangle-p r))
          (y-point (start-rectangle-p r)))))
(define (perimeter-rectangle-p r)
  (* (width-rectangle-p r) (height-rectangle-p r)))

; $BBP3Q@~$GD9J}7A$rDj5A$9$k(B
(define (make-rectangle-s s) s)
(define (diagonal-rectangle-s r) r)

(define (width-rectangle-s r)
  (let ((diagonal (diagonal-rectangle-s r)))
    (abs (- (x-point (end-segment diagonal))
            (x-point (start-segment diagonal))))))
(define (height-rectangle-s r)
  (let ((diagonal (diagonal-rectangle-s r)))
    (abs (- (y-point (end-segment diagonal))
            (y-point (start-segment diagonal))))))
(define (perimeter-rectangle-s r)
  (* (width-rectangle-s r) (height-rectangle-s r)))
