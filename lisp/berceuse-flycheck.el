;;; berceuse-flycheck.el --- Configuration for flycheck, I also use flycheck-color-mode-line for better result.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 17 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for flycheck and flycheck-color-mode-line

;;; Code:

(use-package flycheck
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

(use-package flycheck-color-mode-line
  :requires flycheck
  :hook
  (flycheck-mode-hook . flycheck-color-mode-line-mode))


(provide 'berceuse-flycheck)

;;; berceuse-flycheck.el ends here
