;;; berceuse-editor.el --- Set some options of the editor for better experiences.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; This file simply set some options of the editor for better experiences.

;;; Code:

;; Mouse avoid the cursor
(mouse-avoidance-mode 'animate)
(setq transient-mark-mode t)

;; Set the default tab-width and no backup file
(setq make-backup-files nil)
(setq tab-width 4)

;; Set coding system
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;; apply builtin windmove to use shift + arrow keys to switch between visible buffers
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; save recent files
(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" berceuse-savefile-dir)
      recentf-max-saved-items 100
      recentf-max-menu-items 10
      ;; disable recentf-cleanup on Emacs start, because it can cause
      ;; problems with remote files
      recentf-auto-cleanup 'never)
(recentf-mode +1)

;; Configurations for builtin hippie-expand
(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; Configuration for builtin eldoc-mode
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Configuration for builtin dired: always delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; abbrev config
(add-hook 'text-mode-hook 'abbrev-mode)

;; make a shell script executable automatically on save
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

(require 'berceuse-smartparens)
(require 'berceuse-flycheck)
(require 'berceuse-projectile)
(require 'berceuse-whitespace)

(provide 'berceuse-editor)

;;; berceuse-editor.el ends here
