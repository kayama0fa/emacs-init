;; default to unified diffs
(setq diff-switches "-u")

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

