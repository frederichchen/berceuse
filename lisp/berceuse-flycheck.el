;;; berceuse-flycheck.el --- Configuration for flycheck, I also use flycheck-color-mode-line for better result.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Basic configurations for flycheck and flycheck-color-mode-line

;;; Code:

(require 'flycheck)
(require 'flycheck-color-mode-line)

(add-hook 'after-init-hook 'global-flycheck-mode)
(setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(provide 'berceuse-flycheck)

;;; berceuse-flycheck.el ends here
