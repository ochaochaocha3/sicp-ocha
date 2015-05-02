;; Exercise 1.29
(add-load-path "." :relative)

(load "ch-1.scm")

(define (integral-simpson f a b n)
  (let ((h (/ (- b a) n)))
    (define (y k) (f (+ a (* k h))))
    (define (term k)
      (* (cond ((or (= k 0) (= k n)) 1.0)
               ((even? k) 2.0)
               (else 4.0))
         (y k)))
    (* (/ h 3) (sum term 0 inc n))))
