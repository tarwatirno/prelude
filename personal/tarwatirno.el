;(require 'simple-wiki)
(setq prelude-guru nil)

(add-hook 'projectile-mode-hook 'amz-brazil-projectile-hook)

(add-to-list 'auto-mode-alist '("w.amazon.com*" . simple-wiki-mode))
;(global-set-key (kbd "C-x w i") 'simple-wiki-tag-region)
(autoload 'sgml-tag "sgml-mode" t)
(define-key simple-wiki-mode-map (kbd "C-c C-t") 'sgml-tag)

(require 'window-number)
(window-number-mode)

(persistent-scratch-setup-default)

(defun toggle-window-dedicated ()
  "Control whether or not Emacs is allowed to display another
buffer in current window."
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window (not (window-dedicated-p window))))
       "%s: Can't touch this!"
     "%s is up for grabs.")
   (current-buffer)))

(global-set-key (kbd "s-d") 'toggle-window-dedicated)

(require 'clj-refactor)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
