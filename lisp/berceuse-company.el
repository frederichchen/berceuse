;;; berceuse-company.el --- Configurations for company-mode

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 17 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for company-mode

;;; Code:

(berceuse-require-package 'company)
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (progn
    (setq company-idle-delay 0.5)
    (setq company-show-quick-access t)
    (setq company-tooltip-limit 10)
    (setq company-minimum-prefix-length 2)
    (setq company-tooltip-align-annotations t)))

(provide 'berceuse-company)

;;; berceuse-company.el ends here
