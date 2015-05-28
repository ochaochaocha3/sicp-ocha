;; Exercise 1.33

(add-load-path "." :relative)

(load "ch-1.scm")

;; 再帰的プロセス
; (define (filtered-accumulate combiner null-value pred term a next b)
;   (if (> a b)
;     null-value
;     (if (pred a)
;       (combiner (term a)
;                 (filtered-accumulate combiner
;                                      null-value
;                                      pred
;                                      term
;                                      (next a)
;                                      next
;                                      b))
;       (filtered-accumulate combiner
;                            null-value
;                            pred
;                            term
;                            (next a)
;                            next
;                            b))))

;; 反復的プロセス
(define (filtered-accumulate combiner null-value pred term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (if (pred a)
              (combiner (term a) result)
              result))))
  (iter a null-value))

(define (sum-of-squared-primes a b)
  (filtered-accumulate + 0 prime? square a inc b))

(define (product-of-relatively-prime-numbers n)
  (define (relatively-prime? i) (= (gcd n i) 1))
  (filtered-accumulate * 1 relatively-prime? identity 1 inc (- n 1)))
