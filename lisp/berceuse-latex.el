;;; berceuse-latex.el --- Configurations for latex editing

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 17 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for latex editing, I use auctex, cdlatex and smartparens-latex

;;; Code:

(berceuse-require-packages '(auctex cdlatex company-auctex))

(use-package tex
  :ensure auctex
  :requires smartparens-latex
  :config
  (setq-default TeX-engine 'xetex)
  (setq TeX-PDF-mode t)
  (setq latex-run-command "xelatex")
  (setq LaTeX-command "latex --synctex=1")
  (company-auctex-init)
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t)))
 
(provide 'berceuse-latex)

;;; berceuse-latex.el ends here
