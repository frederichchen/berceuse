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
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode)))
    (setq web-mode-markup-indent-offset 2
	  web-mode-css-indent-offset 2
	  web-mode-code-indent-offset 2
	  web-mode-style-padding 2
	  web-mode-script-padding 2
	  web-mode-enable-auto-pairing t
	  web-mode-enable-css-colorization t
	  web-mode-enable-current-element-highlight t
	  web-mode-enable-current-column-highlight t
	  web-mode-enable-css-colorization t)
    (setq web-mode-engines-alist
	  '(("jinja2"    . "\\.jinja2\\'")
	    ("django"    . "\\.html\\'")))
    (setq web-mode-enable-auto-pairing nil)
    (sp-with-modes '(web-mode)
      (sp-local-pair "%" "%"
		     :unless '(sp-in-string-p)
		     :post-handlers '(((lambda (&rest _ignored)
					 (just-one-space)
					 (save-excursion (insert " ")))
				       "SPC" "=" "#")))
      (sp-local-tag "%" "<% "  " %>")
      (sp-local-tag "=" "<%= " " %>")
      (sp-local-tag "#" "<%# " " %>")))


(provide 'berceuse-web)

;;; berceuse-web.el ends here
