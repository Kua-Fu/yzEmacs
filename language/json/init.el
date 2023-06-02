(use-package json-mode
  :mode
  (("\\.json\\'" . json-mode))
  :hook
  (json-mode . flycheck-mode)
  (json-mode . company-mode)
  ;; (before-save . json-pretty-print-buffer)
 )


