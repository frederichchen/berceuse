;;; berceuse-cperl.el --- configurations for c & perl

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Configuration for built-in cc-mode and cperl-mode, I use cperl-mode instead of perl-mode.

;;; Code:

(setq c-default-style "linux"
      c-basic-offset 4)

;; Use cperl-mode instead of default perl-mode
(defalias 'perl-mode 'cperl-mode)
;; cperl-hairy affects all those variables, but I prefer
;; a more fine-grained approach as far as they are concerned
(setq cperl-font-lock t
      cperl-electric-parens nil
      cperl-electric-linefeed nil
      cperl-electric-keywords nil
      cperl-info-on-command-no-prompt t
      cperl-clobber-lisp-bindings t
      cperl-lazy-help-time 3)

(provide 'berceuse-cperl)

;;; berceuse-cperl.el ends here
