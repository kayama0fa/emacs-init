;; ビープやスクリーンフラッシュを無効化する
;; http://randd.kwappa.net/2011/03/10/258
(setq ring-bell-function 'ignore)

;; デフォルトのインデントレベルの指定
(setq-default indent-level 4)
;; デフォルトのタブ幅の指定
;;(setq-default tab-width 4)
(setq-default tab-width 4)
;; インデントはタブではなくスペース
(setq-default indent-tabs-mode nil)

;; Diredでの表示のカスタマイズ。"h"を追加することで、ファイルサイズが
;; 読みやすくなる。Stackoverflowで見つけた任意のカスタマイズをしたい場
;; 合dired上でC-u sのあとミニバッファで指定する
;; (MacOSの場合、GNU coreutilsのインストールが必須)
(setq dired-listing-switches "-alhF --time-style=long-iso")

;; ;; OS別にdiredの動作をわけるケース
;; (when (equal system-type 'darwin)
;;   (setq dired-listing-switches "-alh"))
;; ;; MacOSのls(BSD)で-Tオプションをつけると、diredは正常に動作しない
;; (when (equal system-type 'gnu/linux)
;;   (setq dired-listing-switches "-alhF --time-style=long-iso"))

;; http://kakurasan.blogspot.jp/2015/05/dired-filemanager-renamer.html
;; y/nのどちらかのキーを押すだけでよくなる設定
(fset 'yes-or-no-p 'y-or-n-p)

;; auto save無効
(setq make-backup-files nil)
(setq auto-save-default nil)

;; (load-theme 'sanityinc-solarized-light t)
;; (load-theme 'sanityinc-solarized-dark t)
(load-theme 'zenburn t)

;;; カーソルの位置が何文字目か、何行目かを表示する
(column-number-mode t)
(line-number-mode t)

(when (require 'hiwin nil t)
  (hiwin-activate)                            ;; hiwin-modeを有効化
  (set-face-background 'hiwin-face "color-239")   ;; 非アクティブバッファの背景色を設定
  )

;; 対応するカッコをハイライトする
(show-paren-mode 1)
;; 画面内に対応する括弧がある場合は対応する括弧をハイライト、ない場合は括弧で囲まれた部分をハイライト
(setq show-paren-style 'mixed)

;; 何が問題なのか?
;;    emacs で同一の名前を持つファイルを複数開くと, バッファの名前には<2><3>...
;;    と番号が振られます. しかし, これではどれがどれだかさっぱり分かりません．
;; 何ができるのか?
;;    バッファ名を <2><3>... ではなく, ディレクトリ名で表示してくれる．
;;    例えば, ~/.emacs.el, ~/test/.emacs.el を開いたとすると,
;;    それぞれ .emacs, .emacs<test>となりますので，どのファイルが
;;    どういうファイルかが分かりやすくなります．
;; (use-package uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; ミニバッファでの補完時に英語の大文字小文字を区別しない
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; メニューバーを非表示にする
(menu-bar-mode -1)

;; 全角スペースとかに色を付ける
;; 何色が表示できるか確認するには、M-x list-color-disply
;; todo: 要調整
;; 引用元: http://cortyuming.hateblo.jp/entry/2016/07/17/160238
(use-package whitespace
  :config
  (setq whitespace-style
        '(
          face ; faceで可視化
          trailing ; 行末
          tabs ; タブ
          spaces ; スペース
          space-mark ; 表示のマッピング
          tab-mark
          ))
  (setq whitespace-display-mappings
        '(
          (space-mark ?\u3000 [?\u2423])
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])
          ))
  (setq whitespace-trailing-regexp  "\\([ \u00A0]+\\)$")
  (setq whitespace-space-regexp "\\(\u3000+\\)")
  (set-face-attribute 'whitespace-trailing nil
                      ;; :foreground "black"
                      ;; :background "color-228"
                      :background "color-243"
                      :underline nil)
  (set-face-attribute 'whitespace-tab nil
                      ;; :foreground "black"
                      ;; :background "color-228"
                      :background "color-243"
                      :underline nil)
  (set-face-attribute 'whitespace-space nil
                      ;; :foreground "black"
                      ;; :background "color-228"
                      :background "color-243"
                      :underline nil)
  (global-whitespace-mode t)
  )

;; Colorize man-mode.
(set-face-attribute 'Man-overstrike nil :inherit 'bold :foreground "brightmagenta")
(set-face-attribute 'Man-underline nil :inherit 'underline :foreground "cyan")
