;; todo make font a var and add functions to change it
;; add func to change to mono fast

(defun base-theme-mode ()
  "Inherit me."
  (interactive)
  (set-frame-font "Raleway 16" nil t)
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
