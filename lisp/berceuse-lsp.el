;;; berceuse-lsp.el --- lsp-mode configuration.

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 23 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Some basic configuration for lsp-mode

;;; Code:

(berceuse-require-packages '(lsp-mode lsp-ui lsp-ivy))

(use-package lsp-mode
  :bind-keymap
  ("C-c l" . lsp-command-map)   ; Use Ctrl+C l as the default "s l"
  :config
  (setq lsp-idle-delay 0.5
	lsp-enable-symbol-highlighting t
	lsp-enable-snippet nil
	lsp-pylsp-plugins-yapf-enabled t
	lsp-ui-sideline-enable t
	lsp-ui-doc-enable t
	lsp-ui-peek-enable t
	lsp-ui-peek-always-show t)
  :hook
  ((python-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom (lsp-ui-doc-position 'bottom)
  :config (setq lsp-ui-sideline-show-hover t
		lsp-ui-sideline-delay 0.5
		lsp-ui-doc-delay 5
		lsp-ui-sideline-ignore-duplicates t
		lsp-ui-doc-position 'bottom
		lsp-ui-doc-alignment 'frame
		lsp-ui-doc-header nil
		lsp-ui-doc-include-signature t
		lsp-ui-doc-use-childframe t)
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(provide 'berceuse-lsp)
;;; berceuse-lsp.el ends here
