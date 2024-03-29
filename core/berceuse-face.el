;;; berceuse-face.el --- Set the ui and theme of Emacs

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 16 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; This file simply set up the ui and theme of Emacs

;;; Code:

;; Disable the toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; disable startup screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(toggle-frame-maximized)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n" ";; Remember: The default hotkey for yasnippet has been changed to C+<tab> .\n\n"))
(setq display-time-day-and-date t)
(display-time)
(mouse-avoidance-mode 'animate)
(setq transient-mark-mode t)

;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; load the required theme
(berceuse-load-theme berceuse-theme t)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" "Emacs Berceuse - " (:eval (if (buffer-file-name)
					  (abbreviate-file-name (buffer-file-name))
					"%b"))))

;; show the cursor when moving after big movements in the window
(use-package beacon
  :diminish
  :custom (beacon-mode 1))

;; show available keybindings after you start typing
(use-package which-key
  :diminish
  :custom (which-key-mode 1))

;; use rainbow-delimiters to colorize parenthesis
(use-package rainbow-delimiters
  :diminish
  :hook
  (prog-mode-hook . rainbow-delimiters-mode))

(provide 'berceuse-face)

;;; berceuse-face.el ends here
