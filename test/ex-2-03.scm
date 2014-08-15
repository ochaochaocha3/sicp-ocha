; Tests for exercise 2.3

(add-load-path ".." :relative)
(load "ex-2-03.scm")

(define p (make-point 2 3))
(define q (make-point -1 -4))

(define rect-p (make-rectangle-p p q))
(define rect-s (make-rectangle-s (make-segment p q)))

(display "[点]")
(newline)
(display "P")
(print-point p)
(display "Q")
(print-point q)

(newline)
(display "[辺の長さ]")
(newline)

(display "点を使って作った長方形")
(newline)
(display "  幅 = ")
(display (width-rectangle-p rect-p))
(newline)
(display "  高さ = ")
(display (height-rectangle-p rect-p))
(newline)

(display "対角線を使って作った長方形")
(newline)
(display "  幅 = ")
(display (width-rectangle-s rect-s))
(newline)
(display "  高さ = ")
(display (height-rectangle-s rect-s))
(newline)

(newline)
(display "[面積]")
(newline)

(display "点を使って作った長方形の面積 = ")
(display (perimeter-rectangle-p rect-p))
(newline)
(display "対角線を使って作った長方形の面積 = ")
(display (perimeter-rectangle-s rect-s))
(newline)
