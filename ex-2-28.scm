;;; 問題2.28 fringe: 葉のリストを返す

(define nil (list))

;; 再帰プロセス版
(define (fringe items)
  (cond ((null? items) nil)
        ((not (pair? items)) (list items))
        (else (append (fringe (car items))
                      (fringe (cdr items))))))

;; 反復プロセス版
(define (fringe-rec items)
  (define (iter ls acc)
    (if (null? ls)
      acc
      (iter (cdr ls)
            (if (list? (car ls))
              (iter (car ls) acc)
              (cons (car ls) acc)))))
  (reverse (iter items nil)))
