;; All the shit that screams in terminal
(when window-system
  (progn (tool-bar-mode -1)
		 (toggle-scroll-bar -1))
  (add-to-list 'load-path "~/workspace/load/color-theme-6.6.0/")
  (load-file "~/.emacs.d/themes/color-theme-wombat.el")
  (require 'color-theme)
  (require 'color-theme-tangotango)
  (require 'color-theme-tango)
  (require 'color-theme-wombat)
  (require 'color-theme-solarized)
  (setq color-theme-is-global t)
  (set-fringe-mode '(2 . 0))
  (color-theme-solarized-dark))


;; Window management cuteness
(windmove-default-keybindings)
(require 'buffer-move)
(windmove-default-keybindings)

;; Aesthetics
(setq transient-mark-mode t)
(setq ring-bell-function 'ignore)
(show-paren-mode 1)
(setq inhibit-splash-screen t)
(defalias 'yes-or-no-p 'y-or-n-p)
(require 'smooth-scrolling)
(require 'redo)
(delete-selection-mode t)
(require 'textmate)
(textmate-mode)
