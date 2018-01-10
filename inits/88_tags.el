(use-package helm-gtags
  :config
  (add-hook 'erlang-mode-hook 'helm-gtags-mode)

  ;; key bindings
  (add-hook 'helm-gtags-mode-hook
            '(lambda ()
               (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
               (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
               (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
               (local-set-key (kbd "M-T") 'helm-gtags-pop-stack)
               ))
)

;; Memo
;; https://github.com/syohex/emacs-helm-gtags
;; http://emacs-jp.github.io/packages/helm/helm-gtags
;; helm-gtags-mode
;;     helm-gtags-modeを有効にする
;; helm-gtags-find-tag
;;     入力されたタグの定義元へジャンプ
;; helm-gtags-find-rtag
;;     入力タグを参照する場所へジャンプ
;; helm-gtags-find-symbol
;;     入力したシンボルを参照する場所へジャンプ
;; helm-gtags-find-files
;;     入力したファイルを開く
;; helm-gtags-select
;;     タグ一覧からタグを選択し, その定義元にジャンプする(複数アクションあり)
;; helm-gtags-pop-stack
;;     ジャンプ前の場所に戻る
;; helm-gtags-clear-stack
;;     保存しているジャンプ元のスタックをクリアする

;; Memo2
;; TAGSファイルの生成
;;     $ gtags --gtagslabel=pygments -v --debug
;;     (pygmentsを入れているなら有効にして、--debugは必要に応じて付ける
;; 他のディレクトリのTAGSファイルを参照する
;;     環境変数GTAGSLIBPATHを利用する
;;
