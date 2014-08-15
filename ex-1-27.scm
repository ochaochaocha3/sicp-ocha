(load "./ch-1.scm")

(define (fool-fermat-test? n)
  (define (iter a)
    (cond ((= a 0) #t)
          ((= (expmod a n n) a) (iter (- a 1)))
          (else #f)))
  (iter (- n 1)))
