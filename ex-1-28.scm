(load "./ch-1.scm")

(define (miller-rabin-test n)
  (define (expmod base exp m)
    (define (check-nontrivial-sqrt-1 x)
      (if (and (not (or (= x 1) (= x (- m 1))))
               (= (remainder (square x) m) 1))
        0
        (remainder (square x) m)))
    (cond ((= exp 0) 1)
          ((even? exp) (check-nontrivial-sqrt-1
                         (expmod base (/ exp 2) m))) ;; sqrt 1 の判定
          (else (remainder (* base (expmod base (- exp 1) m)) m))))
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (mt-random-integer mt (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))
