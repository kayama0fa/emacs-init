;; .emacs
;;
;; ;; emacs起動中に変更内容を適用したいとき ;;;;;;;;
;; M-x eval-current-buffer
;;
;; TODO
;; * emacsの設定整理
;;     * caskの導入
;;     * 設定ファイルの分割
;;     * GitHubに登録、管理
;;     * .emacsを.emacs.d/init.elに移動
;;     * .emacs持って帰って、うちで作業かなぁ
;;     * GitHubの使い方忘れたので、それの再勉強
;; 
;; ```
;; ~/.emacs.d/
;;     init.el         --- 親となる設定ファイル
;;     inits/          --- 分割した設定ファイルの入れ場所
;;     Cask            --- cask定義ファイル
;;     .cask/          --- caskロードファイル
;; ```
;; 上記のファイルのうち、 init.el, inits/, Caskがバージョン管理対象
;;
;; GitHub.com 管理にする: `./emcas-init` 
;; 


;;;;; For emacs 24.3 -> 24.5 upgrade problem.
;; melpa関連。関数名非互換 : package-desc-vers -> package–ac-desc-version
(fset 'package-desc-vers 'package--ac-desc-version)

;; MELPA
;; Emacs Lisp を簡単にinstallするための package.el & MELPA
;; http://qiita.com/ongaeshi/items/e81fca7a9797fe203e9f
;;
;; M-x package-list-packages で一覧取得
(require 'package) ;; You might already have this line
;; (add-to-list 'package-archives
;;              '(("melpa" . "https://melpa.org/packages/")
;;                ("marmalade" . "http://marmalade-repo.org/packages/")
;;                ("org" . "http://orgmode.org/elpa/")
;;                ))
;; MELPAを追加
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; Orgを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
  )
(package-initialize) ;; You might already have this line:

