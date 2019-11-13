;; https://realpython.com/emacs-the-best-python-editor/
;; https://medium.com/@enzuru/helpful-emacs-python-mode-hooks-especially-for-type-hinting-c4b70b9b2216
;; pip3 install virtualenv black
;; emacs packages used:
;;   elpy
;;   flycheck
;;   blacken

(elpy-version)
(elpy-enable)

;; Enable Flycheck for real time syntax feedback
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'python-mode-hook (lambda () (blacken-mode t)))
