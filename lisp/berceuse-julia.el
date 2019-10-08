;;; berceuse-julia.el --- Configurations for julia programming

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 8 October 2019
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Basic configurations for julia programming with julia-mode, julia-shell etc.

;;; Code:

(berceuse-require-packages '(julia-mode julia-repl))

(require 'julia-mode)
(require 'julia-repl)

(add-hook 'julia-mode-hook 'julia-repl-mode)

(provide 'berceuse-julia)

;;; berceuse-julia.el ends here
