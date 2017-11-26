;;; 問題2.19のテスト

(use gauche.test)
(test-start "問題2.19")

(load "./ex-2-19.scm")

(test-section "first-denomination")

(test "us-coinsの最初の硬貨単位"
      50
      (lambda () (first-denomination us-coins)))
(test "uk-coinsの最初の硬貨単位"
      100
      (lambda () (first-denomination uk-coins)))

(test-section "except-first-denomination")

(test "us-coinsの残りの硬貨単位のリスト"
      (list 25 10 5 1)
      (lambda () (except-first-denomination us-coins)))
(test "uk-coinsの残りの硬貨単位のリスト"
      (list 50 20 10 5 2 1 0.5)
      (lambda () (except-first-denomination uk-coins)))

(test-section "no-more?")

(test "us-coins"
      #f
      (lambda () (no-more? us-coins)))
(test "uk-coins"
      #f
      (lambda () (no-more? uk-coins)))
(test "空リスト"
      #t
      (lambda () (no-more? (list))))

(test-section "cc")

(test "米国の硬貨で100セントを両替する場合の数"
      292
      (lambda () (cc 100 us-coins)))
(test "米国の硬貨で11セントを両替する場合の数（問題1.14）"
      4
      (lambda () (cc 11 us-coins)))

(test-end :exit-on-failure #t)
