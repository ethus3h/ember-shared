(define-public TEMPLATE-PLACEHOLDER-PACKAGENAME
  (package
    (name "TEMPLATE-PLACEHOLDER-PACKAGENAME")
    (version "0-TEMPLATE-PLACEHOLDER-COMMIT")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "TEMPLATE-PLACEHOLDER-COMMIT")))
              (sha256
               (base32
                "TEMPLATE-PLACEHOLDER-HASH"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
