;; needs more work..

(setq default-input-method "greek")

;; https://emacs.stackexchange.com/questions/2568/problem-dead-acute-is-undefined-appearing-when-typing-greek-stress
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

;; maybe in the future https://github.com/lislon/emacs-switch-lang


;; make control meta keybindings work
(require 'reverse-im)
(reverse-im-activate "greek")
