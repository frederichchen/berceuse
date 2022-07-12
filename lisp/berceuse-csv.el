;;; berceuse-csv.el --- csv editing settings with csv-mode and csv-nav

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 21 Feb 2022
;; Berceuse uses plenty of codes from
;; Prelude(https://github.com/bbatsov/prelude)
;; Steve Purcell's Emacs configuration(https://github.com/purcell/emacs.d)
;; Seagle0128's Emacs configuration(https://github.com/seagle0128/.emacs.d)

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
