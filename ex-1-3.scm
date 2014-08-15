;; Exercise 1.3
;;
;; (define (sum-of-squares-largest-two a b c)
;;   (cond ((and (<= a b) (<= b c)) (sum-of-squares b c))
;;         ((and (<= a c) (<= c b)) (sum-of-squares c b))
;;         ((and (<= b a) (<= a c)) (sum-of-squares a c))
;;         ((and (<= b c) (<= c a)) (sum-of-squares c a))
;;         ((and (<= c a) (<= a b)) (sum-of-squares a b))
;;         ((and (<= c b) (<= b a)) (sum-of-squares b a))))

(define (sum-of-squares-largest-two a b c)
  (if (<= a b)
    (sum-of-squares b (if (<= a c) c a))
    (sum-of-squares a (if (<= b c) c b))))
