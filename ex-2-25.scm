;;; 問題2.25

;; (1 3 (5 7) 9) から7を取り出す
(define (take-7-1)
  (let ((items (list 1 3 (list 5 7) 9)))
    (car (cdr
           (car (cdr (cdr items)))))))

;; ((7)) から7を取り出す
(define (take-7-2)
  (let ((items (list (list 7))))
    (car (car items))))

;; (1 (2 (3 (4 (5 (6 7)))))) から7を取り出す
(define (take-7-3)
  (let ((items (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))
    (car (cdr ; 6 7
           (car (cdr ; 5 (6 7)
                  (car (cdr ; 4 (5 (6 7))
                         (car (cdr ; 3 (4 (5 (6 7)))
                                (car (cdr ; 2 (3 (4 (5 (6 7))))
                                       (car (cdr items))))))))))))))
