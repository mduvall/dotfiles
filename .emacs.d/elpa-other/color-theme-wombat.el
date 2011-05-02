(eval-when-compile    (require 'color-theme))
(defun color-theme-wombat ()
  "Color theme 'wombat', taken from http://dengmao.wordpress.com/2007/01/22/vim-color-scheme-wombat/#comment-1051, created 2009-06-23."
  (interactive)
  (color-theme-install
   '(color-theme-wombat
     ((background-color . "#242424")
      (background-mode . dark)
      (border-color . "#888a85")
      (cursor-color . "#656565")
      (foreground-color . "#f6f3e8")
      (mouse-color . "#333333"))
     ((apropos-keybinding-face . underline)
      (apropos-label-face italic variable-pitch)
      (apropos-match-face . match)
      (apropos-property-face . bold-italic)
      (apropos-symbol-face . bold)
      (compilation-message-face . underline)
      (list-matching-lines-buffer-name-face . underline)
      (list-matching-lines-face . match)
      (view-highlight-face . highlight)
      (widget-mouse-face . highlight))
     (default ((t (:stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Courier New"))))
     (bold ((t (:bold t :weight bold))))
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
     (border ((t (:background "#888a85"))))
     (buffer-menu-buffer ((t (:bold t :weight bold))))
     (button ((t (:underline t))))
     (comint-highlight-input ((t (:italic t :bold t :slant italic :weight bold))))
     (comint-highlight-prompt ((t (:foreground "#8ae234"))))
     (compilation-column-number ((t (:foreground "#cae682"))))
     (compilation-error ((t (:bold t :weight bold :foreground "#cc0000"))))
     (compilation-info ((t (:bold t :foreground "Green1" :weight bold))))
     (compilation-line-number ((t (:foreground "#cae682"))))
     (compilation-warning ((t (:bold t :foreground "Orange" :weight bold))))
     (completions-common-part ((t (:family "Courier New" :foundry "outline" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#f6f3e8" :background "#242424" :stipple nil :height 98))))
     (completions-first-difference ((t (:bold t :weight bold))))
     (cursor ((t (:background "#656565"))))
     (dired-directory ((t (:foreground "#cae682"))))
     (dired-flagged ((t (:bold t :weight bold :foreground "#cc0000"))))
     (dired-header ((t (:foreground "#cae682"))))
     (dired-ignored ((t (:foreground "grey70"))))
     (dired-mark ((t (:foreground "#e5786d"))))
     (dired-marked ((t (:bold t :weight bold :foreground "#cc0000"))))
     (dired-perm-write ((t (:family "Courier New" :foundry "outline" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#f6f3e8" :background "#242424" :stipple nil :height 98))))
     (dired-symlink ((t (:foreground "#8ac6f2"))))
LOLLOLthat is not true what so ever so idon't know what else to sayyyy HAHAHA     (dired-warning ((t (:bold t :weight bold :foreground "#cc0000"))))
     (escape-glyph ((t (:foreground "cyan"))))
     (file-name-shadow ((t (:foreground "grey70"))))
     (fixed-pitch ((t (:family "Monospace"))))
     (font-lock-builtin-face ((t (:foreground "#8ac6f2"))))
     (font-lock-comment-delimiter-face ((t (:italic t :slant italic :foreground "#99968b"))))
     (font-lock-comment-face ((t (:italic t :foreground "#99968b" :slant italic))))
     (font-lock-constant-face ((t (:foreground "#e5786d"))))
     (font-lock-doc-face ((t (:italic t :foreground "#99968b" :slant italic))))
     (font-lock-function-name-face ((t (:foreground "#cae682"))))
     (font-lock-keyword-face ((t (:foreground "#8ac6f2"))))
     (font-lock-negation-char-face ((t (:foreground "#e7f6da"))))
     (font-lock-preprocessor-face ((t (:foreground "#e5786d"))))
     (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
     (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
     (font-lock-string-face ((t (:italic t :foreground "#95e454" :slant italic))))
     (font-lock-type-face ((t (:foreground "#cae682"))))
     (font-lock-variable-name-face ((t (:foreground "#cae682"))))
     (font-lock-warning-face ((t (:bold t :foreground "#cc0000" :weight bold))))
     (fringe ((t (:background "grey10"))))
     (header-line ((t (:background "grey20" :foreground "grey90" :box nil))))
     (help-argument-name ((t (:italic t :slant italic))))
     (highlight ((t (:background "darkolivegreen"))))
     (info-xref ((t (:foreground "#729fcf"))))
     (info-xref-visited ((t (:foreground "#ad7fa8"))))
     (isearch ((t (:background "#f57900" :foreground "#2e3436"))))
     (isearch-fail ((t (:background "red4"))))
     (iswitchb-current-match ((t (:foreground "#cae682"))))
     (iswitchb-invalid-regexp ((t (:bold t :weight bold :foreground "#cc0000"))))
     (iswitchb-single-match ((t (:italic t :slant italic :foreground "#99968b"))))
     (iswitchb-virtual-matches ((t (:foreground "#8ac6f2"))))
     (italic ((t (:italic t :slant italic))))
     (lazy-highlight ((t (:background "yellow" :foreground "black"))))
     (link ((t (:bold t :foreground "#8ac6f2" :underline t :weight bold))))
     (link-visited ((t (:bold t :weight bold :underline t :foreground "violet"))))
     (match ((t (:background "RoyalBlue3"))))
     (menu ((t (:foreground "systemmenu" :background "systemmenutext"))))
     (minibuffer-noticeable-prompt ((t (nil))))
     (minibuffer-prompt ((t (:foreground "#729fcf"))))
     (mode-line ((t (:background "#333333" :foreground "#eeeeec"))))
     (mode-line-buffer-id ((t (:bold t :weight bold))))
     (mode-line-emphasis ((t (:bold t :weight bold))))
     (mode-line-highlight ((t (:box (:line-width 2 :color "grey40" :style released-button)))))
     (mode-line-inactive ((t (:background "#222222" :foreground "#cccddd"))))
     (mouse ((t (:background "#333333"))))
     (next-error ((t (:foreground "#f6f3e8" :background "#444444"))))
     (nobreak-space ((t (:foreground "cyan" :underline t))))
     (org-date ((t (:foreground "LightSteelBlue" :underline t))))
     (org-hide ((t (:foreground "#2e3436"))))
     (org-level-1 ((t (:foreground "#cae682"))))
     (org-level-2 ((t (:foreground "#cae682"))))
     (org-level-3 ((t (:foreground "#8ac6f2"))))
     (org-level-4 ((t (:italic t :slant italic :foreground "#95e454"))))
     (org-level-5 ((t (:foreground "#e5786d"))))
     (org-todo ((t (:bold t :foreground "#8ac6f2" :weight bold))))
     (paren-face-match ((t (:foreground "#eeeeec" :background "#729fcf"))))
     (paren-face-match-light ((t (:foreground "#eeeeec" :background "#729fcf"))))
     (paren-face-mismatch ((t (:foreground "#2e3436" :background "#ad7fa8"))))
     (persp-selected-face ((t (:foreground "#729fcf"))))
     (query-replace ((t (:foreground "#2e3436" :background "#f57900"))))
     (region ((t (:background "#444444" :foreground "#f6f3e8"))))
     (scroll-bar ((t (:foreground "systemscrollbar"))))
     (secondary-selection ((t (:background "SkyBlue4"))))
     (sgml-namespace ((t (:foreground "#8ac6f2"))))
     (shadow ((t (:foreground "grey70"))))
     (show-paren-match ((t (:background "#729fcf" :foreground "#eeeeec"))))
     (show-paren-mismatch ((t (:background "#ad7fa8" :foreground "#2e3436"))))
     (tmm-inactive ((t (:foreground "grey70"))))
     (tool-bar ((t (:background "systembuttonface" :foreground "systembuttontext" :box (:line-width 1 :style released-button)))))
     (tooltip ((t (:family "Sans Serif" :background "systeminfowindow" :foreground "systeminfotext"))))
     (trailing-whitespace ((t (:background "red1"))))
     (underline ((t (:underline t))))
     (variable-pitch ((t (:family "Sans Serif"))))
     (vertical-border ((t (nil))))
     (widget-button ((t (:bold t :weight bold))))
     (widget-button-pressed ((t (:foreground "red1"))))
     (widget-documentation ((t (:foreground "lime green"))))
     (widget-field ((t (:background "dim gray"))))
     (widget-inactive ((t (:foreground "grey70"))))
     (widget-single-line-field ((t (:background "dim gray")))))))
(add-to-list 'color-themes '(color-theme-wombat  "Wombat" "http://dengmao.wordpress.com/2007/01/22/vim-color-scheme-wombat/#comment-1051"))