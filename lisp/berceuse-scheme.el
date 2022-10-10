;;; berceuse-scheme.el --- Configurations for scheme programming

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 9 Oct 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for scheme programming, I use geiser with chez-scheme or guile

;;; Code:

(when (executable-find "petite")
  (berceuse-require-package 'geiser-chez)
  (use-package geiser-chez
  :init
  (setq scheme-program-name "petite"
	geiser-active-implementations '(chez)
	geiser-chez-binary "petite"
	geiser-mode-start-repl-p t
	geiser-repl-history-filename (expand-file-name "geiser-history" berceuse-savefile-dir))))

(when (executable-find "guile")
  (berceuse-require-package 'geiser-guile)
  (use-package geiser-guile
  :init
  (setq scheme-program-name "guile"
	geiser-active-implementations '(guile)
	geiser-chez-binary "guile"
	geiser-mode-start-repl-p t
	geiser-repl-history-filename (expand-file-name "geiser-history" berceuse-savefile-dir))))

(provide 'berceuse-scheme)

;;; berceuse-scheme.el ends here
