;;; berceuse-funcs.el --- some frequently used functions

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 20 May 2020
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; This file is in charge of automatic package installation of Berceuse

;;; Code:

(require 'berceuse-custom)

;; Dos2Unix/Unix2Dos
(defun dos2unix ()
  "Convert the current buffer to UNIX file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix nil))

(defun unix2dos ()
  "Convert the current buffer to DOS file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos nil))

;; Reload configurations
(defun berceuse-reload-init-file ()
  "Reload Emacs configurations."
  (interactive)
  (load user-init-file))
(global-set-key (kbd "C-c C-l") #'berceuse-reload-init-file)

(defun berceuse-set-variable (variable value &optional no-save)
  "Set the VARIABLE to VALUE, and return VALUE.

Save to `custom-file' if NO-SAVE is nil."
  (customize-set-variable variable value)
  (when (and (not no-save)
	     (file-writable-p custom-file))
    (with-temp-buffer
      (insert-file-contents custom-file)
      (goto-char (point-min))
      (while (re-search-forward
	      (format "^[\t ]*[;]*[\t ]*(setq %s .*)" variable)
	      nil t)
	(replace-match (format "(setq %s '%s)" variable value) nil nil))
      (write-region nil nil custom-file)
      (message "Saved %s (%s) to %s" variable value custom-file))))


(defun berceuse-set-package-archives (archives &optional refresh async no-save)
  "Set the package ARCHIVES (ELPA).

REFRESH is non-nil, will refresh archive contents.
ASYNC specifies whether to perform the downloads in the background.
Save to `custom-file' if NO-SAVE is nil."
  (interactive
   (list
    (intern (completing-read "Select package archives: "
			     (mapcar #'car berceuse-package-archives-alist)))))
  ;; Set option
  (berceuse-set-variable 'berceuse-package-archives archives no-save)
  ;; Refresh if need
  (and refresh (package-refresh-contents async))
  (message "Set package archives to `%s'" archives))


(defun berceuse-test-package-archives ()
  "Test connection speed of all package archives and display on chart.

Not displaying the chart if NO-CHART is non-nil.
Return the fastest package archive."
  (interactive)
  (let* ((urls (mapcar
		(lambda (url)
		  (concat url "archive-contents"))
		(mapcar #'cdr
			(mapcar #'cadr
				(mapcar #'cdr
					berceuse-package-archives-alist)))))
	 (durations (mapcar
		     (lambda (url)
		       (let ((start (current-time)))
			 (message "Fetching %s..." url)
			 (cond ((executable-find "curl")
				(call-process "curl" nil nil nil "--max-time" "10" url))
			       ((executable-find "wget")
				(call-process "wget" nil nil nil "--timeout=10" url))
			       (t (user-error "Warning! curl or wget is not found")))
			 (float-time (time-subtract (current-time) start))))
		     urls))
	 (fastest (car (nth (cl-position (apply #'min durations) durations)
			    berceuse-package-archives-alist))))

    (message "The fastest package archive is %s" fastest)

    ;; Return the fastest
    fastest))


(defun berceuse-load-theme (theme &optional no-save)
  "Load color THEME, Save to `custom-file' if NO-SAVE is nil."
  (interactive
   (list (intern (completing-read
		  "Load theme: "
		  `(,@(mapcar #'car berceuse-theme-alist))))))
  ;; Set option
  (berceuse-set-variable 'berceuse-theme theme no-save)
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme (or (alist-get theme berceuse-theme-alist) theme) t))

(provide 'berceuse-funcs)

;;; berceuse-funcs.el ends here
