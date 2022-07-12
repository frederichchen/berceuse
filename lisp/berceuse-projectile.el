;;; berceuse-projectile.el --- Configurations for projectile, which depends on epl and pkg-info

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 17 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for projectile

;;; Code:

(use-package projectile
  :init
  (setq projectile-cache-file (expand-file-name  "projectile.cache" berceuse-savefile-dir))
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(provide 'berceuse-projectile)

;;; berceuse-projectile.el ends here
