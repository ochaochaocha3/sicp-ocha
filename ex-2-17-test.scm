;; 問題2.17のテスト

(use gauche.test)
(test-start "問題2.17")

(load "./ex-2-17.scm")

(test "要素数1の場合"
      (list 1)
      (lambda () (my-last-pair (list 1))))

(test "問題文の例"
      (list 34)
      (lambda () (my-last-pair (list 23 72 149 34))))

(test-end :exit-on-failure #t)
