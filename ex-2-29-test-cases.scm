;;; 問題2.29のテストケース集

(define b-1 (make-branch 1 1))           ;; トルク = 1 * 1 =  1
(define b-2 (make-branch 2 3))           ;; トルク = 2 * 3 =  6
(define b-3 (make-branch 3 4))           ;; トルク = 3 * 4 = 12
(define b-4 (make-branch 4 5))           ;; トルク = 4 * 5 = 20
(define b-5 (make-branch 3 2))           ;; トルク = 3 * 2 =  6
(define b-6 (make-branch 4 3))           ;; トルク = 4 * 3 = 12
(define b-7 (make-branch 2 2))           ;; トルク = 2 * 2 =  4
(define m-12 (make-mobile b-1 b-2))      ;; 全重量 = 1 + 3 =  4
(define m-23 (make-mobile b-2 b-3))      ;; 全重量 = 3 + 4 =  7
(define m-34 (make-mobile b-3 b-4))      ;; 全重量 = 4 + 5 =  9
(define m-25 (make-mobile b-2 b-5))      ;; 全重量 = 3 + 2 =  5
(define m-52 (make-mobile b-5 b-2))      ;; 全重量 = 3 + 2 =  5
(define m-27 (make-mobile b-2 b-7))      ;; 全重量 = 3 + 2 =  5
(define b-12 (make-branch 5 m-12))       ;; トルク = 5 * 4 = 20
(define b-23 (make-branch 6 m-23))       ;; トルク = 6 * 7 = 42
(define b-34 (make-branch 7 m-34))       ;; トルク = 7 * 9 = 63
(define b-25 (make-branch 1 m-25))       ;; トルク = 1 * 5 =  5
(define b-52 (make-branch 1 m-52))       ;; トルク = 1 * 5 =  5
(define b-27 (make-branch 1 m-27))       ;; トルク = 1 * 5 =  5

(define m-12-34 (make-mobile b-12 b-34)) ;; 全重量 = 4 + 9 = 13
(define m-1-23 (make-mobile b-1 b-23))   ;; 全重量 = 1 + 7 =  8
(define m-25-52 (make-mobile b-25 b-52)) ;; 全重量 = 5 + 5 = 10
(define m-27-52 (make-mobile b-27 b-52)) ;; 全重量 = 5 + 5 = 10、釣り合っていない

(test-section "a")

(test "left-branch (m-12)"
      b-1
      (lambda () (left-branch m-12)))

(test "left-branch (m-12-34)"
      b-12
      (lambda () (left-branch m-12-34)))

(test "left-branch (m-1-23)"
      b-1
      (lambda () (left-branch m-1-23)))

(test "right-branch (m-12)"
      b-2
      (lambda () (right-branch m-12)))

(test "right-branch (m-12-34)"
      b-34
      (lambda () (right-branch m-12-34)))

(test "right-branch (m-1-23)"
      b-23
      (lambda () (right-branch m-1-23)))

(test "branch-length (b-2)"
      2
      (lambda () (branch-length b-2)))

(test "branch-length (b-3)"
      3
      (lambda () (branch-length b-3)))

(test "branch-structure (b-2)"
      3
      (lambda () (branch-structure b-2)))

(test "branch-structure (b-12)"
      m-12
      (lambda () (branch-structure b-12)))

(test-section "b")

(test "hangs-mobile? (b-1)"
      #f
      (lambda () (hangs-mobile? b-1)))

(test "hangs-mobile? (b-12)"
      #t
      (lambda () (hangs-mobile? b-12)))

(test "total-weight (m-12)"
      4
      (lambda () (total-weight m-12)))

(test "total-weight (m-12-34)"
      13
      (lambda () (total-weight m-12-34)))

(test "total-weight (m-1-23)"
      8
      (lambda () (total-weight m-1-23)))

(test-section "c")

(test "branch-torque (b-2)"
      6
      (lambda () (branch-torque b-2)))

(test "branch-torque (b-5)"
      6
      (lambda () (branch-torque b-5)))

(test "branch-torque (b-7)"
      4
      (lambda () (branch-torque b-7)))

(test "branch-balanced-structure? (b-25)"
      #t
      (lambda () (branch-balanced-structure? b-25)))

(test "branch-balanced-structure? (b-27)"
      #f
      (lambda () (branch-balanced-structure? b-27)))

(test "balanced? (m-25-52)"
      #t
      (lambda () (balanced? m-25-52)))

(test "balanced? (m-27-52)"
      #f
      (lambda () (balanced? m-27-52)))

(test-end :exit-on-failure #t)
