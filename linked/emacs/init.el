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

;; emacsdir is this direcory path and is set from ../../init.sh
(load-file (concat emacsdir "basic-config.el"))
(load-file (concat emacsdir "themes.el"))
(load-file (concat emacsdir "utf8.el"))
(load-file (concat emacsdir "greek.el"))
(load-file (concat emacsdir "org-agenda.el"))
(load-file (concat emacsdir "org-crypt.el"))
(load-file (concat emacsdir "org-mode.el"))
(load-file (concat emacsdir "org-journal.el"))
(load-file (concat emacsdir "python.el"))

(nyan-mode 1)