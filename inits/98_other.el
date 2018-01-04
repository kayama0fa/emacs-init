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

;; http://ethanschoonover.com/solarized
;; 目に優しいカラーテーマ。
(load-theme 'sanityinc-solarized-light t)

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

;; 何が問題なのか?
;;    emacs で同一の名前を持つファイルを複数開くと, バッファの名前には<2><3>...
;;    と番号が振られます. しかし, これではどれがどれだかさっぱり分かりません．
;; 何ができるのか?
;;    バッファ名を <2><3>... ではなく, ディレクトリ名で表示してくれる．
;;    例えば, ~/.emacs.el, ~/test/.emacs.el を開いたとすると,
;;    それぞれ .emacs, .emacs<test>となりますので，どのファイルが
;;    どういうファイルかが分かりやすくなります．
;; (require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; 全角スペースとかに色を付ける
;; 何色が表示できるか確認するには、M-x list-color-disply
;; todo: 要調整
;; 引用元: http://cortyuming.hateblo.jp/entry/2016/07/17/160238
(progn
  (require 'whitespace)
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
                      :foreground "black"
                      :background "color-226"
                      :underline nil)
  (set-face-attribute 'whitespace-tab nil
                      :foreground "black"
                      :background "color-226"
                      :underline nil)
  (set-face-attribute 'whitespace-space nil
                      :foreground "black"
                      :background "color-226"
                      :underline nil)
  (global-whitespace-mode t)
  )
