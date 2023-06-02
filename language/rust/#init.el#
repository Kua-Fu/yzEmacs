;; =================== rust 配置=======================
(use-package rust-mode
  :mode
  (("\\.rs\\'" . rust-mode))
  :hook
  (rust-mode . global-linum-mode) ;; 行显示
  (rust-mode . hs-minor-mode) ;; 折叠模式
  (rust-mode . eldoc-mode) ;; 代码追踪
  (rust-mode . company-mode) ;; 自动填充
  (rust-mode . cargo-minor-mode)
  (rust-mode . racer-mode)
  (rust-mode . flycheck-mode)
  (flycheck-mode . flycheck-rust-setup)
  (rust-mode . (lambda () (setq indent-tabs-mode nil))) ;; 设置缩进

  :config
  (setq rust-format-on-save t) ;; 设置格式化
  )


