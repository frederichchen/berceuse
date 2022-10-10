;;; berceuse-whitespace.el --- Use whitespace-cleanup-mode to clean the whitespaces.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 9 Oct 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; This file use whitespace-cleanup-mode to clean the whitespaces intelligently.

;;; Code:

(use-package whitespace-cleanup-mode
  :diminish
  :hook (after-init . global-whitespace-cleanup-mode))

(provide 'berceuse-whitespace)

;;; berceuse-whitespace.el ends here
