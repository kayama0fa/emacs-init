;; keybind
(define-key global-map "\C-h" 'delete-backward-char)  ;; 削除
(define-key global-map "\C-c;" 'comment-region)       ;; コメントアウト
(define-key global-map "\C-c:" 'uncomment-region)     ;; コメント解除
(define-key global-map "\C-\\" nil)                   ;; \C-\の日本語入力の設定を無効にする
(define-key global-map "\C-cc" `compile)
(global-set-key "\C-x\C-a" 'add-change-log-entry)     ;; Change-Logを作成する
(global-set-key "\C-cg" 'imenu)                       ;; C-c gで開いているコードの関数一覧を表示する

;; (define-key global-map "\C-z" 'undo)                  ;; undo(C-/)
;; (define-key global-map "\C-x\C-c" nil)                ;; ショートカットによる修正を無効化

;; memo:
;; * あるキーに何が割り当てられているか調べる
;;     * M-x describe-key
;; * 割り当てられているキーの一覧
;;     * M-x describe-bindings
