;; Exercise 1.8
(define (improve-cbrt guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cbrt-iter guess x)
  (if (good-enough?-change guess (improve-cbrt guess x))
    guess
    (cbrt-iter (improve-cbrt guess x) x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(define (cube x)
  (* x x x))
