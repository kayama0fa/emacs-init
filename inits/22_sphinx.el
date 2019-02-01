;; 参考:
;;   * http://docutils.sourceforge.net/docs/user/emacs.html

;; 全部半角スペースでインデント
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))

(add-to-list 'auto-mode-alist '("\\.rst\\'" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.rest\\'" . rst-mode))

;; Section titleの長さと"=,-,^"等を合わせる。
;; rst-adjust (C-c C-a C-a)
;;
;; 参考: http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#sections
;; * # with overline, for parts
;; * * with overline, for chapters
;; * =, for sections
;; * -, for subsections
;; * ^, for subsubsections
;; * ", for paragraphs
(custom-set-variables '(rst-preferred-adornments
                        `( (?= simple 0)
                           (?- simple 0)
                           (?^ simple 0)
                           (?\" simple 0)
                          )))
