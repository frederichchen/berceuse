;;; berceuse-web.el --- Configurations for web development

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 9 Oct 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; Configurations for web development, I use web-mode, rainbow-mode, sass-mode, scss-mode, css-eldoc and emmet-mode.

;;; Code:

(berceuse-require-packages '(sass-mode scss-mode web-mode))

;; SASS and SCSS
(require 'sass-mode)
(use-package scss-mode
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
    (setq-default scss-compile-at-save nil)))

;; web-mode configurations
(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
	 ("\\.phtml\\'" . web-mode)
         ("\\.jinja2?\\'" . web-mode)
         ("\\.jinja\\'" . web-mode)
         ("\\.tpl\\'" . web-mode)
	 ("\\.jsp\\'" . web-mode)
	 ("\\.as[cp]x\\'" . web-mode)
	 ("\\.blade\\.php\\'" . web-mode)
	 ("\\.erb\\'" . web-mode))
	 
  :config
  (setq web-mode-engines-alist
        '(("django" . "\\.html\\'")
          ("jinja2" . "\\.jinja2\\'")
          ("jinja2" . "\\.jinja\\'")
          ("jinja2" . "\\.tpl\\'")))
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2))


(provide 'berceuse-web)

;;; berceuse-web.el ends here
