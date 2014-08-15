(load "./ch-1.scm")

(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (product-i term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (* (term a) result))))
  (iter a 1))

(define (factorial n)
  (if (= n 0)
    1
    (product identity 1 inc n)))

(define (pi-prod n)
  (define (term k)
    (/ (* 4.0 k (+ k 1)) (square (+ (* 2 k) 1))))
  (product term 1 inc n))
