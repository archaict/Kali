(setq doom-scratch-initial-major-mode 'org-mode)
(provide 'config)
(setq doom-theme 'doom-tomorrow-night)
(setq doom-modeline-icon t)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* & *Messagesh*
(kill-buffer "*scratch*")
(kill-buffer "*Messages*")
(setq-default message-log-max nil)
(setq inhibit-startup-buffer-menu t)
(after! persp-mode
  (remove-hook 'persp-add-buffer-on-after-change-major-mode-filter-functions #'doom-unreal-buffer-p))

(map! :leader
      :desc "Tangle current file"       "c t"   #'org-babel-tangle
      :desc "Tangle current file"       "t t"   #'org-babel-tangle
      :desc "Dired"                     "d d"   #'dired-jump
      :desc "Presentation"              "t p"   #'org-present
      :desc "Quit presentation"         "P q"   #'org-present-quit
      :desc "Next Slide"                "P h"   #'org-present-prev
      :desc "Prevous Slide"             "P l"   #'org-present-next
      :desc "Big Mode"                  "P b"   #'org-present-big
      :desc "Small Mode"                "P s"   #'org-present-small
      :desc "First Slide"               "P B"   #'org-present-beginning
      :desc "End Slide"                 "P E"   #'org-present-end
      :desc "Highlight"                 "t h"   #'hl-todo-mode
      :desc "Time"                      "t T"   #'display-time
      :desc "Run code"                  "t c c" #'org-ctrl-c-ctrl-c
      :desc "Toggle command log mode"   "t c m" #'command-log-mode
      :desc "Show command log buffer"   "t c l" #'clm/toggle-command-log-buffer
      )

(map! :leader
      (:prefix-map ("N" . "NixOS")
        :desc "NixOS Options" "h" #'helm-nixos-options))

(map! :leader
      (:prefix-map ("M" . "mode")

        :desc "Shell" "s" #'shell-script-mode))

(map! :leader
      (:prefix-map ("e" . "eval")

        :desc "Eval Sexp" "s" #'eval-last-sexp))

(map! :leader
      (:prefix-map ("T" . "Text")

        :desc "Figlet Border" "f b"             #'figlet-border
        :desc "Figlet Future" "f f"             #'figlet-future
        :desc "Figlet Pagga"  "f p"             #'figlet-pagga
        :desc "Figlet Small"  "f s"             #'figlet-small
        :desc "Figlet Future Border" "f F"      #'figlet-future-border

        :desc "List - Lorem Ipsum" "l"          #'lorem-ipsum-insert-list
        :desc "Sentences - Lorem Ipsum" "s"     #'lorem-ipsum-insert-sentences
        :desc "Paragraphs - Lorem Ipsum" "p"    #'lorem-ipsum-insert-paragraphs))

(evil-better-visual-line-on)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "J") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "K") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)

(evil-define-key* 'motion 'global
  ";" #'evil-ex
  ":" #'evil-repeat-find-char)

(map! (:after dired
       :map dired-mode-map
       :n "H" #'dired-up-directory
       :n "L" #'dired-find-file
       :n "<backspace>" #'dired-up-directory
       ))

(setq-default left-margin-width 4 right-margin-width 4)
(set-window-buffer nil (current-buffer))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))


;; Doom Modeline
(setq-default header-line-format " ")
(display-battery-mode 1)
(display-time-mode 1)
(setq display-time-format "%Y-%m-%d | %R [%Z] ")

(setq doom-modeline-lsp t)
(setq doom-modeline-height 35)
(setq doom-modeline-modal-icon t)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-continuous-word-count-modes nil)

(setq evil-normal-state-cursor '("#dddddd" box))
(setq evil-visual-state-cursor '("#dddddd" box))
(setq evil-insert-state-cursor '("#dddddd" bar))

(setq company-idle-delay 0)
(setq company-tooltip-limit 6)
(setq company-dabbrev-downcase nil)
(setq company-minimum-prefix-length 1)
(setq company-dabbrev-ignore-case nil)
(setq company-selection-wrap-around t)
(setq company-selection-default 0)

(defun figlet-border (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f term -F border" (current-buffer) t))

(defun figlet-future (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f future" (current-buffer) t))

(defun figlet-future-border (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f future -F border" (current-buffer) t))

(defun figlet-pagga (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f pagga -F border" (current-buffer) t))

(defun figlet-small (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "figlet -f small" (current-buffer) t))

(setq yas-snippet-dirs '("~/Project/NixOS/doom/snippets"))

(setq org-ellipsis " ")
(setq org-export-preserve-breaks t)
(setq org-hide-emphasis-markers t)
(setq org-hide-leading-stars t)
(setq org-hidden-keywords '(title subtitle))

(custom-set-faces!
  '(org-document-title      :height 2.0 :foreground "#eaeaea")
  '(org-document-info       :height 1.0 :foreground "#cccccc" :italic t)
  '(link                    :height 1.0 :foreground "#5E81AC" :italic t)
  '(mode-line               :background "#303030")
  '(org-level-1 :foreground "#eaeaea" :weight extra-bold :height 1.00 )
  '(org-level-2 :foreground "#dddddd" :weight bold       :height 1.00 )
  '(org-level-3 :foreground "#cccccc" :weight bold       :height 1.00 )
  '(org-level-4 :foreground "#bbbbbb" :weight bold       :height 1.00 )
  '(org-level-5 :foreground "#aaaaaa" :weight bold       :height 1.00 ))

(lambda () (progn
  (setq left-margin-width 8)
  (setq right-margin-width 8)
  (set-window-buffer nil (current-buffer))))

(global-prettify-symbols-mode t)
(global-hl-todo-mode t)

(setq org-bullets-bullet-list '("???" "???" "???" "???" "???" "???"))

(defun trigger-org-company-complete ()
  (interactive)
  (if (string-equal "#" (string (preceding-char)))
    (progn
      (insert "+")
      (company-complete))
    (insert "+")))
(defun trigger-org-company-complete () (interactive)
  (if (string-equa(setq org-hide-emphasis-markers t))))

(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
(autoload 'org-present "org-present" nil t)
(require 'org-inlinetask)

(setq hl-todo-keyword-faces
      '(("HOLD"   . "#D3869B")
        ("TITLE"  . "#B8BB26")
        ("TODO"   . "#FABD2F")
        ("LINK"   . "#5E81AC")
        ("NOTE"   . "#B8BB26")
        ("DONE"   . "#808080")
        ("HACK"   . "#FE8019")
        ("FIXME"  . "#FB4934")
        ("WARNING"   . "#FB4934")))

(setq c-basic-indent 2)
(setq c-default-style "linux")
(setq tab-width 2)
(setq-default indent-tabs-mode nil)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'display-time-mode)


(add-hook 'after-init-hook(lambda ()(setq indent-tabs-mode nil)))
(add-hook 'after-init-hook(lambda ()(setq tab-width 2)))
(add-hook 'after-init-hook(lambda ()(setq evil-shift-width 2)))

(add-hook 'org-mode-hook (lambda () (hl-todo-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook ;; Prettify Symbols
          (lambda ()
            (push '("#+begin_src" . "??") prettify-symbols-alist)
            (push '("#+end_src" . "??") prettify-symbols-alist)))
(add-hook 'org-mode-hook
          '(lambda ()
             (add-hook 'write-contents-functions
                       'delete-trailing-whitespace)))

(setq org-pandoc-options '((standalone . _)))
(setq org-pandoc-options-for-docx '((standalone . nil)))
(setq org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html))

(add-hook 'fast-scroll-start-hook (lambda () (flycheck-mode -1)))
(add-hook 'fast-scroll-end-hook (lambda () (flycheck-mode 1)))
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(global-hl-todo-mode 1)
(global-hi-lock-mode 1)

(setq figlet-default-font "Future")
