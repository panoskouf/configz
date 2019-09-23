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


;;
;; GG
;; --------------------------------------
;;


(load-file (concat emacsdir "basic-config.el"))
(load-file (concat emacsdir "utf8.el"))
(load-file (concat emacsdir "greek.el"))
(load-file (concat emacsdir "org-agenda.el"))
(load-file (concat emacsdir "org-crypt.el"))
(load-file (concat emacsdir "org-mode.el"))
(load-file (concat emacsdir "org-journal.el"))

(nyan-mode 1)
