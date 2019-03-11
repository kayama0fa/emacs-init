;; multi-shell : shellの欠点を補った新しいshell
;; M-x multi-shell-new : 新しいシェルバッファを作成
(setq multi-shell-command "/usr/local/bin/bash")


(setq multi-term-program shell-file-name)

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
        (define-key term-raw-map (kbd "C-q") 'toggle-term-view)
        )
      )

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
