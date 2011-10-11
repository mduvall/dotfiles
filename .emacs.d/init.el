;; Package management
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; File paths/management
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(add-to-list 'load-path (concat dotfiles-dir "elpa-other"))
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'load-path (concat dotfiles-dir "/themes"))
(load "~/.emacs.d/custom/file.el")
(load "~/.emacs.d/custom/keys.el")
(load "~/.emacs.d/custom/lang.el")
(load "~/.emacs.d/custom/window.el")

(require 'magit)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(set-default-font "-apple-fixed_7x14-medium-r-normal--14-140-72-72-m-140-iso10646-1")
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#fcf4dc" :foreground "#52676f" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :family "apple-mensch")))))
