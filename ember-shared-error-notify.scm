(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-e2f239e508edce43bd4dd678b5663e5526e69b50")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "e2f239e508edce43bd4dd678b5663e5526e69b50")))
              (sha256
               (base32
                "1zzkdvwxvczcijrins5ia4i7rnzkamzzc3g5nn4h4crwsrgzp2xq"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
