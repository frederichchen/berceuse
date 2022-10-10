;;; berceuse-ruby-eglot.el --- Configurations for ruby programming with eglot

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 9 Oct 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for ruby programming language with eglot
;; Prerequisite: you must install solargraph e.g gem install --no-user-install solargraph

;;; Code:

(berceuse-require-packages '(eglot rspec-mode yaml-mode slim-mode haml-mode))

(use-package ruby-mode
   :hook
   (ruby-mode . eglot-ensure))

(use-package inf-ruby
  :hook ((ruby-mode . inf-ruby-minor-mode)
	 (compilation-filter . inf-ruby-auto-enter)))

(use-package rspec-mode
  :diminish
  :commands rspec-install-snippets
  :hook (dired-mode . rspec-dired-mode)
  :config (with-eval-after-load 'yasnippet
	    (rspec-install-snippets)))

(use-package yaml-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.yml\\.erb\\'" . yaml-mode)))

(use-package haml-mode
  :init
  (setq indent-tabs-mode nil)
  :bind
  (:map haml-mode-map ("\C-m" . newline-and-indent)))


(provide 'berceuse-ruby-eglot)

;;; berceuse-ruby-eglot.el ends here
