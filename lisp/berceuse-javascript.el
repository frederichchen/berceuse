;;; berceuse-javascript.el --- Configurations for javascript programming

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Configurations for javascript editing, including js2-mode and json-mode

;;; Code:


(berceuse-require-packages '(js2-mode json-mode))
(require 'js2-mode)
(require 'js2-imenu-extras)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'" . js2-mode))
(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)

;; Change some defaults: customize them to override
(setq-default js2-basic-offset 2
              js2-bounce-indent-p nil
              js2-mode-show-parse-errors nil
              js2-mode-show-strict-warnings nil)

(provide 'berceuse-javascript)

;;; berceuse-javascript.el ends here
