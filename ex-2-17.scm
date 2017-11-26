;; Exercise 2.17

(add-load-path "." :relative)
(load "ch-2.scm")
(load "ex-2-07.scm")

(define (my-last-pair items)
  (if (null? (cdr items))
    items
    (my-last-pair (cdr items))))
