;;; 問題2.19 両替の計算のリスト版

;; 米国の硬貨単位のリスト
(define us-coins (list 50 25 10 5 1))
;; 英国の硬貨単位のリスト
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

;; 両替の場合の数を返す
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

;; 最初の硬貨単位を返す
(define first-denomination car)

;; 最初のものを除いた硬貨単位のリストを返す
(define except-first-denomination cdr)

;; 硬貨単位の候補が他にないかを返す
(define no-more? null?)
