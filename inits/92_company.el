(global-company-mode) ;; 全ての場合でcompany-mode適用
;; or (add-hook 'python-mode-hook 'company-mode) など

;; 任意のモードでcomanyを無効にする。モード名は "M-: major-mode" で得られる。
(setq company-global-modes '(not org-mode))
(setq company-global-modes '(not magit-status-mode))
(setq company-global-modes '(not shell-mode))

;;(setq company-idle-delay 0.2) ; デフォルトは0.5
;;(setq company-minimum-prefix-length 3) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
