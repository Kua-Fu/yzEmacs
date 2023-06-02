;; ========================== 设置清华源 ==============================================
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize) ;; You might already have this line

;;============1. 保证use-package 安装==================================

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; ========================== 美化界面 ==============================================
(use-package vscode-dark-plus-theme
  :config
  (load-theme 'vscode-dark-plus t)
  ;;高亮当前行
  (global-hl-line-mode 1)
  ;;设置字体大小
  (set-face-attribute 'default nil :height 120)
  ;;更改光标的样式
  (setq cursor-type 'bar)
  ;;关闭开始帮助
  (setq inhibit-startup-message t)
  ;;关闭各种菜单栏
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; 初始化窗口最大化
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maxheight))


;;=========== 全局快捷键 ==============================================

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

;; (use-package projectile-mode
;;   :ensure t
;;   )


;;===========语言配置=============================================

;; 1)配置python开发环境
(load-file "~/.emacs.d/language/python/init.el")

;; 2)配置rust开发环境
(load-file "~/.emacs.d/language/rust/init.el")

;; 3)配置golang开发环境
(load-file "~/.emacs.d/language/golang/init.el")

;; ;; 4)配置java开发环境
(load-file "~/.emacs.d/language/java/init.el")

;; 5)配置c/c++开发环境
(load-file "~/.emacs.d/language/c/init.el")

;; 6)配置markdown开发环境
(load-file "~/.emacs.d/language/markdown/init.el")

;; 7)配置lisp开发环境
(load-file "~/.emacs.d/language/lisp/init.el")

;; 8)配置sql开发环境
(load-file "~/.emacs.d/language/sql/init.el")

;; 9)配置csv开发环境
(load-file "~/.emacs.d/language/csv/init.el")

;; 10) 配置json
(load-file "~/.emacs.d/language/json/init.el")

;; =================== 各种其他工具=======================

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


(setq nov-unzip-program (executable-find "bsdtar")
      nov-unzip-args '("-xC" directory "-f" filename))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; ======================录屏============================
(with-eval-after-load 'gif-screencast
  (setq gif-screencast-args '("-x")) ;; To shut up the shutter sound of `screencapture' (see `gif-screencast-command').
  (setq gif-screencast-cropping-program "mogrify") ;; Optional: Used to crop the capture to the Emacs frame.
  (setq gif-screencast-capture-format "ppm")) ;; Optional: Required to crop captured images.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-java-server-install-dir "/Users/yz/.emacs.d/jdt/")
 '(package-selected-packages
   '(vdiff nov gif-screencast lsp-java lsp-mode go-mode go json-mode yaml-mode py-autopep8 cargo-mode projectile-mode go-translate projectile magit vscode-dark-plus-theme use-package racer lispy format-all flycheck-rust elpy cargo)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

(load-file "~/.emacs.d/ediff-face-settings.el")
