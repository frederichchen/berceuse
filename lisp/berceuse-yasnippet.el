;;; berceuse-yasnippet.el --- Configurations for yasnippet

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Basic configurations for yasnippet, I changed the hotkey of yas-expand to C-<tab>

;;; Code:

(berceuse-require-packages '(yasnippet yasnippet-snippets))

(use-package yasnippet
  :diminish
  :bind
  (:map yas-minor-mode-map ("C-<tab>" . yas-expand))
  :config
  (progn
    (add-to-list 'yas-snippet-dirs "~/.emacs.d/personal/snippets")
    (yas-global-mode 1)))

(provide 'berceuse-yasnippet)

;;; berceuse-yasnippet.el ends here
