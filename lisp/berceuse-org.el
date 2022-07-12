;;; berceuse-org.el --- org-mode configuration.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 23 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Some basic configuration for org-mode, eg. set word-warp for it.  I use melpa version instead of builtin version.

;;; Code:

(berceuse-require-package 'org-bullets)

(defun org-mode-setup ()
  "Set up the 'org-mode initialization hook."
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  (setq truncate-lines nil))

(use-package org
  :hook (org-mode . org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
	org-log-done t
	org-tags-column 80))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(provide 'berceuse-org)

;;; berceuse-org.el ends here
