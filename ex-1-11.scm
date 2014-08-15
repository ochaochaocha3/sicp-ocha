;; Exercise 1.11
(define (f-1-11-r n)
  (if (< n 3)
    n
    (+ (f-1-11-r (- n 1))
       (* 2 (f-1-11-r (- n 2)))
       (* 3 (f-1-11-r (- n 3))))))

;; (define (f-1-11-i n)
;;   (define (f-iter a b c count)
;;     (cond ((= count 0) c)
;;           ((= count 1) b)
;;           (else (f-iter (+ a (* 2 b) (* 3 c))
;;                         a
;;                         b
;;                         (- count 1)))))
;;   (if (< n 0)
;;     n
;;     (f-iter 2 1 0 n)))

(define (f-1-11-i n)
  (define (f-iter a b c count)
    (if (< count 3)
      a
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))
  (if (< n 3)
    n
    (f-iter 2 1 0 n)))
