;; 問題2.21のテスト

(use gauche.test)
(test-start "問題2.25")

(load "./ex-2-25.scm")

(test "(1 3 (5 7) 9)"
      7
      (lambda () (take-7-1)))

(test "((7))"
      7
      (lambda () (take-7-2)))

(test "(1 (2 (3 (4 (5 (6 7))))))"
      7
      (lambda () (take-7-3)))

(test-end :exit-on-failure #t)
