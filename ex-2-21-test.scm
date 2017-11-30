;; 問題2.21のテスト

(use gauche.test)
(test-start "問題2.21")

(load "./ex-2-21.scm")

(test "空リスト（map不使用）"
      (list)
      (lambda () (square-list (list))))

(test "(1 2 3 4)（map不使用）"
      (list 1 4 9 16)
      (lambda () (square-list (list 1 2 3 4))))

(test "(1 3 5 7)（map不使用）"
      (list 1 9 25 49)
      (lambda () (square-list (list 1 3 5 7))))

(test "空リスト（map使用）"
      (list)
      (lambda () (square-list-map (list))))

(test "(1 2 3 4)（map使用）"
      (list 1 4 9 16)
      (lambda () (square-list-map (list 1 2 3 4))))

(test "(1 3 5 7)（map使用）"
      (list 1 9 25 49)
      (lambda () (square-list-map (list 1 3 5 7))))

(test-end :exit-on-failure #t)
