;; init.el
;;
;; ;; emacs起動中に変更内容を適用したいとき ;;;;;;;;
;; M-x eval-current-buffer

;; MacOS or Linux
(when (equal system-type 'darwin)
  (require 'cask))
(when (equal system-type 'gnu/linux)
  (require 'cask "~/.cask/cask.el"))
(cask-initialize)

;; パッケージの分割
(package-initialize)
(init-loader-load)


;; (set-language-environment "Japanese")
;; (prefer-coding-system 'utf-8)

;; ;; turn on font-lock mode
;; (when (fboundp 'global-font-lock-mode)
;;   (global-font-lock-mode t))

;; ;; auto-complete mode
;; ;; http://cx4a.org/software/auto-complete/manual.ja.html
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
;; (ac-config-default)


;; (require 'multiple-cursors)
;; ;; When you have an active region that spans multiple lines, the following will
;; ;; add a cursor to each line:

;;     (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; ;; When you want to add multiple cursors not based on continuous lines, but based on
;; ;; keywords in the buffer, use:

;;     (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;     (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;     (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ;; First mark the word, then add more cursors.
;; ;; 
;; ;; To get out of multiple-cursors-mode, press `<return>` or `C-g`. The latter will
;; ;; first disable multiple regions before disabling multiple cursors. If you want to
;; ;; insert a newline in multiple-cursors-mode, use `C-j`.

;; ;; |-----------|-------------------|--
;; ;; |M-.        |find-tag           |入力した名前の関数にジャンプ
;; ;; |M-*        |pop-tag-mark       |ジャンプしたあと元に戻る
;; ;; |C-u M-.    |find-tag           |find-tagしたあとに使うと、次の同名関数にジャンプ
;; ;; |C-M-.      |find-tag-regexp    |正規表現で関数を探してジャンプ
;; ;; |C-x 4 .    |find-tag-other-window  |入力した名前の関数のところに別Windowでジャンプ
;; ;; |C-x 5 .    |find-tag-other-frame   |入力した名前の関数のところに別frameでジャンプ
;; ;; |-----------|
;; ;; |           |tags-search        |指定した関数などの文字列を検索します。M-,で次を検索します。
;; ;; |           |tags-query-replace |置換を行います。中断した場合でもM-,で再開できます。
;; ;; |M-,        |tags-loop-continue |上記の検索、置換を再開、続行します。
;; ;; |-----------|
;; ;; |           |tags-reset-tags-tables |タグテーブルをリセットします。次回タグ検索するとき、改めてTAGSファイルの指定が求められます。

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
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (yasnippet yaml-mode web-mode use-package smex smartparens recentf-ext projectile prodigy popwin pallet nyan-mode multiple-cursors multi-term markdown-mode magit-gerrit init-loader idle-highlight-mode htmlize flycheck-cask expand-region exec-path-from-shell drag-stuff color-theme-solarized)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
