;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(setq cperl-indent-level 4)

;; Use 4 space indents via cperl mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-close-paren-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4 t)
 '(cperl-indent-parens-as-block t)
 '(cperl-tab-always-indent t)
 '(minimap-window-location (quote right))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
)

(add-to-list 'auto-mode-alist '("\\.pl\\'"    . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.cgi\\'"   . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm\\'"    . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"     . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pl.in\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm.in\\'" . cperl-mode))

;; (defun perltidy-region ()               ;選択regionをperltidy
;;    "Run perltidy on the current region."
;;    (interactive)
;;    (save-excursion
;;      (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
;; (defun perltidy-defun ()                ;開いているソースをperltidy
;;   "Run perltidy on the current defun."
;;   (interactive)
;;   (save-excursion (mark-defun)
;;                   (perltidy-region)))
