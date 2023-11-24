(use-package shell-mode
  :mode
  (("\\.sh\\'" . shell-mode))
  :hook
  (shell-mode . flycheck-mode)
  (shell-mode . company-mode)
)
