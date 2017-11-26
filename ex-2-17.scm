;; 問題2.17

(add-load-path "." :relative)
(load "ch-2.scm")

(define (my-last-pair items)
  (if (null? (cdr items))
    items
    (my-last-pair (cdr items))))
