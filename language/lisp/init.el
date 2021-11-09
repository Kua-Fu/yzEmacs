(use-package emacs-lisp-mode
  :mode
  (("\\.el\\'" . emacs-lisp-mode))
  :hook
  (emacs-lisp-mode . company-mode)
  (emacs-lisp-mode . format-all-mode)
  (emacs-lisp-mode . hs-minor-mode)
  )

;; (use-package lisp-mode
;;   :mode
;;   (("\\.el\\'" . lisp-mode))  
;;   :config
;;   (add-hook 'lisp-mode-hook 'company-mode))
