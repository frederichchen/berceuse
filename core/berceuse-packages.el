;;; berceuse-packages.el --- package management

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; This file is in charge of automatic package installation of Berceuse

;;; Code:

(require 'package)

(defvar switch-melpa-mirror nil
  "Whether to switch to the melpa mirror in China.")
(if (and (not noninteractive)
	 (not (file-exists-p (file-truename "~/.emacs.d/elpa")))
	 (y-or-n-p "Switch to faster package repositories in China temporarily? "))
    (setq switch-melpa-mirror t))

(if switch-melpa-mirror
     (setq package-archives
      '(("gnu"          . "https://mirrors.163.com/elpa/gnu/")
        ("melpa"        . "https://mirrors.163.com/elpa/melpa/")
        ("melpa-stable" . "https://mirrors.163.com/elpa/melpa-stable/")))
  (setq package-archives
	'(("gnu"          . "https://elpa.gnu.org/packages/")
	  ("melpa"        . "https://melpa.org/packages/")
	  ("melpa-stable" . "https://stable.melpa.org/packages/"))))


;; set package-user-dir to be relative to Berceuse install path
(setq package-user-dir (expand-file-name "plugins" berceuse-dir))
(package-initialize)

(defvar berceuse-packages
  '(beacon
    dash-functional
    diminish
    flycheck
    flycheck-color-mode-line
    magit
    monokai-theme
    org
    projectile
    smartparens
    which-key
    whitespace-cleanup-mode
    )
  "A list of prerequisite pacakges.")

(defun berceuse-packages-installed-p ()
  "Check if all packages in `berceuse-packages' are installed."
  (catch 'all-installed
    (dolist (pack berceuse-packages)
      (when (not (package-installed-p pack))
	(throw 'all-installed nil)))
    t))

(defun berceuse-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package berceuse-packages)
    (add-to-list 'berceuse-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun berceuse-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'berceuse-require-package packages))

(defun berceuse-install-packages ()
  "Install all packages listed in `berceuse-packages'."
  (unless (berceuse-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Berceuse is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (berceuse-require-packages berceuse-packages)))

;; run package installation
(berceuse-install-packages)


(defmacro berceuse-auto-install (extension package mode)
  "When file with EXTENSION is opened triggers auto-install of PACKAGE.
PACKAGE is installed only if not already present.  The file is opened in MODE."
  `(add-to-list 'auto-mode-alist
                `(,extension . (lambda ()
                                 (unless (package-installed-p ',package)
                                   (package-install ',package))
                                 (,mode)))))

(defvar berceuse-auto-install-alist
  '(("\\.clj\\'" clojure-mode clojure-mode)
    ("\\.cmake\\'" cmake-mode cmake-mode)
    ("CMakeLists\\.txt\\'" cmake-mode cmake-mode)
    ("\\.coffee\\'" coffee-mode coffee-mode)
    ("\\.css\\'" css-mode css-mode)
    ("\\.csv\\'" csv-mode csv-mode)
    ("Cask" cask-mode cask-mode)
    ("\\.d\\'" d-mode d-mode)
    ("\\.dart\\'" dart-mode dart-mode)
    ("\\.elm\\'" elm-mode elm-mode)
    ("\\.ex\\'" elixir-mode elixir-mode)
    ("\\.exs\\'" elixir-mode elixir-mode)
    ("\\.elixir\\'" elixir-mode elixir-mode)
    ("\\.erl\\'" erlang erlang-mode)
    ("\\.feature\\'" feature-mode feature-mode)
    ("\\.go\\'" go-mode go-mode)
    ("\\.graphql\\'" graphql-mode graphql-mode)
    ("\\.groovy\\'" groovy-mode groovy-mode)
    ("\\.haml\\'" haml-mode haml-mode)
    ("\\.hs\\'" haskell-mode haskell-mode)
    ("\\.json\\'" json-mode json-mode)
    ("\\.kt\\'" kotlin-mode kotlin-mode)
    ("\\.kv\\'" kivy-mode kivy-mode)
    ("\\.latex\\'" auctex LaTeX-mode)
    ("\\.less\\'" less-css-mode less-css-mode)
    ("\\.lua\\'" lua-mode lua-mode)
    ("\\.markdown\\'" markdown-mode markdown-mode)
    ("\\.md\\'" markdown-mode markdown-mode)
    ("\\.ml\\'" tuareg tuareg-mode)
    ("\\.pp\\'" puppet-mode puppet-mode)
    ("\\.php\\'" php-mode php-mode)
    ("\\.proto\\'" protobuf-mode protobuf-mode)
    ("\\.pyd\\'" cython-mode cython-mode)
    ("\\.pyi\\'" cython-mode cython-mode)
    ("\\.pyx\\'" cython-mode cython-mode)
    ("\\.rs\\'" rust-mode rust-mode)
    ("\\.sass\\'" sass-mode sass-mode)
    ("\\.scala\\'" scala-mode scala-mode)
    ("\\.scss\\'" scss-mode scss-mode)
    ("\\.slim\\'" slim-mode slim-mode)
    ("\\.styl\\'" stylus-mode stylus-mode)
    ("\\.swift\\'" swift-mode swift-mode)
    ("\\.textile\\'" textile-mode textile-mode)
    ("\\.thrift\\'" thrift thrift-mode)
    ("\\.yml\\'" yaml-mode yaml-mode)
    ("\\.yaml\\'" yaml-mode yaml-mode)
    ("Dockerfile\\'" dockerfile-mode dockerfile-mode)))

;; markdown-mode doesn't have autoloads for the auto-mode-alist
;; so we add them manually if it's already installed
(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode)))

;; build auto-install mappings
(mapc
 (lambda (entry)
   (let ((extension (car entry))
         (package (cadr entry))
         (mode (cadr (cdr entry))))
     (unless (package-installed-p package)
       (berceuse-auto-install extension package mode))))
 berceuse-auto-install-alist)

(provide 'berceuse-packages)

;;; berceuse-packages.el ends here
