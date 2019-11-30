;;; berceuse-web.el --- Configurations for web development

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Configurations for web development, I use web-mode, rainbow-mode, sass-mode, scss-mode, css-eldoc and emmet-mode.

;;; Code:

(berceuse-require-packages '(sass-mode scss-mode css-eldoc emmet-mode web-mode))

;; SASS and SCSS
(require 'sass-mode)
(require 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq-default scss-compile-at-save nil)

;; Use eldoc for syntax hints
(require 'css-eldoc)
(autoload 'turn-on-css-eldoc "css-eldoc")
(add-hook 'css-mode-hook 'turn-on-css-eldoc)

;; web-mode configurations
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

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

;; Emmet Mode Configurations
(require 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(provide 'berceuse-web)

;;; berceuse-web.el ends here
