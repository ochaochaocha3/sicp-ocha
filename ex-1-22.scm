;; runtime for Gauche
(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))

(load "./ch-1.scm")

(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime))
  (newline))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (cond ((> start end) 'finished)
        ((< start 2) (search-for-primes 2 end))
        (else (timed-prime-test start)
              (search-for-primes
                (+ start
                   (if (even? start) 1 2))
                end))))
