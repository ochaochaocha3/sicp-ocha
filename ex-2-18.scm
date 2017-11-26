;; 問題2.18

(add-load-path "." :relative)
(load "ch-2.scm")

(define (my-reverse items)
  (if (null? items)
    items
    (append (reverse (cdr items))
            (list (car items)))))

(define (my-reverse-tail items)
  (define (my-reverse-iter ls acc)
    (if (null? ls)
      acc
      (my-reverse-iter (cdr ls)
                       (cons (car ls) acc))))
  (my-reverse-iter items nil))
