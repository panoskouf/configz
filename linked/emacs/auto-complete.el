;; packages: smex

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".md" ".org"))

;; do I need this ?
;; (setq ido-use-filename-at-point 'guess)


;; smex

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
