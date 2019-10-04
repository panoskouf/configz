(setq org-agenda-files (list "~/Dropbox/documentation/journey/tmp.org" "~/Dropbox/documentation/journey/ops" "~/Dropbox/documentation/help/notes/agenda.org"))
;; https://lists.gnu.org/archive/html/emacs-orgmode/2009-09/msg00317.html
;; or better https://karl-voit.at/2017/02/11/my-system-is-foobar/
(global-set-key (kbd "C-c A") 'org-agenda)
(global-set-key (kbd "C-c a") 'org-agenda-list)

;; get specific view for agenda
(defun org-agenda-show-agenda-and-todo (&optional arg)
  (interactive "P")
  (org-agenda arg "t"))

(global-set-key (kbd "C-c t") 'org-agenda-show-agenda-and-todo)

;; https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html
(defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

(defun air-org-skip-subtree-if-habit ()
  "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (if (string= (org-entry-get nil "STYLE") "habit")
        subtree-end
      nil)))


(setq org-agenda-custom-commands
      '(("d" "Daily agenda and all TODOs"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "" ((org-agenda-ndays 1)))
          (alltodo ""
                   ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
                                                   (air-org-skip-subtree-if-priority ?A)
                                                   (org-agenda-skip-if nil '(scheduled deadline))))
                    (org-agenda-overriding-header "ALL normal priority tasks:"))))
         ((org-agenda-compact-blocks t)))))

;; todo config to see phases of the moon
;; https://ftp.gnu.org/old-gnu/Manuals/emacs-20.7/html_node/emacs_388.html
;; https://ftp.gnu.org/old-gnu/Manuals/emacs-20.7/html_node/emacs_401.html#SEC407
