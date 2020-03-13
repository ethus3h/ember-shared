(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-a6dd0430a7960be75e4201185ee1138356a5ec55")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "a6dd0430a7960be75e4201185ee1138356a5ec55")))
              (sha256
               (base32
                "1zcv0y1m0s9iha706sxkvyq4vk502xnjpcf1fsy94yayy7kv3lwg"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
