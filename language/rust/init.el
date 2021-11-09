;; =================== rust 配置=======================
(use-package rust-mode
  :mode
  (("\\.rs\\'" . rust-mode))
  :hook
  (rust-mode . hs-minor-mode)
  :bind
  ( :map rust-mode-map
    (
     ("C-c C-t" . racer-describe)
     ([?\t] .  company-indent-or-complete-common)
     )
    ))

(use-package flycheck-rust)

(use-package cargo
  :hook
  (rust-mode . cargo-minor-mode)
  :bind
  ("C-c C-c C-n" . cargo-process-new))

(defun yz-racer-mode ()
  (set (make-local-variable 'company-backends)
       '((company-capf company-files))))

(use-package racer
  :hook
  (racer-mode . yz-racer-mode)
  (rust-mode . racer-mode)
  (racer-mode . company-mode)
  (racer-mode . eldoc-mode)
  (rust-mode  . flycheck-mode)
  (flycheck-mode . flycheck-rust-setup)
  (before-save . rust-format-buffer)
  :config
  (setq indent-tabs-mode nil)
  (setq company-minimum-prefix-length 1)
  )

