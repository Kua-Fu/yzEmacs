;; ===================6. java=====================================
(use-package lsp-java
  :init
  (setq lsp-java-server-install-dir "~/.emacs.d/jdt/")
  :ensure t
	:hook
	(java-mode . lsp-mode)
	(java-mode . flycheck-mode)
	(java-mode . company-mode)
	(java-mode . lsp-ui-mode)
	(java-mode . dap-mode)
	(java-mode . hs-minor-mode)
	:config
	(setq c-default-style "java")
	(setq c-basic-offset 4)
	(setq display-line-numbers-mode t))

;; debugger
(use-package dap-mode
  :after lsp-mode
  :config
  (dap-auto-configure-mode))

(use-package dap-java
  :ensure nil)
