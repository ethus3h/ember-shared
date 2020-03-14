(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-05b6450387cc38aef73160914b57cb54c22115f3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "05b6450387cc38aef73160914b57cb54c22115f3")))
              (sha256
               (base32
                "1b880xihcwmcw75mqsy9l6jnlrxp6ps1gjk7whr4yp4xrx939kwp"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
