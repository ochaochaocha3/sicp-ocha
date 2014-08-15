;; SICP Chapter 1

;; 1.1.4 Compound Procudures
(define (square x) (* x x))

;; 1.1.5 The Substitution Model for Procedure Application
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

;; 1.1.6 Conditional Expressions and Predicates
(define (abs x)
  (if (< x 0)
    (- x)
    x))

;; 1.1.7 Example: Square Roots by Newton's Method
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

;; 1.2.5 Greatest Common Divisors
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

;; 1.2.6 Expample: Testing for Primarity

;; Searching for divisors
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; The Fermat test

;; Mersenne Twister
(use math.mt-random)
(define mt (make <mersenne-twister> :seed (sys-time)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (mt-random-integer mt (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))
