;;; berceuse-ivy.el --- Configurations for ivy-mode, together with counsel.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 17 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for ivy-mode, I also use coounsel, which depends on swiper

;;; Code:

;;(berceuse-require-packages '(ivy swiper counsel))

(use-package swiper)
(use-package ivy
  :hook (after-init . ivy-mode)
  :custom ((projectile-completion-system 'ivy))
  :config
  (setq ivy-use-virtual-buffers t
	enable-recursive-minibuffers t))
(use-package counsel
  :bind
  ("C-s" . swiper)
  ("C-c C-r" . ivy-resume)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  ("C-c g" . counsel-git)
  ("C-c j" . counsel-git-grep)
  ("C-c k" . counsel-ag)
  ("C-x l" . counsel-locate)
  ("C-S-o" . counsel-rhythmbox)
  (:map read-expression-map ("C-r" . counsel-expression-history)))

(provide 'berceuse-ivy)

;;; berceuse-ivy.el ends here
