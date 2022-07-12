;;; berceuse-julia.el --- Configurations for julia programming

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 17 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for julia programming with julia-mode, julia-shell etc.

;;; Code:

(berceuse-require-packages '(julia-mode julia-repl))

(use-package julia-mode
  :hook (julia-mode . julia-repl-mode))

(add-hook 'julia-mode-hook 'julia-repl-mode)

(provide 'berceuse-julia)

;;; berceuse-julia.el ends here
