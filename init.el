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


;; ;; Insert spaces instead of tabs
;; (setq-default indent-tabs-mode nil)
;; (setq-default show-training-whitespace t)

;; ;; Set line width to 78 columns
;; (setq fill-column 79)
;; (setq auto-fill-mode t)


;; ;; 何ができるのか?
;; ;;
;; ;; show-paren は対応する括弧をハイライトすることができますが， 
;; ;; mic-paren ならその間の文字を強調して表示することができます．
;; (progn
;;   (require 'mic-paren)
;;   (paren-activate)                      ; activating
;;   ;; boldはカッコ内をボールド表示 regionはカッコ内をリージョンカラーで表示
;; ;;   (setq paren-match-face 'bold)
;;   (setq paren-match-face 'region)
;;   (setq paren-sexp-mode t)
;;   )
;; ;; M-! のコマンドを補完することができる
;; (require 'shell-command)
;; (shell-command-completion-mode)
;; ;; shell上でカラーを正常に表示させるために必要
;; ;; http://wiki.livedoor.jp/eruvasu/d/emacs-shell-mode
;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" "Set `ansi-color-for-comint-mode' to t." t)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ;; ;;;====================================
;; ;; ;;;  Buffer 設定
;; ;; ;;;===================================
;; ;; ;;; <<2013/04/22>> anything.elとかぶるので、コメントアウト
;; ;; ;;; iswitchb は、バッファ名の一部の文字を入力することで、
;; ;; ;;; 選択バッファの絞り込みを行う機能を実現します。
;; ;; ;;; バッファ名を先頭から入力する必要はなく、とても使いやすくなります。
;; ;; (iswitchb-mode 1) ;;iswitchbモードON
;; ;; ;;; C-f, C-b, C-n, C-p で候補を切り替えることができるように。
;; ;; (add-hook 'iswitchb-define-mode-map-hook
;; ;;       (lambda ()
;; ;;         (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
;; ;;         (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
;; ;;         (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
;; ;;         (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))
;; ;; ;;; iswitchb で選択中の内容を表示
;; ;; (defadvice iswitchb-exhibit
;; ;;   (after iswitchb-exhibit-with-display-buffer activate)
;; ;;   "選択している buffer を window に表示してみる。"
;; ;;   (when (and (eq iswitchb-method iswitchb-default-method)
;; ;;              iswitchb-matches)
;; ;;     (select-window (get-buffer-window (cadr (buffer-list))))
;; ;;     (let ((iswitchb-method 'samewindow))
;; ;;       (iswitchb-visit-buffer (get-buffer (car iswitchb-matches))))
;; ;;     (select-window (minibuffer-window))))

;; ;;====================================
;; ;;全角スペースとかに色を付ける
;; ;;何色が表示できるか確認するには、M-x list-color-disply
;; ;;====================================
;; (defface my-face-b-1 '((t (:background "color-228"))) nil)
;; (defface my-face-b-2 '((t (:background "color-229"))) nil)
;; (defface my-face-u-1 '((t (:foreground "brightwhite" :underline t))) nil)
;; (defvar my-face-b-1 'my-face-b-1)
;; (defvar my-face-b-2 'my-face-b-2)
;; (defvar my-face-u-1 'my-face-u-1)
;; (defadvice font-lock-mode (before my-font-lock-mode ())
;;             (font-lock-add-keywords
;;                  major-mode
;;                     '(
;;                            ("　" 0 my-face-b-1 append)
;;                            ("\t" 0 my-face-b-2 append)
;;                            ("[ ]+$" 0 my-face-u-1 append)
;;           )))
;; (ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
;; (ad-activate 'font-lock-mode)
;; (add-hook 'find-file-hooks '(lambda ()
;;                               (if font-lock-mode nil
;;                                 (font-lock-mode t))))



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


;; ;; php-mode
;; (require 'php-mode)
;; (setq php-mode-force-pear t) ;PEAR規約のインデント設定にする

;; ;;tramp
;; ;; C+x f /ssh:user@host:/path/to/file
;; (require 'tramp)
;; (setq tramp-default-method "ssh")
;; ;; TRAMPリモート接続時のPATH設定を改善させる
;; ;; (例:リモートでのhg(version control)作業)
;; ;; リモートのバッファ上でM-Shift-! echo PATHをしてみるとよく分かる。
;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)


;; ;; 補完に大文字小文字の区別をしない(でも、うまく動かない)
;; (setq completion-ignore-case t)


;; ;; ;; ruby-mode
;; ;; (autoload 'ruby-mode "ruby-mode" " for editing ruby source files" t)
;; ;; (setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
;; ;; (setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
;; ;; (autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
;; ;; (autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
;; ;; (add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; ;; auto-install.el
;; (require 'auto-install)
;; ;; auto installによりインストールされる先
;; (setq auto-install-directory "~/.emacs.d/auto-install/")
;; ;; ;; 起動時にEmacsWikiのページ名を補完候補に加える
;; ;; (auto-install-update-emacswiki-package-name t)
;; ;; install-elisp.el互換モードにする
;; (auto-install-compatibility-setup)
;; ;; ediff関連のバッファを1つのフレームにまとめる
;; (setq ediff-windows-setup-function 'ediff-setup-windows-plain)

;; (add-to-list 'load-path "~/.emacs.d/auto-install")
;; (require 'anything-startup)


;; ;; (setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.15/emacs"
;; ;;       load-path))
;; (setq erlang-root-dir "/usr/local/erlang")
;; (setq exec-path (cons "/usr/local/erlang/bin" exec-path))
;; (require 'erlang-start)

;; ;; auto-completeをerlang-modeで有効にさせる
;; (add-to-list 'ac-modes 'erlang-mode)
;; ;; erlangのインデントモード設定
;; (setq erlang-indent-level 4) ;; 単位はspace(4なら4spece分のインデント)
;; (setq erlang-indent-line  4)
;; (setq erlang-indent-guard 4)

;; ;; bookmark
;; ;; C-x r m : ブックマークを設定する   : bookmark-set
;; ;; C-x r l : ブックマークリスト表示   : bookmark-bmenu-list
;; ;; ブックマークを変更したら即保存する
;; (setq bookmark-save-flag 1)
;; ;; anythingでおなじみの絞り込みできるブックマーク機能
;; (global-set-key "\C-xrl" 'anything-bookmarks)
;; ;; 超整理法(使った物が上に)
;; (progn
;;   (setq bookmark-sort-flag nil)
;;   (defun bookmark-arrange-latest-top ()
;;     (let ((latest (bookmark-get-bookmark bookmark)))
;;       (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
;;     (bookmark-save))
;;   (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;; ;; (add-to-list 'load-path "~/.emacs.d/yasnippet")
;; ;; (require 'yasnippet)
;; ;; (yas-global-mode 1)

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

;; ;; ruby-modeでキーがバッティングしている？
;; ;; 2014-05-19 : 使いたいから、ruby-modeをコメントアウト
;; ;; 2014-05-20 : C-M-fが頻繁に使うバインドなので、C-M-?をC-S-?にしてみる。>上手くいかない
;; ;; カーソルキーを使う案もあるが、頻繁に使うので、ホームポジションを崩すキーを使いたくない。
;; ;; 2014-05-21 : vim型の配列では、C-M-lがshell上のキーバインドとかぶる。


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


;; ;; TAGファイルの生成は、
;; ;; "ctags -eR"で行う。


;; ;; regionで囲んだ範囲内の行数、文字数を表示する
;; (defun count-lines-and-chars ()
;;   (if mark-active
;;       (format "%d lines,%d chars "
;;               (count-lines (region-beginning) (region-end))
;;               (- (region-end) (region-beginning)))
;;     ;;(count-lines-region (region-beginning) (region-end)) ;; これだとエコーエリアがチラつく
;;     ""))

;; (add-to-list 'default-mode-line-format
;;                           '(:eval (count-lines-and-chars)))


;; (put 'set-goal-column 'disabled nil)

;; ;; ;; http://d.hatena.ne.jp/higepon/20060107/1136628498
;; ;; ;; gtags使えないか確認
;; ;; (autoload 'gtags-mode "gtags" "" t)
;; ;; (setq gtags-mode-hook
;; ;;       '(lambda ()
;; ;;          (local-set-key "\M-t" 'gtags-find-tag)
;; ;;          (local-set-key "\M-r" 'gtags-find-rtag)
;; ;;          (local-set-key "\M-s" 'gtags-find-symbol)
;; ;;          (local-set-key "\C-t" 'gtags-pop-stack)
;; ;;          ))
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
