;; To reload the changes to this file:
;; M-x eval-buffer
;; See *Messages* buffer for all the Emacs logs


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'meta) ;; works in GUI emacs
  ;;(setq mac-option-modifier 'super)
)

(global-unset-key [(control z)])  ;; Unbind Pesky Sleep Button
(global-unset-key [(control x)(control z)])

;; (setq visible-bell t) ;; disable beep
(setq ring-bell-function 'ignore) ;; turn off alarms completely

(setq confirm-kill-emacs 'yes-or-no-p)
(setq make-backup-files nil)
(setq column-number-mode t)

(setq show-paren-mode 1)
(setq show-paren-delay 0)    ;; for matching parantheses
(global-linum-mode t)        ;; display line number on the right margin
(which-function-mode 1)      ;; display current function name

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; two lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq scroll-step 2) ;; keyboard scroll two lines at a time

(tool-bar-mode -1)  ;; disable toolbar from GUI Emacs

;; Buffers
(ido-mode 1)                 ;; C-x b will show the list of candidates
(setq ido-separator "\n")    ;; show items vertically

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
 '(package-selected-packages (quote (lua-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
