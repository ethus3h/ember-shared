(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-88af4d74c384d89b43c33a008dfc34778dc9997e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "88af4d74c384d89b43c33a008dfc34778dc9997e")))
              (sha256
               (base32
                "0s85rgnv2s9lr4iqqzjp8yagdbjyvg4lj98ri1r30jwxi3d8g3k3"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
