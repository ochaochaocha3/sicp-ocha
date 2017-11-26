;; 問題2.17

(define (my-last-pair items)
  (if (null? (cdr items))
    items
    (my-last-pair (cdr items))))
