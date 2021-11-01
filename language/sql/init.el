(use-package sql-mode
  :mode
  (("\\.sql\\'" . sql-mode))
  :config
  (add-hook 'sql-mode-hook 'company-mode))

