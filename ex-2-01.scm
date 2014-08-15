;; Exercise 2.1

(add-load-path "." :relative)
(load "ch-2.scm")

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (negative? d)
      (cons (/ (- n) g) (/ (- d) g))
      (cons (/ n g) (/ d g)))))
