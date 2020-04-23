;; packages:  mixed-pitch, org-bullets

;; kinda show emoji, emacs27 has better support so look to fix it then
(set-fontset-font t nil "Symbola" nil 'prepend)

;; default fonts will override mixed-pitch, dont use them
;; (set-default-font "Raleway 16" nil t)

;; todo create 2nd category of themes to adjust text for low dpi screens

(require 'mixed-pitch)
;; use monospace where you should (e.g. org tables, dired)
(add-hook 'text-mode-hook 'mixed-pitch-mode)
(set-face-attribute 'fixed-pitch-serif nil :family  "Fira Code 16")
(set-face-font 'fixed-pitch-serif "Fira Code 16")
(set-face-font 'variable-pitch "Raleway 16")

;; Fix font size of monospace font
(set-face-attribute 'default nil
                    :height 150
                    :weight 'normal
                    :width 'normal
		    )

;; mode-line font size
(custom-set-faces
 '(mode-line ((t (:background "#222226" :foreground "#b2b2b2" :box (:line-width 1 :color "#5d4d7a") :height 0.8))))
 '(mode-line-inactive ((t (:background "#222226" :foreground "#b2b2b2" :box (:line-width 1 :color "#5d4d7a") :height 0.8)))))
;; mode-line don't show branch
(setcdr (assq 'vc-mode mode-line-format)
        '((:eval (replace-regexp-in-string "^ Git.*$" " " vc-mode))))


(defun base-theme-mode ()
  "Inherit me."
  (interactive)
  (mapcar 'disable-theme custom-enabled-themes)
  )

(defun fix-org-bullets ()
  "org-bullets messes up when theme is changed"
  (interactive)
  (require 'org)
  (org-mode-restart)
  )

(defun dark-mode ()
  "Enables a dark theme."
  (interactive)
  (base-theme-mode)
  (load-theme 'spacemacs-dark t)
  (fix-org-bullets)
  )

(defun light-mode ()
  "Enables a light theme."
  (interactive)
  (base-theme-mode)
  (load-theme 'spacemacs-light t)
  (fix-org-bullets)
  )

(defun presentation-mode ()
  "Presentation friendly theme and font size."
  (interactive)
  (base-theme-mode)
  (load-theme 'leuven t)
  (fix-org-bullets)
  )

;; default theme
(dark-mode)



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit bold :foreground "#4f97d7" :weight bold :height 1.0))))
 '(org-level-2 ((t (:inherit bold :foreground "#2d9574" :weight bold :height 1.0))))
 '(org-level-3 ((t (:foreground "#67b11d" :weight normal :height 1.0)))))

;; todo [[https://emacs.stackexchange.com/questions/38216/custom-faces-in-org-9-0][org mode - Custom faces in org 9.0 - Emacs Stack Exchange]]
