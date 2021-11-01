(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)

;;============1. 保证use-package 安装====================================
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;;============2. 美化界面,使用主题=======================================
(use-package vscode-dark-plus-theme
  :config
  (load-theme 'vscode-dark-plus t)
  (global-hl-line-mode 1)                       ;;高亮当前行
  (set-face-attribute 'default nil :height 160) ;;设置字体大小
  (setq cursor-type 'bar)                       ;;更改光标的样式
  (setq inhibit-startup-message t)              ;;关闭开始帮助
  (tool-bar-mode -1)             ;;关闭各种菜单栏
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  )

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

(use-package aggressive-indent)

;;===========项目管理 ==================================================
(use-package tramp)
(use-package projectile)
(use-package helm-projectile)

;;===========3. 全局快捷键 ==================================================
;; 1) 绑定或者解绑 mark
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; 2) 跳转到另一个window
(global-set-key (kbd "M-o") 'other-window)

;; 3） 快速打开、加载配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun load-init-file()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)
(global-set-key (kbd "<f3>") 'load-init-file)

;; 4）设置折叠快捷键
(global-set-key (kbd "C-M-[") 'hs-show-block)
(global-set-key (kbd "C-M-]") 'hs-hide-block)


;;===========4. python (elpy)=============================================
(use-package elpy
  :mode ;; 指定使用范围
  (("\\.py\\'" . python-mode)) 
  :ensure t
  :defer t
  :init
  (elpy-enable)
  (advice-add 'python-mode :before 'elpy-enable)
  :hook
  (elpy-mode . flycheck-mode) ;; 添加flycheck, 替换flymake
  (elpy-mode . py-autopep8-enable-on-save)
  (elpy-mode . company-mode)
	(elpy-mode . hs-minor-mode)
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq python-shell-interpreter "ipython")
	(setq pyvenv-workon "py3") ;; 默认虚拟环境为 python3
  :bind
  (:map elpy-mode-map ;; 定义本地命名空间
   ("M-," . elpy-goto-definition)
   ("M-." . pop-tag-mark))
  )

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

	
  ;; (add-hook 'java-mode-hook 'lsp)
  ;; (add-hook 'java-mode-hook 'flycheck-mode)
  ;; (add-hook 'java-mode-hook 'company-mode)
  ;; (add-hook 'java-mode-hook 'lsp-ui-mode)
  ;; ;; (add-hook 'java-mode-hook 'lsp-treemacs-sync-mode)
  ;; (add-hook 'java-mode-hook 'dap-mode)
  ;; (add-hook 'java-mode-hook (lambda ()
	;; 		      (setq c-default-style "java")
	;; 		      (setq c-basic-offset 4)
	;; 		      (display-line-numbers-mode t)
	;; 		      )))

;; debugger
(use-package dap-mode
  :after lsp-mode
  :config
  (dap-auto-configure-mode))

(use-package dap-java
  :ensure nil)

;; =================== c c++ 配置=======================
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)

(add-hook 'markdown-mode-hook 'company-mode)

  

;; ===================第7部分 各种其他工具=======================
;; 1) 谷歌翻译
;; (use-package go-translate
;;   :config
;;   (setq go-translate-base-url "http://translate.google.cn")
;;   (setq go-translate-local-language "zh-CN")
;;   (defun go-translate-token--extract-tkk ()
;; 	(cons 430675 2721866130))
;;   (global-set-key (kbd "M-t") 'go-translate)
;; )

(use-package go-translate
	:config
	(setq gts-translate-list '(("en" "zh")))
	(setq gts-default-translator
      (gts-translator
       :picker (gts-prompt-picker)
       :engines (list (gts-bing-engine) (gts-google-engine))
       :render (gts-buffer-render)))
	(global-set-key (kbd "M-t") 'gts-do-translate)
	)

;; ====================第8部分 lisp==================
(use-package lisp-mode
  :mode
  (("\\.el\\'" . lisp-mode))  
  :config
  (add-hook 'lisp-mode-hook 'company-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(helm-tramp ssh tramp-auto-auth helm-projectile csv-mode treemacs-icons-dired treemacs-evil treemacs-projectile helm-lsp which-key company-jedi jupyter elpygen yaml-mode xclip vscode-dark-plus-theme use-package solarized-theme smartparens shell-pop rust-mode python-mode py-autopep8 projectile persistent-scratch nodejs-repl monokai-theme molokai-theme material-theme markdown-preview-mode magit lsp-ui lsp-java js2-mode impatient-mode hungry-delete google-translate go-translate go-complete go-autocomplete gif-screencast flymake-go flycheck exec-path-from-shell elpy dumb-jump doom-themes dired-subtree counsel company-go color-theme-sanityinc-solarized camcorder calfw bug-hunter blacken bison-mode autopair aggressive-indent)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package sql-mode
  :mode
  (("\\.sql\\'" . sql-mode))
  :config
  (add-hook 'sql-mode-hook 'company-mode))

(use-package csv-mode
  :mode
  (("\\.csv\\'" . csv-mode))
  :config
  (add-hook 'csv-mode-hook 'company-mode))
