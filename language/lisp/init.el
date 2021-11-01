(use-package lisp-mode
  :mode
  (("\\.el\\'" . lisp-mode))  
  :config
  (add-hook 'lisp-mode-hook 'company-mode))
