;; 問題2.20のテスト

(use gauche.test)
(test-start "問題2.20")

(load "./ex-2-20.scm")

(test "奇数の場合"
      (list 1 3 5 7)
      (lambda () (same-parity 1 2 3 4 5 6 7)))

(test "偶数の場合"
      (list 2 4 6)
      (lambda () (same-parity 2 3 4 5 6 7)))

(test-end :exit-on-failure #t)
