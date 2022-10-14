;;; berceuse-python.el --- Configurations for python programming with Anaconda

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 9 Oct 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Basic configurations for python programming with anaconda, yapf etc.

;;; Code:

(berceuse-require-packages '(anaconda-mode company-anaconda python-black))

(use-package python
  :hook
  (python-mode . anaconda-mode)
  (python-mode . anaconda-eldoc-mode)
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

(provide 'berceuse-python)

;;; berceuse-python.el ends here
