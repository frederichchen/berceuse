;;; berceuse-yasnippet.el --- Configurations for yasnippet

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 9 Oct 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for yasnippet, I changed the hotkey of yas-expand to C-<tab>

;;; Code:

(berceuse-require-packages '(yasnippet yasnippet-snippets))

(use-package yasnippet
  :hook
  (after-init . yas-global-mode)
  :bind
  (:map yas-minor-mode-map ("C-<tab>" . yas-expand)))

(use-package yasnippet-snippets
  :after yasnippet
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/personal/snippets"))

(provide 'berceuse-yasnippet)

;;; berceuse-yasnippet.el ends here
