;; packages:  nyan-mode

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



;; emacsdir is this direcory path and is set from configs dir
;; (init.sh)

(load-file (concat emacsdir "basic-config.el"))
(load-file (concat emacsdir "vscode.el"))
;; (load-file (concat emacsdir "bookmarks.el"))
(load-file (concat emacsdir "themes.el"))
(load-file (concat emacsdir "utf8.el"))
(load-file (concat emacsdir "greek.el"))
;; (load-file (concat emacsdir "greek-wsl.el"))
;; (load-file (concat emacsdir "org-agenda.el"))
;; (load-file (concat emacsdir "org-crypt.el"))
;; (load-file (concat emacsdir "org-mode.el"))
;; (load-file (concat emacsdir "markdown-mode.el"))
;; (load-file (concat emacsdir "org-journal.el"))
;; (load-file (concat emacsdir "python.el"))
;; (load-file (concat emacsdir "dictionaries.el"))


;; (nyan-mode 1)


(require 'org)

(setcar (nthcdr 4 org-emphasis-regexp-components) 10)
;; (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n,\"")

;; fix shift select
(setq org-support-shift-select t
      org-replace-disputed-keys t)

;; follow links with ret
(setq org-return-follows-link t)
