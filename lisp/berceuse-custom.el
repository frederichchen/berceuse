;;; berceuse-packages.el --- package management

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 18 May 2020
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; This file is in charge of some customizations of Berceuse

;;; Code:

(defcustom berceuse-package-archives-alist
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		      (not (gnutls-available-p))))
	 (proto (if no-ssl "http" "http")))
    `(,(cons 'melpa
	     `(,(cons "gnu"   (concat proto "://elpa.gnu.org/packages/"))
	       ,(cons "melpa" (concat proto "://melpa.org/packages/"))))
      ,(cons 'melpa-mirror
	     `(,(cons "gnu"   (concat proto "://elpa.gnu.org/packages/"))
	       ,(cons "melpa" (concat proto "://www.mirrorservice.org/sites/melpa.org/packages/"))))
      ,(cons 'emacs-china
	     `(,(cons "gnu"   (concat proto "://elpa.emacs-china.org/gnu/"))
	       ,(cons "melpa" (concat proto "://elpa.emacs-china.org/melpa/"))))
      ,(cons 'netease
	     `(,(cons "gnu"   (concat proto "://mirrors.163.com/elpa/gnu/"))
	       ,(cons "melpa" (concat proto "://mirrors.163.com/elpa/melpa/"))))
      ,(cons 'ustc
	     `(,(cons "gnu"   (concat proto "://mirrors.ustc.edu.cn/elpa/gnu/"))
	       ,(cons "melpa" (concat proto "://mirrors.ustc.edu.cn/elpa/melpa/"))))
      ,(cons 'tencent
	     `(,(cons "gnu"   (concat proto "://mirrors.cloud.tencent.com/elpa/gnu/"))
	       ,(cons "melpa" (concat proto "://mirrors.cloud.tencent.com/elpa/melpa/"))))
      ,(cons 'tuna
	     `(,(cons "gnu"   (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
	       ,(cons "melpa" (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))))
  "The package archives group list."
  :group 'berceuse
  :type '(alist :key-type (symbol :tag "Archive group name")
		:value-type (alist :key-type (string :tag "Archive name")
				   :value-type (string :tag "URL or directory name"))))

(defcustom berceuse-package-archives 'melpa
  "Set package archives from which to fetch."
  :group 'berceuse
  :set (lambda (symbol value)
	 (set symbol value)
	 (setq package-archives
	       (or (alist-get value berceuse-package-archives-alist)
		   (error "Unknown package archives: `%s'" value))))
  :type `(choice ,@(mapcar
		    (lambda (item)
		      (let ((name (car item)))
			(list 'const
			      :tag (capitalize (symbol-name name))
			      name)))
		    berceuse-package-archives-alist)))

(defcustom berceuse-theme-alist
  '((default  . doom-monokai-classic)
    (snazzy  .  doom-snazzydoom-monokai-classic)
    (onedark .  doom-one)
    (dark     . doom-dark+)
    (light    . doom-one-light)
    (day      . doom-solarized-light)
    (night    . doom-solarized-dark))
  "List of themes mapped to internal themes."
  :group 'berceuse
  :type '(alist :key-type (symbol :tag "Theme")
		:value-type (symbol :tag "Internal theme")))

(defcustom berceuse-theme 'default
  "The color theme."
  :group 'berceuse
  :type `(choice ,@(mapcar
		    (lambda (item)
		      (let ((name (car item)))
			(list 'const
			      :tag (capitalize (symbol-name name))
			      name)))
		    berceuse-theme-alist)
		 symbol))

(provide 'berceuse-custom)

;;; berceuse-custom.el ends here
