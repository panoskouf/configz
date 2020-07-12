;; packages: flyspell-lazy

;; source https://emacs.stackexchange.com/questions/20679/enable-greek-spellchecking
;; download greek dictionary for hunspell https://sourceforge.net/projects/grspell/
;; sudo apt install hunspell
;; sudo cp el_GR.dic el_GR.aff /usr/share/hunspell
;; test in terminal with <hunspell -d el_GR> and then mistype a greek word
;; add configuration


;; improve performance when using flyspell
(require 'flyspell-lazy)
(flyspell-lazy-mode 1)

(require 'ispell)
;; custom dictionary names do not work
(add-to-list 'ispell-local-dictionary-alist '("el_GR"
                                          "[[:alpha:]]"
                                          "[^[:alpha:]]"
                                          "[']"
                                          t
                                          ("-d" "el_GR"); Dictionary file name
                                          nil
                                          utf-8))

(add-to-list 'ispell-local-dictionary-alist '("en_US"
                                          "[[:alpha:]]"
                                          "[^[:alpha:]]"
                                          "[']"
                                          t
                                          ("-d" "en_US")
                                          nil
                                          utf-8))


(setq ispell-program-name "hunspell" ; Use hunspell to correct mistakes
      ispell-dictionary   "en_US") ; Default dictionary to use

(defun  fd-switch-dictionary()
"Switch greek and english dictionaries."
(interactive)
(let* ((dict ispell-current-dictionary)
     (new (if (string= dict "el_GR") "en_US"
               "el_GR")))
(ispell-change-dictionary new)
(message "Switched dictionary from %s to %s" dict new)))

(global-set-key (kbd "C-c d") 'fd-switch-dictionary)
(global-set-key (kbd "C-c i") 'ispell)
(global-set-key (kbd "C-c f") 'flyspell-mode)
