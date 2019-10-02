;; hide the startup message
(setq inhibit-startup-message t)

;; hide toolbars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;sounds
(setq ring-bell-function 'ignore)

;; set font for linux
(set-frame-font "Liberation Mono 14" nil t)

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
