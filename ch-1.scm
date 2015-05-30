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

(use srfi-27)

(define (random n) (random-integer n))
(random-source-randomize! default-random-source)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

;; 1.3  Formulating Abstractions with Higher-Order Procedures

;; 三乗を得る
(define (cube x) (* x x x))

;; 1.3.1 Procedures as Arguments

;; 総和を求める
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

;; 引数を 1 増やす
(define (inc n) (+ n 1))

;; a から b までの整数の三乗の和
(define (sum-cubes a b)
  (sum cube a inc b))

;; 恒等手続き
(define (identity x) x)

;; a から b までの整数の和
(define (sum-integers a b)
  (sum identity a inc b))

;; π/8 に収束する級数
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

;; 定積分（台形公式）
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;; 1.3.3 Procedures as General Methods

;; Finding roots of equations by the half-interval method
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
      midpoint
      (let ((test-value (f midpoint)))
        (cond ((positive? test-value)
               (search f neg-point midpoint))
              ((negative? test-value)
               (search f midpoint pos-point))
              (else midpoint))))))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
            (error "Values are not of opposite sign" a b)))))

;; Finding fixed points of functions
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))
