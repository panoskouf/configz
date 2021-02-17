;; use default clipboard commands
(cua-mode t)
    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
    (transient-mark-mode 1)               ;; No region when it is not highlighted
    (setq cua-keep-region-after-copy t)

;;   (global-set-key [M-f4] 'save-buffers-kill-emacs)
   (global-set-key "\C-a" 'mark-whole-buffer)
   (global-set-key "\C-f" 'isearch-forward)
   (define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
   (global-set-key "\C-p" 'find-file)
   (global-set-key "\C-s" 'save-buffer)
   (global-set-key "\C-w" 'kill-this-buffer)

;;   (global-set-key (kbd "C-S-P") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
