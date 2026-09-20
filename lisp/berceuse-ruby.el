;; -*- lexical-binding: t; -*-
;;; berceuse-ruby.el --- Configurations for ruby programming

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 9 Oct 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for ruby programming, I use inf-ruby, rspec-mode, haml-mode, slim-mode etc.
;; Prerequisite: you must install two gems pry and pry-doc e.g gem install --no-user-install pry pry-doc
;; In order to use the full features, you must use C-c C-s to start irb, then M-x robe-start

;;; Code:

(berceuse-require-packages '(robe rspec-mode yaml-mode slim-mode haml-mode))

(use-package ruby-mode
  :hook
  (ruby-mode . robe-mode)
  :init
  (when (boundp 'company-backends)
    (add-to-list 'company-backends 'company-robe)))

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


(provide 'berceuse-ruby)

;;; berceuse-ruby.el ends here
