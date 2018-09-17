;;; berceuse-elisp.el --- Configurations for Elisp programming.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Basic configurations for Elisp Programming.

;;; Code:

(berceuse-require-package 'elisp-slime-nav)
(dolist (hook '(emacs-lisp-mode-hook lisp-interaction-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-eldoc-mode))
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'elisp-slime-nav-mode))

(provide 'berceuse-elisp)

;;; berceuse-elisp.el ends here
