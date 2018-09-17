;;; berceuse-csv.el --- csv editing settings with csv-mode and csv-nav

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; csv editing settings with csv-mode and csv-nav

;;; Code:

(berceuse-require-packages '(csv-mode csv-nav))
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)
(setq csv-separators '("," ";" "|" " "))

(provide 'berceuse-csv)

;;; berceuse-csv.el ends here
