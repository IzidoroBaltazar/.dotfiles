(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)



; list the packages you want
(setq package-list '(evil elscreen evil-tabs xt-mouse haskell-mode python-mode magit evil-leader evil-magit auto-complete))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(global-evil-leader-mode)
(evil-leader/set-leader ",")

;;(require 'auto-install)
;;(setq auto-install-directory "~/.emacs.d/auto-install/")
(require 'evil)
(setq evil-search-module 'evil-search)
(require 'elscreen)
(require 'evil-tabs)
(evil-mode 1)
(global-evil-tabs-mode t)

(require 'xt-mouse)
(xterm-mouse-mode)
(require 'mouse)
(xterm-mouse-mode t)
(require 'evil-magit)
(autoload 'haskell-mode "haskell-mode" "Haskell Mode" t)
(autoload 'python-mode "python-mode" "Python Mode." t)

;;(setq url-proxy-services '(("http" . "one.proxy.att.com:8080")
;;			   ("https" . "one.proxy.att.com:8080")))
;; (LOAD-theme 'seoul256)
(load-theme 'wombat)
;; (load-theme 'seoul256-theme)

;; (defun linum-unload-function ()
;;   "Unload the Linum library."
;;   (global-linum-mode -1)
;;   ;; continue standard unloading
;;   nil)
;; 
;; (provide 'linum)
;;(load-file "~/.emacs.d/robot-mode/robot-mode.el")
;;(add-to-list 'auto-mode-alist '("\\.robot\\'" . robot-mode))
;;(add-to-list 'load-path "~/.emacs.d/robot-mode")
;;(require 'robot-mode)
;;(load "robot-mode")

(setq tags-table-list '("~/ws/tags/TAGS"))

(define-key evil-normal-state-map (kbd "gf")
  (lambda () (interactive) (find-tag (find-tag-default-as-regexp))))

(define-key evil-normal-state-map (kbd "gb") 'pop-tag-mark)

(define-key evil-normal-state-map (kbd "gn")
    (lambda () (interactive) (find-tag last-tag t)))

(setq tab-width 4)
(setq-default indent-tabs-mode nil)

(unless window-system
  (add-hook 'linum-before-numbering-hook
	    (lambda ()
	      (setq-local linum-format-fmt
			  (let ((w (length (number-to-string
					    (count-lines (point-min) (point-max))))))
			    (concat "%" (number-to-string w) "d"))))))

(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'face 'mode-line)))

(unless window-system
    (setq linum-format 'linum-format-func))

(global-linum-mode t)

(setq path-to-ctags "/usr/bin/ctags")

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
)

;(define-key evil-normal-state-map (kbd "C-0") (lambda() (interactive) (elscreen-goto 0)))
;(define-key evil-normal-state-map (kbd "C- ") (lambda() (interactive) (elscreen-goto 0)))
;(define-key evil-normal-state-map (kbd "C-1") (lambda() (interactive) (elscreen-goto 1)))
;(define-key evil-normal-state-map (kbd "C-2") (lambda() (interactive) (elscreen-goto 2)))
;(define-key evil-normal-state-map (kbd "C-3") (lambda() (interactive) (elscreen-goto 3)))
;(define-key evil-normal-state-map (kbd "C-4") (lambda() (interactive) (elscreen-goto 4)))
;(define-key evil-normal-state-map (kbd "C-5") (lambda() (interactive) (elscreen-goto 5)))
;(define-key evil-normal-state-map (kbd "C-6") (lambda() (interactive) (elscreen-goto 6)))
;(define-key evil-normal-state-map (kbd "C-7") (lambda() (interactive) (elscreen-goto 7)))
;(define-key evil-normal-state-map (kbd "C-8") (lambda() (interactive) (elscreen-goto 8)))
;(define-key evil-normal-state-map (kbd "C-9") (lambda() (interactive) (elscreen-goto 9)))
;(define-key evil-insert-state-map (kbd "C-0") (lambda() (interactive) (elscreen-goto 0)))
;(define-key evil-insert-state-map (kbd "C- ") (lambda() (interactive) (elscreen-goto 0)))
;(define-key evil-insert-state-map (kbd "C-1") (lambda() (interactive) (elscreen-goto 1)))
;(define-key evil-insert-state-map (kbd "C-2") (lambda() (interactive) (elscreen-goto 2)))
;(define-key evil-insert-state-map (kbd "C-3") (lambda() (interactive) (elscreen-goto 3)))
;(define-key evil-insert-state-map (kbd "C-4") (lambda() (interactive) (elscreen-goto 4)))
;(define-key evil-insert-state-map (kbd "C-5") (lambda() (interactive) (elscreen-goto 5)))
;(define-key evil-insert-state-map (kbd "C-6") (lambda() (interactive) (elscreen-goto 6)))
;(define-key evil-insert-state-map (kbd "C-7") (lambda() (interactive) (elscreen-goto 7)))
;(define-key evil-insert-state-map (kbd "C-8") (lambda() (interactive) (elscreen-goto 8)))
;(define-key evil-insert-state-map (kbd "C-9") (lambda() (interactive) (elscreen-goto 9)))