; melpa.el
(require 'melpa)



(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; キーバインド
(define-key global-map "\C-h" 'delete-backward-char) ; 削除
;;(define-key global-map "\M-?" 'help-for-help)        ; ヘルプ
;;(define-key global-map "\C-z" 'undo)                 ; undo(C-/)
;;(define-key global-map "\C-ci" 'indent-region)       ; インデント
(define-key global-map "\C-c;" 'comment-region)      ; コメントアウト
(define-key global-map "\C-c:" 'uncomment-region)    ; コメント解除
(define-key global-map "\C-\\" nil) ; \C-\の日本語入力の設定を無効にする
;;(define-key global-map "\C-c " 'other-frame)         ; フレーム移動
;;(global-set-key "\M-g" 'goto-line)                   ; 指定行へ移動(M-g g)
;; ほか次のコマンドも M-g n=next-error, M-g p=prev-error
(define-key global-map "\C-cc" `compile)
(global-set-key "\C-x\C-a" 'add-change-log-entry)     ; Change-Logを作成する
;; (define-key global-map "\C-x\C-c" nil) ; ショートカットによる修正を無効化
(global-set-key "\C-cg" 'imenu)	;; C-c gで開いているコードの関数一覧を表示する

;; elispファイルパス
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

;; 2012/08/24 mercurial用の設定
;; http://www.lares.dti.ne.jp/~foozy/fujiguruma/scm/mercurial-emacs.html
(load-library "mercurial")

;; disable beep, screen flush.
;; http://randd.kwappa.net/2011/03/10/258
(setq ring-bell-function 'ignore)

;; (Require 'install-elisp)
;; (setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;; auto-complete mode
;; http://cx4a.org/software/auto-complete/manual.ja.html
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)


;; デフォルトのインデントレベルの指定
(setq-default indent-level 4)
;; デフォルトのタブ幅の指定
;;(setq-default tab-width 4)
(setq-default tab-width 4)
;; インデントはタブではなくスペース
(setq-default indent-tabs-mode nil)

;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(setq cperl-indent-level 4)
;; (setq font-lock-maximum-decoration nil)	;; 早くcperl-modeの解析を終わらせる（？）

;; ;;------------------------------------------------------------------------
;; ;;
;; ;; add 2013/06/13
;; ;; Perl Best Practice.
;; ;; http://d.hatena.ne.jp/stereocat/20081103/1225682364
;; ;;
;; turn autoindenting on
;; globalに有効だと、普通のテキストバッファに貼り付けしても、無用なインデントが付く。
;; (global-set-key "\r" 'newline-and-indent)
;; (add-hook 'cperl-mode-hook
;;           '(lambda()
;;              (define-key cperl-mode-map "\r" 'newline-and-indent)
;;              ))


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
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

;; Insert spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default show-training-whitespace t)

;; Set line width to 78 columns
(setq fill-column 79)
(setq auto-fill-mode t)

;; ;;------------------------------------------------------------------------



;;; カーソルの位置が何文字目か、何行目かを表示する
(column-number-mode t)
(line-number-mode t)
;;; カーソルのある行をハイライト表示する。
;;; http://www.happytrap.jp/blogs/2011/08/29/5877/
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     ;; (:background "#CC0066")
     ;; (:background "#F0D0E4") ;; ピンク寄りの薄紫
     (:background "#D1F1CC") ;; 薄緑
     )
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; 長い1行を折り返す
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)
;; リージョンの色
;; (set-face-background 'region "light steel blue")
(set-face-foreground 'region "black")
(set-face-foreground 'region "brightblue")
;; リージョンに色が付く設定
(setq transient-mark-mode t)
;; 何が問題なのか?
;;    Meadow で同一の名前を持つファイルを複数開くと, バッファの名前には<2><3>...
;;    と番号が振られます. しかし, これではどれがどれだかさっぱり分かりません．
;; 何ができるのか?
;;    バッファ名を <2><3>... ではなく, ディレクトリ名で表示してくれる．
;;    例えば, C:/Meadow/.emacs.el, C:/tmp/.emacs.el を開いたとすると,
;;    それぞれ .emacs<Meadow>, .emacs<tmp>となりますので，どのファイルが
;;    どういうファイルかが分かりやすくなります．
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


;; 何ができるのか?
;;
;; show-paren は対応する括弧をハイライトすることができますが， 
;; mic-paren ならその間の文字を強調して表示することができます．
(progn
  (require 'mic-paren)
  (paren-activate)                      ; activating
  ;; boldはカッコ内をボールド表示 regionはカッコ内をリージョンカラーで表示
;;   (setq paren-match-face 'bold)
  (setq paren-match-face 'region)
  (setq paren-sexp-mode t)
  )
;; M-! のコマンドを補完することができる
(require 'shell-command)
(shell-command-completion-mode)
;; shell上でカラーを正常に表示させるために必要
;; http://wiki.livedoor.jp/eruvasu/d/emacs-shell-mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; (名前の通り)
(require 'yaml-mode)

(setq auto-mode-alist
      (append (list
                '("\\.html$"  . html-mode)
                '("\\.htm$"   . html-mode)
                '("\.el$"     . emacs-lisp-mode)
                '("\.emacs$"  . emacs-lisp-mode)
                '("\\.pl$"    . cperl-mode)
                '("\\.cgi$"   . cperl-mode)
                '("\\.pm$"    . cperl-mode)
                '("\\.pl.in$" . cperl-mode)
                '("\\.cgi.in$" . cperl-mode)
                '("\\.pm.in$" . cperl-mode)
                '("\\.t$"     . cperl-mode)
                '("\\.tex$"   . yatex-mode)
                '("\\.sh$"    . shell-script-mode)
                '("\\.sql$"   . sql-mode)
                '("\\.txt$"   . text-mode)
                '("\\.diff$"  . diff-mode)
                '("\\.patch$" . diff-mode)
                '("\\.cpp$"   . c++-mode)
                '("\\.h$"     . c++-mode)
                '("\\.C$"     . c++-mode)
                '("\\.cc$"    . c++-mode)
                '("\\.hh$"    . c++-mode)
                '("\\.c$"     . c-mode)
                '("[Mm]akefile$" . makefile-mode)
                '("Makefile.am$" . makefile-mode)
                '("Makefile.in$" . makefile-mode)
                '("\\.php$"   . php-mode)
                ;; '("\\.tcl$"   . tcl-mode)
                '("\\.erl$"      . erlang-mode)
                '("\\.erl.in$"   . erlang-mode)
                '("\\.erl.orig$" . erlang-mode)
                '("\\.hrl$"      . erlang-mode)
                '("\\.hrl.in$"   . erlang-mode)
                '("\\.hrl.orig$" . erlang-mode)
                ;; '("\\.js$"   . javascript-mode)
                '("\\.js$"   . js2-mode)
                '("\\.json$" . javascript-mode)
                '("\\.xml$"   . nxml-mode)
                '("\\.conf$"   . conf-space-mode)
                '("\\.vhost$"   . conf-space-mode)
                ;; Markdown
                '("\\.md$"   . markdown-mode)
                '("\\.py$"    . python-mode)
                '("\\.py.in$" . python-mode)
                '("\\.yml$" . yaml-mode)
                auto-mode-alist)
              )
      )
;; ;;;====================================
;; ;;;  Buffer 設定
;; ;;;===================================
;; ;;; <<2013/04/22>> anything.elとかぶるので、コメントアウト
;; ;;; iswitchb は、バッファ名の一部の文字を入力することで、
;; ;;; 選択バッファの絞り込みを行う機能を実現します。
;; ;;; バッファ名を先頭から入力する必要はなく、とても使いやすくなります。
;; (iswitchb-mode 1) ;;iswitchbモードON
;; ;;; C-f, C-b, C-n, C-p で候補を切り替えることができるように。
;; (add-hook 'iswitchb-define-mode-map-hook
;;       (lambda ()
;;         (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
;;         (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
;;         (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
;;         (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))
;; ;;; iswitchb で選択中の内容を表示
;; (defadvice iswitchb-exhibit
;;   (after iswitchb-exhibit-with-display-buffer activate)
;;   "選択している buffer を window に表示してみる。"
;;   (when (and (eq iswitchb-method iswitchb-default-method)
;;              iswitchb-matches)
;;     (select-window (get-buffer-window (cadr (buffer-list))))
;;     (let ((iswitchb-method 'samewindow))
;;       (iswitchb-visit-buffer (get-buffer (car iswitchb-matches))))
;;     (select-window (minibuffer-window))))

;;====================================
;;全角スペースとかに色を付ける
;;何色が表示できるか確認するには、M-x list-color-disply
;;====================================
(defface my-face-b-1 '((t (:background "color-228"))) nil)
(defface my-face-b-2 '((t (:background "color-229"))) nil)
(defface my-face-u-1 '((t (:foreground "brightwhite" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
            (font-lock-add-keywords
                 major-mode
                    '(
                           ("　" 0 my-face-b-1 append)
                           ("\t" 0 my-face-b-2 append)
                           ("[ ]+$" 0 my-face-u-1 append)
          )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode nil
                                (font-lock-mode t))))



(defun perltidy-region ()               ;選択regionをperltidy
   "Run perltidy on the current region."
   (interactive)
   (save-excursion
     (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()                ;開いているソースをperltidy
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))


;; http://d.hatena.ne.jp/kitokitoki/20100516/p1
;; [emacs] diff-mode の紹介
;; まずは色を変更します。色の名前は，各自の環境で利用できるものを指定して下さい。
(add-hook 'diff-mode-hook
          (lambda ()
            (set-face-foreground 'diff-context-face "grey50")
            (set-face-background 'diff-header-face "DarkOliveGreen1")
;;             (set-face-underline-p 'diff-header-face t)
            (set-face-foreground 'diff-file-header-face "MediumSeaGreen")
            (set-face-background 'diff-file-header-face "DarkOliveGreen1")
            (set-face-foreground 'diff-index-face "MediumSeaGreen")
            (set-face-background 'diff-index-face "DarkOliveGreen1")
            (set-face-foreground 'diff-hunk-header-face "medium orchid")
            (set-face-background 'diff-hunk-header-face"plum")
            (set-face-foreground 'diff-removed-face "deep pink")
            (set-face-background 'diff-removed-face "plum")
            (set-face-foreground 'diff-added-face "black")
            (set-face-background 'diff-added-face "DarkOliveGreen1")
            (set-face-foreground 'diff-changed-face "DeepSkyBlue4")
            (set-face-background 'diff-changed-face "khaki1")
            (set-face-background 'diff-refine-change "sandy brown")
            )
          )

;; 次に利用するコマンドにキーを割り当て直します。
;; 用意されたコマンド
;; M-n : 次のハンクに移動 (diff-hunk-next)
;; M-p : 前のハンクに移動 (diff-hunk-prev)
;; M-} : 次のファイル差分に移動(複数ファイル差分があるなら) (diff-file-next)
;; M-{ : 前のファイル差分に移動(複数ファイル差分があるなら) (diff-file-prev)
;; M-k : カーソル位置のハンクを削除 (diff-hunk-kill)
;; M-K : カーソル位置のファイルのハンクをすべて削除 (diff-file-kill)
;;

;; (add-hook 'diff-mode-hook
;;   (lambda()
;;     (define-key diff-mode-map (kbd "C-M-n") 'diff-file-next) ;次の差分へ
;;     (define-key diff-mode-map (kbd "C-M-p") 'diff-file-prev) ;前の差分へ
;;     (define-key diff-mode-map (kbd "M-k") 'diff-hunk-kill)	 ;差分ハンクの削除
;;     (define-key diff-mode-map (kbd "C-M-k") 'diff-file-kill) ;?1ファイルに複数ファイルのdiffをおいた場合、1ファイル分のハンクを丸々削除？
;; 	))

;; http://www.clear-code.com/blog/2012/4/3.html
;; Emacs上でカラフルにdiffを表示する
;; diffを表示したらすぐに文字単位での強調表示も行う
;; (defun diff-mode-refine-automatically ()
;;   (diff-auto-refine-mode t))
;; (add-hook 'diff-mode-hook 'diff-mode-refine-automatically)

;; php-mode
(require 'php-mode)
(setq php-mode-force-pear t) ;PEAR規約のインデント設定にする

;;tramp
;; C+x f /ssh:user@host:/path/to/file
(require 'tramp)
(setq tramp-default-method "ssh")
;; TRAMPリモート接続時のPATH設定を改善させる
;; (例:リモートでのhg(version control)作業)
;; リモートのバッファ上でM-Shift-! echo PATHをしてみるとよく分かる。
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;; C++設定
;; http://d.hatena.ne.jp/pyopyopyo/20070217/p1
;; [F5] ビルド
;; [F7] コンパイル(make all)
;; [F4] コンパイルエラー行へジャンプ
;; [F1] カーソル下の単語についてマニュアルを開く
;; shift+[F7] リビルド(make clean all) <<今のところうまく使えない
;; shift+[F4] 一つ前のエラー行にジャンプ
(add-hook 'c-mode-common-hook
          '(lambda ()
             (require 'vc-hooks)
             (setq completion-mode t)
             ;; make のオプションは聞いてこない
             (setq compilation-read-command nil)
             ;; make するとき 全バッファを自動的にsaveする
             (setq compilation-ask-about-save nil)
             (define-key c-mode-base-map [f1] 'manual-entry)
             (define-key c-mode-base-map [f4] 'next-error)
             (define-key c-mode-base-map [(shift f4)] 'previous-error)
             (define-key c-mode-base-map [f7] 'compile)
             (define-key c-mode-base-map [(shift f7)] 
               '(lambda () 
                  (interactive)
                  ;;(require 'compile)
                  ;;(save-some-buffers (not compilation-ask-about-save) nil)
                  (compile-internal "make clean all" "No more errors")))
             ))

;; 補完に大文字小文字の区別をしない(でも、うまく動かない)
(setq completion-ignore-case t)


;; ;; ruby-mode
;; (autoload 'ruby-mode "ruby-mode" " for editing ruby source files" t)
;; (setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
;; (setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
;; (autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; auto-install.el
(require 'auto-install)
;; auto installによりインストールされる先
(setq auto-install-directory "~/.emacs.d/auto-install/")
;; ;; 起動時にEmacsWikiのページ名を補完候補に加える
;; (auto-install-update-emacswiki-package-name t)
;; install-elisp.el互換モードにする
(auto-install-compatibility-setup)
;; ediff関連のバッファを1つのフレームにまとめる
(setq ediff-windows-setup-function 'ediff-setup-windows-plain)

;; rst.elを読み込み
(require 'rst)
;; *.rst, *.restファイルをrst-modeでOpen
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)
                ) auto-mode-alist))
;; 全部スペースでインデントしましょう
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))

(add-to-list 'load-path "~/.emacs.d/auto-install")
(require 'anything-startup)


;; (setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.15/emacs"
;;       load-path))
(setq erlang-root-dir "/usr/local/erlang")
(setq exec-path (cons "/usr/local/erlang/bin" exec-path))
(require 'erlang-start)

;; auto-completeをerlang-modeで有効にさせる
(add-to-list 'ac-modes 'erlang-mode)
;; erlangのインデントモード設定
(setq erlang-indent-level 4) ;; 単位はspace(4なら4spece分のインデント)
(setq erlang-indent-line  4)
(setq erlang-indent-guard 4)

;; recentf-ext.el
;; M-x recentf-open-files
;; 最近のファイルX個を保存する(50個くらいで十分。そんなに覚えてない)
(setq recentf-max-saved-items 50)
;; 「最近使ったファイル候補」に加えないファイルを正規表現で指定
(setq recntf-exclude '("/TAGS$", "/var/tmp"))
(require 'recentf-ext)
;; C-x r fでrecentf-open-files実行
(global-set-key "\C-xrf" 'recentf-open-files)

;; bookmark
;; C-x r m : ブックマークを設定する   : bookmark-set
;; C-x r l : ブックマークリスト表示   : bookmark-bmenu-list
;; ブックマークを変更したら即保存する
(setq bookmark-save-flag 1)
;; anythingでおなじみの絞り込みできるブックマーク機能
(global-set-key "\C-xrl" 'anything-bookmarks)
;; 超整理法(使った物が上に)
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;; (add-to-list 'load-path "~/.emacs.d/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)

(require 'multiple-cursors)
;; When you have an active region that spans multiple lines, the following will
;; add a cursor to each line:

    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:

    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; First mark the word, then add more cursors.
;; 
;; To get out of multiple-cursors-mode, press `<return>` or `C-g`. The latter will
;; first disable multiple regions before disabling multiple cursors. If you want to
;; insert a newline in multiple-cursors-mode, use `C-j`.

;; 画面を縦横３分割する。
;; C-x " で縦 3 分割、C-x # で横 3 分割。
;; * byobu上では縦3分割が動かない。
(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-body-height) (/ (window-body-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-body-width) (/ (window-body-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))
(global-set-key "\C-x\"" '(lambda ()
                           (interactive)
                           (split-window-vertically-n 3)))
(global-set-key "\C-x#" '(lambda ()
                           (interactive)
                           (split-window-horizontally-n 3)))

;; Buffer間の移動を楽にするキーバインド
;; C-(HJKL) : buffer window間を上下左右、見たまま移動する。(vim風)
(define-key shell-mode-map (kbd "C-M-l") nil) ;; shell-modeでのC-M-l bindingを無効にする
(setq windmove-wrap-around t)
(windmove-default-keybindings)
(define-key global-map (kbd "C-M-k") 'windmove-up)
(define-key global-map (kbd "C-M-j") 'windmove-down)
(define-key global-map (kbd "C-M-l") 'windmove-right)
(define-key global-map (kbd "C-M-h") 'windmove-left)
;; ruby-modeでキーがバッティングしている？
;; 2014-05-19 : 使いたいから、ruby-modeをコメントアウト
;; 2014-05-20 : C-M-fが頻繁に使うバインドなので、C-M-?をC-S-?にしてみる。>上手くいかない
;; カーソルキーを使う案もあるが、頻繁に使うので、ホームポジションを崩すキーを使いたくない。
;; 2014-05-21 : vim型の配列では、C-M-lがshell上のキーバインドとかぶる。

;; http://ethanschoonover.com/solarized
;; 目に優しいカラーテーマ。
;; Install方法: M-x package-install color-theme-solarized
;; dark or light 2種類のカラーテーマを選択。
;; (load-theme 'solarized-dark t)
(load-theme 'solarized-light t)

;; multi-shell : shellの欠点を補った新しいshell
;; M-x multi-shell-new : 新しいシェルバッファを作成
(require 'multi-shell)
(setq multi-shell-command "/usr/local/bin/bash")
;; multi-shellではzshだとプロンプト表示がなんだか変なので、bashにする
;; (global-set-key (kbd "C-c t") '(lambda () (interactive) (multi-shell-new)))
(require 'multi-term)
(setq multi-term-program shell-file-name)

;; C-c n/pでterm間を移動するが、特に必要ない
;; (global-set-key (kbd "C-c n") 'multi-term-next)
;; (global-set-key (kbd "C-c p") 'multi-term-prev)

(add-hook 'term-mode-hook
      (lambda ()
        ;; ここのキー設定は要調整
        ;; C-v,M-vのスクロールの挙動
        ;; C-a,C-eでのカーソル移動
        ;; C-spaceでバッファ選択モードの挙動
        ;; C-lでバッファの履歴が消える(？？？)
        (define-key term-raw-map (kbd "C-\\") 'other-window)
        (define-key term-raw-map (kbd "C-y") 'term-paste)
        (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
            (define-key term-raw-map (kbd "M-d") 'term-send-forward-kill-word)
            (define-key term-raw-map (kbd "M-<backspace>") 'term-send-backward-kill-word)
            (define-key term-raw-map (kbd "M-DEL") 'term-send-backward-kill-word)
            (define-key term-raw-map (kbd "C-v") nil)
            (define-key term-raw-map (kbd "C-l") nil)
            ;; (define-key term-raw-map (kbd "C-a") 'move-beginning-of-line) ;行頭移動
            ;; (define-key term-raw-map (kbd "C-e") 'move-end-of-line) ;行末移動
            ;; (define-key term-raw-map (kbd "C-SPC") 'set-mark-command) ;マーク開始(うまくいかない)
            ;; (define-key term-raw-map (kbd "C-v") scroll-up)
            ;; (define-key term-raw-map (kbd "M-v") scroll-down)
        (define-key term-raw-map (kbd "ESC ESC") 'term-send-raw)
        (define-key term-raw-map (kbd "C-q") 'toggle-term-view)))

(defun toggle-term-view () (interactive)
  (cond ((eq major-mode 'term-mode)
     (fundamental-mode)
     (view-mode-enable)
     (local-set-key (kbd "C-c C-c") 'toggle-term-view)
     (setq multi-term-cursor-point (point)))
    ((eq major-mode 'fundamental-mode)
     (view-mode-disable)
     (goto-char multi-term-cursor-point)
     (multi-term-internal))))


;; for ack
;; http://www.emacswiki.org/emacs/Ack
;; --all ??
(defvar ack-history nil
  "History for the `ack' command.")

(defun ack (command-args)
  (interactive
   (let ((ack-command "/usr/local/bin/ack --nogroup --with-filename "))
     (list (read-shell-command "Run ack (like this): "
                               ack-command
                               'ack-history))))
  (let ((compilation-disable-input t))
    (compilation-start (concat command-args " < " null-device)
                       'grep-mode)))

;; |-----------|-------------------|--
;; |M-.        |find-tag           |入力した名前の関数にジャンプ
;; |M-*        |pop-tag-mark       |ジャンプしたあと元に戻る
;; |C-u M-.    |find-tag           |find-tagしたあとに使うと、次の同名関数にジャンプ
;; |C-M-.      |find-tag-regexp    |正規表現で関数を探してジャンプ
;; |C-x 4 .    |find-tag-other-window  |入力した名前の関数のところに別Windowでジャンプ
;; |C-x 5 .    |find-tag-other-frame   |入力した名前の関数のところに別frameでジャンプ
;; |-----------|
;; |           |tags-search        |指定した関数などの文字列を検索します。M-,で次を検索します。
;; |           |tags-query-replace |置換を行います。中断した場合でもM-,で再開できます。
;; |M-,        |tags-loop-continue |上記の検索、置換を再開、続行します。
;; |-----------|
;; |           |tags-reset-tags-tables |タグテーブルをリセットします。次回タグ検索するとき、改めてTAGSファイルの指定が求められます。


;; TAGファイルの生成は、
;; "ctags -eR"で行う。

;; auto save無効
(setq make-backup-files nil)
(setq auto-save-default nil)

;; markdown-mode
;; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; find-grep(grep-find)でackを使った検索になる
;; shell上でackして探すより、ファイルオープンが楽。
(setq grep-find-command '("ack --nogroup --nocolor -k " . 28))

;; Windowサイズの切り替えを簡単にする
;; C-c C-r : ウィンドウサイズの切り替えモード
;; hl : 左右にウィンドウサイズを調整する
;; jk : 上下にウィンドウサイズを切り替える
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key "\C-c\C-r" 'window-resizer)

;;----------------------------------------------------------------------------------------------
;; http://kakurasan.blogspot.jp/2015/05/dired-filemanager-renamer.html
;;
;; Diredと直接関係ないが、削除確認などでyes/noと入力後Enterを押す代わりに
;; y/nのどちらかのキーを押すだけでよくなる設定
(fset 'yes-or-no-p 'y-or-n-p)

;; Diredでの表示のカスタマイズ。"h"を追加することで、ファイルサイズが読みやすくなる。
;; Stackoverflowで見つけた任意のカスタマイズをしたい場合dired上でC-u sのあとミニバッファで指定する
(setq dired-listing-switches "-alh --time-style=long-iso")

(require 'magit)
(require 'magit-gerrit)

;; ;; Mediawikiを直接編集できるけど、正直微妙。
;; (require `mediawiki)

;; emacsでブラウザ表示できない問題の対処
;; 参考: http://kazu.tv/blog/2010/10/08/ensimescaladoc/
;; w3m -> ewwに変える
(setq browse-url-browser-function 'eww-browse-url)


;; regionで囲んだ範囲内の行数、文字数を表示する
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ;;(count-lines-region (region-beginning) (region-end)) ;; これだとエコーエリアがチラつく
    ""))

(add-to-list 'default-mode-line-format
                          '(:eval (count-lines-and-chars)))


(put 'set-goal-column 'disabled nil)

;; ;; http://d.hatena.ne.jp/higepon/20060107/1136628498
;; ;; gtags使えないか確認
;; (autoload 'gtags-mode "gtags" "" t)
;; (setq gtags-mode-hook
;;       '(lambda ()
;;          (local-set-key "\M-t" 'gtags-find-tag)
;;          (local-set-key "\M-r" 'gtags-find-rtag)
;;          (local-set-key "\M-s" 'gtags-find-symbol)
;;          (local-set-key "\C-t" 'gtags-pop-stack)
;;          ))
