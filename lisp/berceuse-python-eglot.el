;;; berceuse-python-eglot.el --- Configurations for python programming with eglot

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 9 Oct 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for python programming language with eglot
;; Prerequisite: you must install pylsp e.g pip install "python-lsp-server[all]"
;; It is recommended to set the venv folder to .venv or venv in order for pyvenv-auto to switch to your virtual environment

;;; Code:

(berceuse-require-packages '(eglot python-black pyvenv-auto))

(use-package python
  :hook
  (python-mode . eglot-ensure)
  :init
  (when (boundp 'company-backends)
    (add-to-list 'company-backends 'company-anaconda))
  (if (executable-find "ipython")
      (setq python-shell-interpreter "ipython"
	    python-shell-interpreter-args "-i --simple-prompt --InteractiveShell.display_page=True")
    (setq python-shell-interpreter "python")))

(use-package python-black
  :diminish python-black-on-save-mode
  :after python
  :hook (python-mode . python-black-on-save-mode))

(use-package pyvenv-auto
  :hook ((python-mode . pyvenv-auto-run)))

(provide 'berceuse-python-eglot)

;;; berceuse-python-eglot.el ends here

