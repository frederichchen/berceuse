;;; berceuse-dape.el --- Configurations of Debug Adapter Protocol for Emacs

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 19 Feburary 2024
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d

;;; Commentary:

;; Basic Configuration for dap plugin

;;; Code:

(when (version<= "29" emacs-version)
  (use-package dape
    :bind (("<f5>" . dape))
    ))

(provide 'berceuse-dape)

;;; berceuse-dape.el ends here
