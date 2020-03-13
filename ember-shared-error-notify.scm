(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-583d03aef1f34a2ffad6a09d82292501585d9e5e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "583d03aef1f34a2ffad6a09d82292501585d9e5e")))
              (sha256
               (base32
                "0p2sdxjamgq0c2pslqjgb90v25q8ky26l8vckrzii2dwywjsidrp"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
