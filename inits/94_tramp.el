;; C+x f /ssh:user@host:/path/to/file
(setq tramp-default-method "ssh")
;; TRAMPリモート接続時のPATH設定を改善させる
;; (例:リモートでのhg(version control)作業)
;; リモートのバッファ上でM-Shift-! echo PATHをしてみるとよく分かる。
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
