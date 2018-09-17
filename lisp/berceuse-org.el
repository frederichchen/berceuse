;;; berceuse-org.el --- org-mode configuration.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Some basic configuration for org-mode, eg. set word-warp for it.  I use melpa version instead of builtin version.

;;; Code:

(berceuse-require-package 'htmlize)

(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(setq org-log-done t
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-export-with-sub-superscripts nil
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-tags-column 80)

(provide 'berceuse-org)

;;; berceuse-org.el ends here
