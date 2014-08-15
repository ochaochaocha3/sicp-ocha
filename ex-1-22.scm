;; runtime for Gauche
(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))

(load "./ch-1.scm")

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (print n "," elapsed-time))

(define (search-for-primes start end)
  (define (iter n)
    (cond ((<= n end) (timed-prime-test n)
                      (iter (+ n 2)))))
  (if (even? start)
    (iter (+ start 1))
    (iter start)))

(define (sp-test)
  (define l
    (map inexact->exact '(1e3 1e4 1e5 1e6)))
  (define (sp-100 x)
    (search-for-primes x (+ x 100)))
  (for-each sp-100 l))
