(use-package csv-mode
  :mode
  (("\\.csv\\'" . csv-mode))
  :config
  (add-hook 'csv-mode-hook 'company-mode))
