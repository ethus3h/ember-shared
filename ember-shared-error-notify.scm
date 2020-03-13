(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-93b8c1fed1a17d2c440a5052926c0eac3995b75c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "93b8c1fed1a17d2c440a5052926c0eac3995b75c")))
              (sha256
               (base32
                "0m4hm8h18hzdan9ly23xbfl31v3sws9lvn8kg44ajk6h2zcpzjwp"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
