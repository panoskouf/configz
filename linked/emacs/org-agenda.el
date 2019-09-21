(setq org-agenda-files (list "~/documentation/journey/tmp.org" "~/documentation/journey/ops" "~/documentation/help/notes/agenda.org"))
;; https://lists.gnu.org/archive/html/emacs-orgmode/2009-09/msg00317.html
;; or better https://karl-voit.at/2017/02/11/my-system-is-foobar/
(global-set-key (kbd "C-c A") 'org-agenda)
(global-set-key (kbd "C-c a") 'org-agenda-list)

(defun org-agenda-show-agenda-and-todo (&optional arg)
  (interactive "P")
  (org-agenda arg "n"))

(global-set-key (kbd "C-c t") 'org-agenda-show-agenda-and-todo)
