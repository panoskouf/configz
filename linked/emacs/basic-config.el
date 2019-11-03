;; hide the startup message
(setq inhibit-startup-message t)

;; hide toolbars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;sounds
(setq ring-bell-function 'ignore)

;; start from different file todo
;;(let ((filename "~/test.txt"))
  ;;(when (file-exists-p filename)
    ;;(setq initial-buffer-choice filename)))

;; initial window size
(setq initial-frame-alist
      '(
        (width . 60) ; character
        (height . 25) ; lines
        ))

;; default/sebsequent window size
(setq default-frame-alist
      '(
        (width . 60) ; character
        (height . 25) ; lines
        ))

;; backup config for emacs files
(setq backup-directory-alist `(("." . "~/.backup/emacs")))
(setq backup-by-copying t)

;; move between showing buffers easily
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)


;; aliases
(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(defalias 'rs 'replace-string)
(defalias 'rr 'replace-regexp)
(defalias 'ct 'customize-themes)
(defalias 'atf 'append-to-file)
(defalias '_l 'light-mode)
(defalias '_d 'dark-mode)

;; buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; increase/decrease font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; spaces instead of tabs
(setq tab-width 2)
(setq indent-tabs-mode nil)

;; tabs highlight
(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-global-modes '(not org-mode))

;; highlight trailing whitespaces
(setq-default show-trailing-whitespace 1)

(setq whitespace-style (quote
  ( face tabs tab-mark)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; todo add function to cycle through .org/(only?) files in this folder

;; https://www.emacswiki.org/emacs/GlobalTextScaleMode
;; todo find sth like this (setq text-scale-mode 2)
