(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-c559be5f5733fcbd6c182689162ae801c1ca6e1e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "c559be5f5733fcbd6c182689162ae801c1ca6e1e")))
              (sha256
               (base32
                "06bpp046aqvf0wwk4qfl8j5mxxrc3r5bs49cgz1g4d78jm56ybgh"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
