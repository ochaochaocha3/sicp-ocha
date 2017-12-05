;;; 問題2.29 d. 二進モービルをconsで

;; 二進モービルの構築子
(define (make-mobile left right)
  (cons left right))

;; 枝の構築子
(define (make-branch length structure)
  (cons length structure))

;;; a

;; モービルの左の枝を返す
(define (left-branch mobile)
  (car mobile))

;; モービルの右の枝を返す
(define (right-branch mobile)
  (cdr mobile))

;; 枝の長さを返す
(define (branch-length branch)
  (car branch))

;; 枝の構造を返す
(define (branch-structure branch)
  (cdr branch))

;;; b

;; 枝がモービルをぶら下げているかを返す
(define (hangs-mobile? branch)
  (pair? (branch-structure branch)))

;; 枝にぶら下げているものの重量を返す
(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (hangs-mobile? branch)
      (total-weight structure)
      structure)))

;; モービルの全重量を返す
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;;; c

;; 枝の回転力を返す
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

;; 枝にぶら下がっているものが釣り合っているかを返す
;; 便宜上、錘は釣り合っているとする
(define (branch-balanced-structure? branch)
  (if (hangs-mobile? branch)
    (balanced? (branch-structure branch))
    #t))

;; モービルが釣り合っているかを返す
(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (branch-torque left) (branch-torque right))
         (branch-balanced-structure? left)
         (branch-balanced-structure? right))))
