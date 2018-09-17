;;; berceuse-latex.el --- Configurations for latex editing

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Basic configurations for latex editing, I use auctex, cdlatex and smartparens-latex

;;; Code:

(berceuse-require-packages '(auctex cdlatex))
(require 'smartparens-latex)

(setq-default TeX-engine 'xetex)
(setq TeX-view-program-selection
      '((output-dvi "DVI Viewer")
        (output-pdf "PDF Viewer")
        (output-html "Google Chrome")))
(setq TeX-view-program-list
      '(("DVI Viewer" "xdvi %o")
        ("PDF Viewer" "evince %o")
        ("Google Chrome" "google-chrome %o")))


(eval-after-load "company"
  '(progn
     (berceuse-require-package 'company-auctex)
     (company-auctex-init)))

(add-hook 'LaTeX-mode-hook
	  (lambda()
	    (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
	    (setq TeX-command-default "XeLaTeX")
	    (setq TeX-save-querynil t)
	    (setq TeX-show-compilation t)
	    ))

(provide 'berceuse-latex)

;;; berceuse-latex.el ends here
