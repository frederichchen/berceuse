;;; berceuse-elisp.el --- Configurations for Elisp programming.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 21 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for Elisp Programming.

;;; Code:

(berceuse-require-package 'elisp-slime-nav)
(use-package elisp-slime-nav
  :hook
  (((emacs-lisp-mode lisp-interaction-mode ielm-mode) . turn-on-eldoc-mode)
   ((emacs-lisp-mode ielm-mode) . elisp-slime-nav-mode)))

(provide 'berceuse-elisp)

;;; berceuse-elisp.el ends here
