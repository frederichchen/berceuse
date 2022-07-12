;;; berceuse-coffee.el --- Configurations for CoffeeScript Programmingx

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 21 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Configurations for CoffeeScript Programming with coffee-mode

;;; Code:

(berceuse-require-package 'coffee-mode)

(use-package coffee-mode
  :config
  (progn
    (setq coffee-tab-width 2)
    (add-to-list 'coffee-args-compile "--no-header")))

(provide 'berceuse-coffee)

;;; berceuse-coffee.el ends here
