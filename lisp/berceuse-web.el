;;; berceuse-web.el --- Configurations for web development

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; Configurations for web development, I use web-mode, rainbow-mode, sass-mode, scss-mode, css-eldoc and emmet-mode.

;; Rainbow mode for css color.
(berceuse-require-packages '(rainbow-mode sass-mode scss-mode css-eldoc emmet-mode web-mode))
(dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook web-mode-hook))
  (add-hook hook 'rainbow-mode))

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
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

;; Emmet Mode Configurations
(require 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(provide 'berceuse-web)

;;; berceuse-web.el ends here
