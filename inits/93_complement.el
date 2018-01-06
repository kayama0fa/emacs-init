(use-package anything-startup)

;; 履歴buffer表示時のショートカット @ ?(ショートカットしたい対象のアルファベット)
(setq anything-enable-shortcuts 'prefix-key)
(define-key anything-map (kbd "@") 'anything-select-with-prefix-shortcut)

(global-set-key (kbd "C-x b") 'anything-mini)
(anything-completion-mode t)
