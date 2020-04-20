(setq default-input-method "greek")

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

(global-set-key (kbd "<S-dead-diaeresis> ι") "ϊ")
(global-set-key (kbd "<S-dead-diaeresis> <dead-acute> ι") "ΐ")
(global-set-key (kbd "<S-dead-diaeresis> Ι") "Ϊ")
(global-set-key (kbd "<S-dead-diaeresis> υ") "ϋ")
(global-set-key (kbd "<S-dead-diaeresis> <dead-acute> υ") "ΰ")
(global-set-key (kbd "<S-dead-diaeresis> Υ") "Ϋ")

;; make control meta keybindings work
(require 'reverse-im)
(reverse-im-activate "greek")

;; semicolon in greek is in q button - normalize this
;; for now just eat comment-dwim - remember to rebind this
(add-hook 'org-mode-hook
          (lambda ()
                  (local-set-key (kbd "M-;") 'org-fill-paragraph)))
