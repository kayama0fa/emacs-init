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
(setq dired-listing-switches "-alh --time-style=long-iso")

;; http://kakurasan.blogspot.jp/2015/05/dired-filemanager-renamer.html
;; y/nのどちらかのキーを押すだけでよくなる設定
(fset 'yes-or-no-p 'y-or-n-p)

;; auto save無効
(setq make-backup-files nil)
(setq auto-save-default nil)

;; http://ethanschoonover.com/solarized
;; 目に優しいカラーテーマ。
(load-theme 'solarized t)

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
