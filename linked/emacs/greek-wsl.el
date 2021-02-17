;; make control meta keybindings work
;;(require 'reverse-im)
;;(reverse-im-activate "greek")

;; semicolon in greek is in q button - normalize this
;; for now just eat comment-dwim - remember to rebind this
(add-hook 'org-mode-hook
          (lambda ()
                  (local-set-key (kbd "M-;") 'org-fill-paragraph)))
