(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-b1175e54fb2a533bfffac54f80cc7d665ce1a09b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "b1175e54fb2a533bfffac54f80cc7d665ce1a09b")))
              (sha256
               (base32
                "0hbfkc3c18qbnpkkp5anvk60ykfz76vms6x1a5mjqx1xfa52fw11"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
