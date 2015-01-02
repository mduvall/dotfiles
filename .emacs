;;; better-defaults start
(progn
  (ido-mode t)
  (setq ido-enable-flex-matching t)

  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (require 'saveplace)
  (setq-default save-place t)

  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer)

  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)

  (setq-default indent-tabs-mode nil)
  (setq x-select-enable-clipboard t
        x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))

(provide 'better-defaults)
;;; better-defaults end

;; Set up mumbo jumbo
(add-to-list 'load-path "~/.emacs.d")
(require 'cl-lib)
(setq inhibit-startup-message t)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Getting packages in order
(require 'package)
(setq package-list '(ruby-mode
                     smartparens
                     flx-ido
                     projectile
                     magit
                     git-gutter
                     grizzl
                     web-mode
                     stylus-mode
                     coffee-mode
                     powerline
                     exec-path-from-shell
                     inf-ruby
                     web-mode
                     smex
                     rainbow-mode
                     robe
                     solarized-theme))
(dolist (source '(("melpa" . "http://melpa.milkbox.net/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")))
  (add-to-list 'package-archives source))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Something something UTF-8 always something
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

(setq compilation-ask-about-save nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq default-tab-width 2)
(setq js-indent-level 2)

;; Mouses, how do they work
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)
;; (add-hook 'post-command-hook
;;           (lambda ()
;;             (recenter '("don't redraw"))))

;; Smex!
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; Projectile setup
(require 'projectile)
;; (require 'grizzl)
(setq projectile-globally-ignored-directories
	  (append projectile-globally-ignored-directories '(".git" ".asset-cache")))
(projectile-global-mode)
(setq projectile-enable-caching t)
;; (setq projectile-completion-system 'grizzl)

;; Ido is cool.
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-14"))
(electric-indent-mode 1)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(setq ag-highlight-search t)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(global-linum-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Sorry.
(setenv "PATH" (concat (getenv "PATH") ":/bin"))
(setq exec-path (append exec-path '("/bin")))
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))
(setenv "PATH" (concat (getenv "PATH") ":/usr/bin"))
(setq exec-path (append exec-path '("/usr/bin")))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setenv "PATH" (concat (getenv "PATH") ":/Users/matt/.rbenv/shims"))
(setq exec-path (append exec-path '("/Users/matt/.rbenv/shims")))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/go/bin"))
(setq exec-path (append exec-path '("/usr/local/go/bin")))
(setenv "PATH" (concat (getenv "PATH") ":/Users/matt/go/bin"))
(setq exec-path (append exec-path '("/Users/matt/go/bin")))

;; Ruby
(add-to-list 'auto-mode-alist '("\\.\\(rb\\|ru\\|builder\\|rake\\|thor\\|gemspec\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\(rake\\|thor\\|guard\\|gem\\|cap\\|vagrant\\)file\\'" . ruby-mode))
(add-hook 'ruby-mode-hook 'robe-mode)
(setq inf-ruby-default-implementation "pry")

;; HTML and stuff
(add-to-list 'auto-mode-alist '("\\.\\(eco\\)\\'" . web-mode))
(setq web-mode-code-indent-offset 4)
(setq web-mode-markup-indent-offset 4)

;; Golang
(require 'go-mode)
(add-hook 'go-mode-hook (lambda() (
                                   (setq gofmt-command "goimports")
                                   (add-hook 'before-save-hook 'gofmt-before-save)
                                   (flycheck-set-checker-executable 'go-gofmt "/usr/local/go/bin/gofmt")
                                   (flycheck-select-checker 'go-gofmt))))
; (setq gofmt-show-errors nil)

;; Close the compilation window if there was no error at all.
(setq compilation-exit-message-function
      (lambda (status code msg)
        ;; If M-x compile exists with a 0
        (when (and (eq status 'exit) (zerop code))
          ;; then bury the *compilation* buffer, so that C-x b doesn't go there
          (bury-buffer "*compilation*")
          ;; and return to whatever were looking at before
          (replace-buffer-in-windows "*compilation*"))
        ;; Always return the anticipated result of compilation-exit-message-function
        (cons msg code)))

;; Jump to symbol
(require 'cl)
(defun ido-goto-symbol ()
  "Will update the imenu index and then use ido to select a
   symbol to navigate to"
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (cl-flet ((addsymbols (symbol-list)
                          (when (listp symbol-list)
                            (dolist (symbol symbol-list)
                              (let ((name nil) (position nil))
                                (cond
                                 ((and (listp symbol) (imenu--subalist-p symbol))
                                  (addsymbols symbol))

                                 ((listp symbol)
                                  (setq name (car symbol))
                                  (setq position (cdr symbol)))

                                 ((stringp symbol)
                                  (setq name symbol)
                                  (setq position (get-text-property 1 'org-imenu-marker symbol))))

                                (unless (or (null position) (null name))
                                  (add-to-list 'symbol-names name)
                                  (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(add-to-list 'load-path "~/.emacs.d/helm/")
(require 'helm-config)
(add-to-list 'load-path "~/.emacs.d/helm-projectile")
(require 'helm-projectile)

(setq ring-bell-function 'ignore)

(show-paren-mode 1)
(smartparens-global-mode t)
(add-to-list 'load-path "~/.emacs.d/smartparens-config")
(require 'smartparens-config)

(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(set-default 'ac-sources
             '('ac-source-abbrev
               'ac-source-words-in-buffer
               'ac-source-words-in-same-mode-buffers))
(setq ac-auto-show-menu 0.1)
(setq ac-delay 0.1)
(global-auto-complete-mode t)
(ac-config-default)

(dolist (m '(ruby-mode js-mode coffee-mode))
  (add-to-list 'ac-modes m))

(add-to-list 'load-path "~/.emacs.d/tomorrow-theme")
(require 'solarized-theme)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()
  (interactive)
  (scroll-down (window-half-height)))

(setq create-lockfiles nil)

(defun file-to-clip ()
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(global-set-key (kbd "M-n") 'scroll-up-half)
(global-set-key (kbd "M-p") 'scroll-down-half)
(global-set-key (kbd "C-t") 'ido-goto-symbol)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-p") 'helm-projectile)
(global-set-key [f5] 'revert-buffer)

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'stylus-mode-hook 'rainbow-mode)

(windmove-default-keybindings)

(provide 'emacs-init)
