;;; radian-python.el --- Support for Python

(require 'radian-autocomplete)
(require 'radian-package)

;; Integrated development environment for Python.
(use-package anaconda-mode
  :init

  ;; Enable the functionality of anaconda-mode in Python buffers, as
  ;; suggested in the README [1].
  ;;
  ;; [1]: https://github.com/proofit404/anaconda-mode
  (add-hook 'python-mode-hook #'anaconda-mode)

  :diminish anaconda-mode)

;; Company integration for anaconda-mode.
(use-package company-anaconda
  :recipe (:fetcher github
           :repo "raxod502/company-anaconda"
           :branch "radian-1")

  :init

  (with-eval-after-load 'company
    ;; Enable the functionality of company-anaconda in Python buffers,
    ;; as suggested in the README [1].
    ;;
    ;; [1]: https://github.com/proofit404/company-anaconda

    (defun radian--enable-company-anaconda ()
      (add-to-list 'company-backends #'company-anaconda))

    (add-hook 'python-mode-hook #'radian--enable-company-anaconda)))

(provide 'radian-python)

;;; radian-python.el ends here