;; =================== rust 配置=======================
(use-package rust-mode
  :mode
  (("\\.rs\\'" . rust-mode))
  :hook
  (rust-mode . (lambda () (setq indent-tabs-mode nil)))
  (rust-mode . flycheck-mode)
	(rust-mode . company-mode)
	(rust-mode . hs-minor-mode)
  :config
  (setq rust-format-on-save t)
  :bind
  (:map rust-mode-map
	("C-c C-c" . rust-run))
)
  
