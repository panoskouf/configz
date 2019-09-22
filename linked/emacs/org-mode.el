(require 'org)

(setcar (nthcdr 4 org-emphasis-regexp-components) 10)
;; (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n,\"")

;; fix shift select
(setq org-support-shift-select t
      org-replace-disputed-keys t)

;; https://www.emacswiki.org/emacs/GlobalTextScaleMode
;; TODO: find sth like this (setq text-scale-mode 2)

;; https://emacs.stackexchange.com/questions/47632/how-do-i-make-markdown-or-org-mode-hide-formatting-characters-until-i-edit
(setq org-hide-emphasis-markers t)
(setq markdown-hide-markup t)

;; fold by pressing tab once
(add-hook 'org-cycle-hook
    (lambda (state)
      (when (eq state 'children)
        (setq org-cycle-subtree-status 'subtree))))

;; search lazy text instead of headlines for links like file:somefile.org::some words
(setq org-link-search-must-match-exact-headline nil)


;; TODO: https://emacs.stackexchange.com/questions/5889/how-to-highlight-text-permanently-in-org-mode

;; this setting should be placed last
(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
