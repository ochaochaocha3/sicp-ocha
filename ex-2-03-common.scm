;; Exercise 2.3 共通部分

(define (perimeter-rectangle r)
  (* 2 (+ (width-rectangle r)
          (height-rectangle r))))

(define (area-rectangle r)
  (* (width-rectangle r)
     (height-rectangle r)))
