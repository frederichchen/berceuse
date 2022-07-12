;;; berceuse-javascript.el --- Configurations for javascript programming

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 17 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Configurations for javascript editing, including js2-mode and json-mode

;;; Code:


(berceuse-require-packages '(js2-mode json-mode))

(use-package js2-mode
  :hook (js2-mode js2-imenu-extras-mode)
  :config
  (progn
    (setq-default js2-basic-offset 2
		  js2-bounce-indent-p nil
		  js2-mode-show-parse-errors nil
		  js2-mode-show-strict-warnings nil)
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
    (add-to-list 'auto-mode-alist '("\\.pac\\'" . js2-mode))))

(provide 'berceuse-javascript)

;;; berceuse-javascript.el ends here
