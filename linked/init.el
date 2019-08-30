;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; BASIC CUSTOMIZATION
;; --------------------------------------

;; set font for linux
(set-frame-font "Liberation Mono 12" nil t)

;; backup config for emacs files
(setq backup-directory-alist `(("." . "~/.backup/emacs")))
(setq backup-by-copying t)

;; {{ move between showing buffers easily
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
;; }}

;;aliases
(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(defalias 'rs 'replace-string)

;;hide toolbars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-message t) ;; hide the startup message

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

;;tabs instead of spaces
(setq tab-width 2)
(setq indent-tabs-mode nil)

;;highlight tabs
(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-global-modes '(not org-mode))

;;highlight trailing whitespaces
(setq-default show-trailing-whitespace 1)

;;(setq whitespace-style (quote
;;  ( face spaces tabs newline space-mark tab-mark newline-mark)))

(setq whitespace-style (quote
  ( face tabs tab-mark)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(setq default-input-method "greek")
(setq ring-bell-function 'ignore)


;; (nyan-mode 1)
