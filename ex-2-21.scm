;;; 問題2.21

(define (square x) (* x x))
(define nil (list))

;; map不使用
(define (square-list items)
  (if (null? items)
    nil
    (cons (square (car items))
          (square-list (cdr items)))))

;; map使用
(define (square-list-map items)
  (map square items))
