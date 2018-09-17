;;; berceuse-scheme.el --- Configurations for scheme programming

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Basic configurations for scheme programming, I use geiser together with chez-scheme.

;;; Code:


(berceuse-require-package 'geiser)

(require 'geiser)

;; you must set your scheme program first !!
(setq scheme-program-name "petite")
(setq geiser-active-implementations '(chez))
(setq geiser-chez-binary "petite")

;; geiser replies on a REPL to provide autodoc and completion
(setq geiser-mode-start-repl-p t)

;; keep the home clean
(setq geiser-repl-history-filename
      (expand-file-name "geiser-history" berceuse-savefile-dir))

(provide 'berceuse-scheme)

;;; berceuse-scheme.el ends here
