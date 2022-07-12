;;; berceuse-ido.el --- Configurations for ido together with smex.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 17 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for ivy-mode, I also use coounsel, which depends on swiper

;;; Code:

(berceuse-require-package 'smex)

(use-package ido
  :custom (ido-mode 1)
  :config
  (setq ido-enable-prefix nil
	ido-enable-flex-matching t
	ido-create-new-buffer 'always
	ido-use-filename-at-point 'guess
	ido-max-prospects 10
	ido-save-directory-list-file (expand-file-name "ido.hist" berceuse-savefile-dir)
	ido-default-file-method 'selected-window
	ido-auto-merge-work-directories-length -1))
(use-package smex
  :config
  (progn
    (setq smex-save-file (expand-file-name ".smex-items" berceuse-savefile-dir))
    (smex-initialize))
  :bind
  ("M-x" . smex))

(provide 'berceuse-ido)

;;; berceuse-ido.el ends here
