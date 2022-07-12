;;; berceuse-cperl.el --- configurations for c & perl

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 21 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Configuration for built-in cc-mode and cperl-mode, I use cperl-mode instead of perl-mode.

;;; Code:

(defalias 'perl-mode 'cperl-mode)
(use-package cperl-mode
  :config
  (setq c-default-style "linux"
	c-basic-offset 4
	cperl-font-lock t
	cperl-electric-parens nil
	cperl-electric-linefeed nil
	cperl-electric-keywords nil
	cperl-info-on-command-no-prompt t
	cperl-clobber-lisp-bindings t
	cperl-lazy-help-time 3))

(provide 'berceuse-cperl)

;;; berceuse-cperl.el ends here
