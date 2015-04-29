(add-load-path "." :relative)

(load "ch-1.scm")

(define (miller-rabin-test n)
  (define (expmod base exp m)
    ;; 1 の非自明な平方根かどうかを調べる
    (define (check-nontrivial-sqrt-1 x)
      (cond ((= x 1) 1)       ; 1 の自明な平方根
            ((= x (- m 1)) 1) ; 1 の自明な平方根
            (else
              (let ((r (remainder (square x) m)))
                (if (= r 1)
                  0 ; 1 の非自明な平方根であることを示すシグナル
                  r)))))
    (cond ((= exp 0) 1)
          ((even? exp) (check-nontrivial-sqrt-1
                         (expmod base (/ exp 2) m)))
          (else (remainder (* base (expmod base (- exp 1) m))
                           m))))
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (prime? n)
  ;; Miller-Rabin テストを 20 回行うので誤りの確率は
  ;; (1/4)^20 ≈ 10^(-12)
  (fast-prime? n 20))
