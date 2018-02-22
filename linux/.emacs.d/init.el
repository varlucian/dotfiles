;; To reload the changes to this file:
;; M-x eval-buffer
;; See *Messages* buffer for all the Emacs logs

;; Melpa packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; manual packages
(add-to-list 'load-path "~/.emacs.d/manual_el")

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil) ;; works in GUI emacs
  ;;(setq mac-option-modifier 'super)
)

(global-unset-key [(control z)])  ;; Unbind Pesky Sleep Button
(global-unset-key [(control x)(control z)])

(setq visible-bell t) ;; disable beep

(setq confirm-kill-emacs 'yes-or-no-p)
(setq make-backup-files nil)
(setq column-number-mode t)
(setq show-paren-mode t)
(setq show-paren-delay 0)    ;; for matching parantheses
(global-linum-mode t)        ;; display line number on the right margin
(which-function-mode 1)      ;; display current function name
(setq-default indent-tabs-mode nil) ;; use spaces instead of tabs
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
;;(desktop-save-mode 1)        ;; save opened files when closing emacs

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; two lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq scroll-step 2) ;; keyboard scroll two lines at a time

(tool-bar-mode -1)  ;; disable toolbar from GUI Emacs

;; Buffers
(ido-mode 1)                 ;; C-x b will show the list of candidates
(setq ido-separator "\n")    ;; show items vertically
;; Open last 25 buffers with C-x C-r
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;;;;;;;;;; Python ;;;;;;;;;;
;;;; elpy
;;;; To enable, uncomment next 4 lines
;;(add-to-list 'package-archives
;;	                  '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;;(package-initialize)
;;(elpy-enable)

;;;; Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;;;; Autopep8
;;(require 'py-autopep8)
;;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;;;; PEP8
(setq python-check-command "pyflakes")

;; Jumping to definition (https://github.com/jacktasia/dumb-jump)
(dumb-jump-mode)
;; USAGE:
;; dumb-jump-go C-M g core functionality. Attempts to jump to the definition for the thing under point
;; dumb-jump-back C-M p jumps back to where you were when you jumped. These are chained so if you go down a rabbit hole you can get back out or where you want to be.
;; dumb-jump-quick-look C-M q like dumb-jump-go but shows tooltip with file, line, and context

(require 'pytest)

(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key "\C-ca" 'pytest-all)
	    (local-set-key "\C-cm" 'pytest-module)
	    (local-set-key "\C-c." 'pytest-one)
	    (local-set-key "\C-cd" 'pytest-directory)
	    (local-set-key "\C-cpa" 'pytest-pdb-all)
	    (local-set-key "\C-cpm" 'pytest-pdb-module)
	    (local-set-key "\C-cp." 'pytest-pdb-one)))

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files"
  (interactive)
  (let* ((list (buffer-list))
	 (buffer (car list)))
    (while buffer
      (when (buffer-file-name buffer)
	(set-buffer buffer)
	(revert-buffer t t t))
      (setq list (cdr list))
      (setq buffer (car list))))
    (message "Refreshing open files"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("4f5d7728980f8b1aaf0b60be0a0b2416fdc53949e661e3c6c063379964d1fe81" default)))
 '(menu-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 83 :width normal)))))


;; org mode
(setq org-todo-keywords
      '((sequence "TODO" "DONE" "N/A")))

(setq js-indent-level 4)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'multiple-cursors)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
