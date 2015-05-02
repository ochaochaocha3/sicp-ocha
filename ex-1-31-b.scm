;; Exercise 1.31 b

(add-load-path "." :relative)

(load "ex-1-31-a.scm")

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (* (term a) result))))
  (iter a 1))
