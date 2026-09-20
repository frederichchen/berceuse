;; -*- lexical-binding: t; -*-
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
  (setq truncate-lines nil)
  ;; set the fonts for org-mode, compatible with windows, main typeface
  (set-face-attribute 'default nil :family "Fira Code Retina" :height 180)
  ;; Proportionately spaced typeface
  (set-face-attribute 'variable-pitch nil :family "Fira Code Retina" :height 1.0)
  ;; Monospaced typeface
  (set-face-attribute 'fixed-pitch nil :family "Source Code Pro" :height 1.0))

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
