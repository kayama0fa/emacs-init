(require 'recentf-ext)
;; 最近のファイルX個を保存する(50個くらいで十分。そんなに覚えてない)
(setq recentf-max-saved-items 50)
;; 「最近使ったファイル候補」に加えないファイルを正規表現で指定

;; (setq recntf-exclude '("/TAGS$", "/var/tmp"))
;; C-x r fでrecentf-open-files実行
(global-set-key "\C-xrf" 'recentf-open-files)

