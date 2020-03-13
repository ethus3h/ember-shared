(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "ember-shared-error-notify")))
              (sha256
               (base32
                "1xiykbfka519b5pbahhd48v23y59vg1dhgg5ka871hkqqqf5i4i3"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
