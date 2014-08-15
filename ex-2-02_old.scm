; SICP Exercise 2.2

; 平面上の線分
(define (make-segment starting-point ending-point)
  (cons starting-point ending-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

; 点
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (print-point point)
  (display "(")
  (display (x-point point))
  (display ",")
  (display (y-point point))
  (display ")")
  (newline))

; 線分の中点
(define (midpoint-segment segment)
  (let ((average (lambda (x y) (/ (+ x y) 2)))
        (starting-point (start-segment segment))
        (ending-point (end-segment segment)))
    (let ((mid-x (average (x-point starting-point)
                          (x-point ending-point)))
          (mid-y (average (y-point starting-point)
                          (y-point ending-point))))
      (make-point mid-x mid-y))))

(define (test-midpoint-segment)
  (let ((p1 (make-point 1 2))
        (p2 (make-point 3 4)))
    (let ((s (make-segment p1 p2)))
      (let ((m (midpoint-segment s)))
        (and (equal? 2 (x-point m))
             (equal? 3 (y-point m)))))))
