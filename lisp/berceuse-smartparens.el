;;; berceuse-smartparens.el --- Configurations for smartparens

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 16 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for smartparens

;;; Code:

(use-package smartparens
  :diminish
  :custom (smartparens-global-mode t)
  :init
  (require 'smartparens-config)
  (require 'smartparens-ruby)
  :bind
  (:map smartparens-mode-map
	("C-M-a" . sp-beginning-of-sexp)
	("C-M-e" . sp-end-of-sexp)
	("C-<down>" . sp-down-sexp)
	("C-<up>" . sp-up-sexp)
	("M-<down>" . sp-backward-down-sexp)
	("M-<up>" . sp-backward-up-sexp)
	("C-<right>" . sp-forward-slurp-sexp)
	("M-<right>" . sp-forward-barf-sexp)
	("C-<left>" . sp-backward-slurp-sexp)
	("M-<left>" . sp-backward-barf-sexp)
	("C-M-c (" . wrap-with-parens)
	("C-M-c [" . wrap-with-brackets)
	("C-M-c {" . wrap-with-braces)
	("C-M-c '" . wrap-with-single-quotes)
	("C-M-c \"" . wrap-with-double-quotes)
	("C-M-c _" . wrap-with-underscores)
	("C-M-c `" . wrap-with-back-quotes)))

(provide 'berceuse-smartparens)

;;; berceuse-smartparens.el ends here
