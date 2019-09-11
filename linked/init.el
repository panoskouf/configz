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
(set-frame-font "Liberation Mono 14" nil t)

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

;; increase/decrease font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; https://emacs.stackexchange.com/questions/2568/problem-dead-acute-is-undefined-appearing-when-typing-greek-stress
(global-set-key (kbd "<dead-acute> α") "ά")
(global-set-key (kbd "<dead-acute> Α") "Ά")
(global-set-key (kbd "<dead-acute> ο") "ό")
(global-set-key (kbd "<dead-acute> Ο") "Ό")
(global-set-key (kbd "<dead-acute> ω") "ώ")
(global-set-key (kbd "<dead-acute> Ω") "Ώ")
(global-set-key (kbd "<dead-acute> υ") "ύ")
(global-set-key (kbd "<dead-acute> Υ") "Ύ")
(global-set-key (kbd "<dead-acute> η") "ή")
(global-set-key (kbd "<dead-acute> Η") "Ή")
(global-set-key (kbd "<dead-acute> ι") "ί")
(global-set-key (kbd "<dead-acute> Ι") "Ί")
(global-set-key (kbd "<dead-acute> ε") "έ")
(global-set-key (kbd "<dead-acute> Ε") "Έ")
;; maybe in the future https://github.com/lislon/emacs-switch-lang

(nyan-mode 1)

;; org-mode customization
(require 'org)

(setcar (nthcdr 4 org-emphasis-regexp-components) 10)
;; (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n,\"")

;; https://emacs.stackexchange.com/questions/22286/shiftarrow-to-change-window-does-not-work-in-org-mode
(setq org-support-shift-select 'always)

;; https://www.emacswiki.org/emacs/GlobalTextScaleMode
;; TODO: find sth like this (setq text-scale-mode 2)

;; this setting should be placed last
(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
