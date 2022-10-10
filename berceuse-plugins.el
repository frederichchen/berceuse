;;; berceuse-plugins.el --- Choose the plugins you need

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 14 July 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d

;;; Commentary:

;; Please uncomment the plugins you'd like to use and restart Emacs afterwards.
;; Once restarted, Emacs will download corresponding packages from melpa.

;;; Code:

;;(require 'berceuse-ido) ;; Super charges Emacs completion for C-x C-f and more
(require 'berceuse-ivy) ;; A mighty modern alternative to ido
(require 'berceuse-company) ;; An auto complete framework, alternative to auto-complete
(require 'berceuse-yasnippet)

;; (require 'berceuse-csv)  ;; csv editing settings with csv-mode and csv-nav

;;; Programming languages support
;; (require 'berceuse-coffee)
(require 'berceuse-cperl) ;; Configurations for C & Perl
(require 'berceuse-elisp)
;; (require 'berceuse-javascript)
;; (require 'berceuse-julia)
;; (require 'berceuse-latex)  ;; Once enabled, you have to edit the berceuse-latex.el file in the list directory.
(require 'berceuse-org) ;; Org-mode helps you keep TODO lists, notes and more
;; (require 'berceuse-python) ;; Basic python programming configuration with anaconda-mode
(require 'berceuse-python-eglot)  ;; If you want to use eglot for python, you must install the python-lsp-server first
;; (require 'berceuse-ruby)  ;; Basic ruby programming configuration
;; (require 'berceuse-ruby-eglot)  ;; If you want to use eglot for ruby, you must install solargraph gem first
;; (require 'berceuse-scheme) ;; Configurations for scheme programming, you must edit berceuse-scheme.el to customize your scheme intepreter.
(require 'berceuse-web) ;; Configurations for web development including css and emmet


;;; berceuse-plugins.el ends here
