;; Exercise 1.32

(add-load-path "." :relative)

(load "ch-1.scm")

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner
                          null-value
                          term
                          (next a)
                          next
                          b))))

(define (accumulate-i combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (combiner (term a) result))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum-i term a next b)
  (accumulate-i + 0 term a next b))

(define (product-i term a next b)
  (accumulate-i * 1 term a next b))
