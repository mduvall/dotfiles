(setq mac-command-modifier 'alt mac-option-modifier 'meta)
(setq mac-pass-command-to-system nil) ;; don't hide application
(global-set-key (kbd "<M-up>") 'buf-move-up)
(global-set-key (kbd "<M-down>") 'buf-move-down)
(global-set-key (kbd "<M-left>") 'buf-move-left)
(global-set-key (kbd "<M-right>") 'buf-move-right)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-x M-m") 'ansi-term)
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)

(eval-after-load 'sass-mode '(define-key sass-mode-map (kbd "RET") 'newline))