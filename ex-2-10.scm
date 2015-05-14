;; Exercise 2.10

(add-load-path "." :relative)
(load "ch-2.scm")

;; 区間が 0 を跨るかどうかを返す
(define (span-zero? i)
  (<= (* (lower-bound i) (upper-bound i))
      0))

(define (div-interval x y)
  (if (span-zero? y)
    (error "divided by the interval that spans zero -- DIV-INTERVAL")
    (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))
