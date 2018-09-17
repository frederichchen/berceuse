;;; berceuse-whitespace.el --- Use whitespace-cleanup-mode to clean the whitespaces.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 18 Aug 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; This file use whitespace-cleanup-mode to clean the whitespaces intelligently.

;;; Code:

(require 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)
(diminish 'whitespace-cleanup-mode)

(provide 'berceuse-whitespace)

;;; berceuse-whitespace.el ends here
