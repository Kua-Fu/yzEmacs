;; =============5. golang===================================================
(use-package go-mode
  :mode
  (("\\.go\\'" . go-mode))
  :config
  (setq exec-path (append exec-path '("/usr/local/go/bin"))) ;; 设置golang的编译路径
  (setq gofmt-command "goimports")
  (setq tab-width 2)
  (setq indent-tabs-mode 1)
  :hook
  (before-save . gofmt-before-save)
  (go-mode . flycheck-mode)
  (go-mode . company-mode)
	(go-mode . hs-minor-mode)
  :bind
	(:map go-mode-map ;; 定义本地命名空间
   ("M-," . godef-jump)
   ("M-." . pop-tag-mark))
  )
