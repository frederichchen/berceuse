;;; berceuse-packages.el --- package management

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 17 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

;;; Commentary:

;; This file is in charge of some customizations of Berceuse

;;; Code:

(defcustom berceuse-package-archives-alist
  '((melpa    . (("gnu"    . "http://elpa.gnu.org/packages/")
                 ("nongnu" . "http://elpa.nongnu.org/nongnu/")
                 ("org"    . "https://orgmode.org/elpa/")
                 ("melpa"  . "http://melpa.org/packages/")))
    (tencent .  (("gnu"    . "http://mirrors.cloud.tencent.com/elpa/gnu/")
                 ("nongnu" . "http://mirrors.cloud.tencent.com/elpa/nongnu/")
                 ("org"    . "http://mirrors.cloud.tencent.com/elpa/org/")
                 ("melpa"  . "http://mirrors.cloud.tencent.com/elpa/melpa/")))
    (bfsu     . (("gnu"    . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
                 ("nongnu" . "http://mirrors.bfsu.edu.cn/elpa/nongnu/")
                 ("org"    . "https://mirrors.bfsu.edu.cn/elpa/org/")
                 ("melpa"  . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))
    (netease  . (("gnu"    . "http://mirrors.163.com/elpa/gnu/")
                 ("nongnu" . "http://mirrors.163.com/elpa/nongnu/")
                 ("org"    . "http://mirrors.163.com/elpa/org/")
                 ("melpa"  . "http://mirrors.163.com/elpa/melpa/")))
    (tuna     . (("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                 ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                 ("org"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                 ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
    (ustc     . (("gnu"    . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                 ("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")
                 ("org"    . "http://mirrors.ustc.edu.cn/elpa/org/")
                 ("melpa"  . "http://mirrors.ustc.edu.cn/elpa/melpa/"))))
  "A list of the package archives."
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
