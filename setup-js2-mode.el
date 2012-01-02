(setq-default js2-allow-rhino-new-expr-initializer nil)
(setq-default js2-auto-indent-p nil)
(setq-default js2-basic-offset 2)
(setq-default js2-enter-indents-newline nil)
(setq-default js2-global-externs '("module" "require" "jQuery" "$" "_" "buster" "sinon" "assert" "refute"))
(setq-default js2-idle-timer-delay 0.1)
(setq-default js2-indent-on-enter-key nil)
(setq-default js2-mirror-mode nil)
(setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-auto-indent-p t)
(setq-default js2-rebind-eol-bol-keys nil)
(setq-default js2-mode-show-parse-errors nil)
(setq-default js2-include-rhino-externs nil)
(setq-default js2-include-gears-externs nil)

(require 'js2-mode)

;; Expand and contract object
(define-key js2-mode-map (kbd "C-S-e") 'js-expand-object)
(define-key js2-mode-map (kbd "C-S-c") 'js-contract-object)

;; Line movement
(define-key js2-mode-map (kbd "<C-S-down>") 'js-move-line-down)
(define-key js2-mode-map (kbd "<C-S-up>") 'js-move-line-up)

;; Extract JavaScript variables
(define-key js2-mode-map (kbd "C-c x") 'js-extract-variable)

;; js2-mode steals TAB, let's steal it back for yasnippet
(defun js2-tab-properly ()
  (interactive)
  (let ((yas/fallback-behavior 'return-nil))
    (unless (yas/expand)
      (indent-for-tab-command)
      (if (looking-back "^\s*")
          (back-to-indentation)))))

(define-key js2-mode-map (kbd "TAB") 'js2-tab-properly)

(provide 'setup-js2-mode)