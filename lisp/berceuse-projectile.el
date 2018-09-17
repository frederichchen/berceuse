;;; berceuse-projectile.el --- Configurations for projectile, which depends on epl and pkg-info

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Basic configurations for projectile

;;; Code:

(require 'projectile)
(setq projectile-cache-file (expand-file-name  "projectile.cache" berceuse-savefile-dir))
(add-hook 'after-init-hook 'projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "<f5>") 'projectile-command-map)

(provide 'berceuse-projectile)

;;; berceuse-projectile.el ends here
