;;; 問題2.27 deep-reverse: 部分木まで逆順にする

(define nil (list))

;; 再帰プロセス版
(define (deep-reverse items)
  (if (null? items)
    nil
    (append (deep-reverse (cdr items))
            (let ((head (car items)))
              (list (if (list? head)
                      (deep-reverse head)
                      head))))))

;; 反復プロセス版
(define (deep-reverse-rec items)
  (define (iter ls acc)
    (if (null? ls)
      acc
      (iter (cdr ls)
            (cons (let ((head (car ls)))
                    (if (list? head)
                      (iter head nil)
                      head))
                  acc))))
  (iter items nil))
