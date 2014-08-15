(define (double f)
  (lambda (x) (f (f x))))

;; (((double (double double)) inc) 5) が返す値は何か。
;;
;; 置換モデル
;; (((double (double double)) inc) 5)
;; 最も中を置換
;; (((double (lambda (x) (double (double x))))
;;   inc) 5)
;; 一つ外を置換（分かりやすくするため、引数を y に）
;; (((lambda (y) ((lambda (x) (double (double x)))
;;                ((lambda (x) (double (double x)))
;;                 y)))
;;   inc) 5)
;; 簡約
;; (((lambda (y) ((lambda (x) (double (double x)))
;;                (double (double y))))
;;   inc) 5)
;; 簡約
;; (((lambda (y) (double (double (double (double y)))))
;;   inc) 5)
;; 簡約
;; ((double (double (double (double inc)))) 5)
;; 2^4 = 16 回 inc されるので 5 + 16 = 21
