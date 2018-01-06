;; 全部スペースでインデントしましょう
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))

(add-to-list 'auto-mode-alist '("\\.rst\\'" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.rest\\'" . rst-mode))
