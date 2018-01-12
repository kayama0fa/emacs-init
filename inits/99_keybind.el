;; keybind
(global-set-key "\C-h" 'delete-backward-char)  ;; 削除
(global-set-key "\C-c;" 'comment-region)       ;; コメントアウト
(global-set-key "\C-c:" 'uncomment-region)     ;; コメント解除
(global-set-key "\C-\\" nil)                   ;; \C-\の日本語入力の設定を無効にする
(global-set-key "\C-cc" 'compile)
(global-set-key "\C-cg" 'imenu)                ;; C-c gで開いているコードの関数一覧を表示する

;; (global-set-key "\C-z" 'undo)                  ;; undo(C-/)
;; (global-set-key "\C-x\C-c" nil)                ;; ショートカットによる修正を無効化

;; memo:
;; * あるキーに何が割り当てられているか調べる
;;     * M-x describe-key
;; * 割り当てられているキーの一覧
;;     * M-x describe-bindings
