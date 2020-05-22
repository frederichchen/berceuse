;;; init.el --- Bootstrap Configuration File

;; Author: Frederich Chen <frederichchen@hotmail.com>
;; Created: 24 July 2018
;; Berceuse uses plenty of codes from Prelude(https://github.com/bbatsov/prelude) and
;; Steve Purcell's Emacs config(https://github.com/purcell/emacs.d) . Thanks, Steve & Bozhidar!

;;; Commentary:

;; This file simply set up the default load-path of Berceuse and require various plugins of Berceuse.
;; In the "lisp" subdirectory there are various init-xxx files for the plugins.
;; In the "plugins" subdirectory there are the plugin files, most of which were fetched through melpa.
;; In the "lisp" subdirectory there are files like berceuse-xxx.el to configure the corresponding plugin.
;; In the "peronsal" subdirectory lies your peronsal configuration file.
;; In the "savefile" subdirectory lies the automatically generated files.

;;; Code:

;; Check the version of GNU Emacs
(when (version< emacs-version "24.4")
  (message "Your Emacs is too old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; Start the server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Always load newest byte code
(setq load-prefer-newer t)

;; set a few directories
(defvar berceuse-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Berceuse distribution.")
(defvar berceuse-core-dir (expand-file-name "core" berceuse-dir)
  "The home of Berceuse's core functionality.")
(defvar berceuse-lisp-dir (expand-file-name  "lisp" berceuse-dir)
  "This directory contains lots of berceuse-xxx.el files to customize the plugins.")
(defvar berceuse-personal-dir (expand-file-name "personal" berceuse-dir)
  "This directory is for your personal configuration.")
(defvar berceuse-savefile-dir (expand-file-name "savefile" berceuse-dir)
  "This folder stores all the automatically generated save/history-files.")
(defvar berceuse-third-party-dir (expand-file-name "site-lisp" berceuse-dir)
  "This folder stores all 3rd-party plugins.")
(defvar berceuse-plugins-file (expand-file-name "berceuse-plugins.el" berceuse-dir)
  "This files specifies a list of plugins that will be loaded by Berceuse.  You can uncomment the lines to load the corresponding packages.")

(unless (file-exists-p berceuse-savefile-dir)
  (make-directory berceuse-savefile-dir))

;; set custom file path
(defconst custom-file (expand-file-name "custom.el" berceuse-dir))
(defconst berceuse-custom-example-file (expand-file-name "custom-example.el" berceuse-dir))

;; add Berceuse's directories to Emacs's load-path
(add-to-list 'load-path berceuse-core-dir)
(add-to-list 'load-path berceuse-lisp-dir)
(add-to-list 'load-path berceuse-third-party-dir)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; the core stuff
(require 'berceuse-packages)
(require 'berceuse-face)
(require 'berceuse-editor)

;; load the user specified plugins
(if (file-exists-p berceuse-plugins-file)
    (load berceuse-plugins-file)
  (message "Missing plugin file %s" berceuse-plugins-file))

;; load personal settings
(when (file-exists-p berceuse-personal-dir)
  (message "Loading personal configuration files in %s..." berceuse-personal-dir)
  (mapc 'load (directory-files berceuse-personal-dir 't "^[^#\.].*el$")))


;;; init.el ends here
