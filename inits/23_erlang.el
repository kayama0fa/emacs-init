;; ;; erlangのインデントモード設定
;; (setq erlang-indent-level 4) ;; 単位はspace(4なら4spece分のインデント)
;; (setq erlang-indent-line  4)
;; (setq erlang-indent-guard 4)

(add-to-list 'auto-mode-alist '("\\.erl\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.erl.in\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl.in\\'" . erlang-mode))
