;; rst.elを読み込み
(require 'rst)
;; *.rst, *.restファイルをrst-modeでOpen
;; (setq auto-mode-alist
;;       (append (list
;;                '("\\.rst$" . rst-mode)
;;                '("\\.rest$" . rst-mode)
;;                auto-mode-alist)))
;; 全部スペースでインデントしましょう
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))