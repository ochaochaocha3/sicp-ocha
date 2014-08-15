(load "./ch-1.scm")

(define (filtered-accumulate combiner null-value term filter a next b)
  (define (next-step)
    (filtered-accumulate combiner
                         null-value
                         term
                         filter
                         (next a)
                         next
                         b))
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a) (next-step)))
        (else (next-step))))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate + 0 square prime? a inc b))

(define (product-of-relatively-prime-numbers n)
  (define (relatively-prime? i) (= (gcd i n) 1))
  (filtered-accumulate * 1 identity relatively-prime? 1 inc (- n 1)))
