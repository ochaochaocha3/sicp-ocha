(load "./ch-1.scm")
(load "./ex-1-22.scm")

;; (define (find-divisor n test-divisor)
;;   (cond ((> (square test-divisor) n) n)
;;         ((divides? test-divisor n) test-divisor)
;;         (else (find-divisor n (+ test-divisor 1)))))

(define (find-divisor n test-divisor)
  (define (next n)
    (if (= n 2)
      3
      (+ n 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
