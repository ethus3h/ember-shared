(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-e3084cc2b6aa066067a45b93afdd5ffa0c7547e2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "e3084cc2b6aa066067a45b93afdd5ffa0c7547e2")))
              (sha256
               (base32
                "1c37clv4wlc3cwld4jcrdr2fag4g7rykdj179v9fnp17fvym33ax"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
