;; Python hook
(add-to-list 'auto-mode-alist '("\\.mako$" . html-mode))

;; Sass hooks
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

;; Javascript helpers
(add-to-list 'load-path (concat package-user-dir "/js2-mode"))
(setq js-indent-level 2)
(autoload 'js2-mode "js2-mode" nil t)
(setq js2-basic-offset 2)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

;; Octave hook
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;; Scala hook
(require 'scala-mode-auto)
(require 'font-lock)
(defun scala-no-tab-mode()
  (setq indent-tabs-mode nil))
(add-hook 'scala-mode-hook 'scala-no-tab-mode)
(add-hook 'scala-mode-hook
		  (lambda ()
			(local-set-key (kbd "RET") (lambda ()
										 (interactive)
										 (setq last-command nil)
										 (scala-newline)
										 (scala-indent-line)))))
(autoload 'scala-mode "scala-mode" nil t)


;; Markdown hook
(setq auto-mode-alist (cons '("\\.text", markdown-mode) auto-mode-alist))

;; Ruby hook
(autoload 'ruby-mode "ruby-mode" nil t)
(autoload 'run-ruby "inf-ruby")
(autoload 'inf-ruby-keys "inf-ruby")
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(defun echo-false-comint () (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'echo-false-comint)
(add-hook 'ruby-mode-hook 'turn-on-font-lock)
(add-hook 'ruby-mode-hook '(lambda ()
							 (local-set-key "\r" 'reindent-then-newline-and-indent)
							 (setq ruby-deep-arglist t)
							 (setq ruby-deep-indent-paren nil)
							 (setq c-tab-always-indent nil)
							 (require 'ruby-compilation)
							 (inf-ruby-keys)))
(autoload 'rhtml-mode "rhtml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
(add-hook 'rhtml-mode '(lambda ()
						 (define-key rhtml-mode-map (kbd "M-s") 'save-buffer)))

(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(autoload 'css-mode "css-mode" nil t)
(add-hook 'css-mode-hook '(lambda ()
							(setq css-indent-level 2)
							(setq css-indent-offset 2)))

;; C/C++ stuff
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))

;; CSS/HTML stuff
(add-hook 'css-mode-hook
		  (lambda()
			(setq css-indent-level 2)
			(setq css-mode-indent-depth 2)
			(setq css-indent-offset 2)))
(setq ccsm-indent-level 2)
(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-mirror-mode t)

(defun mtd-html-mode-hook ()
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  (define-key html-mode-map (kbd "C->") 'sgml-close-tag))
(add-hook 'html-mode-hook 'mtd-html-mode-hook)


;; global edits
