(global-company-mode)
;; or (add-hook 'python-mode-hook 'company-mode) など
(setq company-idle-delay 0.2) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
