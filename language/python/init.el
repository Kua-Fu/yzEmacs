(use-package elpy
  :mode
  (("\\.py\\'" . python-mode))
  :ensure t
  :defer t
  :init
  (elpy-enable)
  (advice-add 'python-mode :before 'elpy-enable)
  :hook
  (elpy-mode . flycheck-mode)
  (elpy-mode . py-autopep8-enable-on-save)
  (elpy-mode . company-mode)
  (elpy-mode . hs-minor-mode)
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq python-shell-interpreter "ipython")
  (setq pyvenv-workon "py3")
  :bind
  (:map elpy-mode-map
	("M-." . elpy-goto-definition)
	("M-," . pop-tag-mark))
  )
