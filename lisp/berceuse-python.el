;;; berceuse-python.el --- Configurations for python programming

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Basic configurations for python programming with anaconda, yapf etc.

;;; Code:

(berceuse-require-packages '(anaconda-mode py-yapf))
(when (boundp 'company-backends)
  (berceuse-require-package 'company-anaconda)
  (add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

;; Initially Use python3 as python-shell-interpreter.
;; After that, we can use ipython by commenting the following statement and uncommenting the three lines below.
(setq python-shell-interpreter "python3")

;; Avoid weird output for ipython when executing run-python command
;(defvar ipython-path (or (locate-file "ipython" exec-path) (locate-file "ipython3" exec-path)))
;(setq python-shell-interpreter ipython-path
      ;python-shell-interpreter-args "--simple-prompt -i")

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

(provide 'berceuse-python)

;;; berceuse-python.el ends here
