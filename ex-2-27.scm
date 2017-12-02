;;; 問題2.27 deep-reverse: 部分木まで逆順にする

(define nil (list))

;; 再帰プロセス版
(define (deep-reverse items)
  (if (null? items)
    nil
    (append (deep-reverse (cdr items))
            (list (if (list? (car items))
                    (deep-reverse (car items))
                    (car items))))))

;; 反復プロセス版
(define (deep-reverse-rec items)
  (define (iter ls acc)
    (if (null? ls)
      acc
      (iter (cdr ls)
            (cons (if (list? (car ls))
                    (iter (car ls) nil)
                    (car ls))
                  acc))))
  (iter items nil))
