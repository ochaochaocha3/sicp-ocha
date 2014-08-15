(load "./ch-1.scm")
(load "./ex-1-22.scm")

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
    (report-prime n (- (runtime) start-time))))
