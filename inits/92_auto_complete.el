;; Auto Complete
(use-package auto-complete)
(use-package auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
;; (setq ac-use-fuzzy t)          ;; 曖昧マッチ(fuzzy.el必要)
(global-auto-complete-mode t)

;; auto-completeをerlang-modeで有効にさせる
(add-to-list 'ac-modes 'erlang-mode)
