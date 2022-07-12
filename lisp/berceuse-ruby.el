;;; berceuse-ruby.el --- Configurations for ruby programming

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Basic configurations for ruby programming, I use enh-ruby-mode, robe, haml-mode, slim-mode etc.

;;; Code:

(berceuse-require-packages '(enh-ruby-mode robe rspec-mode yaml-mode slim-mode haml-mode))
(when (boundp 'company-backends)
  (add-to-list 'company-backends 'company-robe))

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))

;; Below is optional, set the ruby program path if you use ruby installed by rvm.
;; (setq enh-ruby-program "Path/to/your/ruby/program")

(add-hook 'enh-ruby-mode-hook 'auto-complete-mode)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)

(add-hook 'haml-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; YAML
(add-to-list 'auto-mode-alist '("\\.yml\\.erb\\'" . yaml-mode))

;; slim-mode
(require 'slim-mode)

(provide 'berceuse-ruby)

;;; berceuse-ruby.el ends here
