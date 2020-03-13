(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-0c08f2a7d286a04ec8342994f3339b30f52eda61")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "0c08f2a7d286a04ec8342994f3339b30f52eda61")))
              (sha256
               (base32
                "1khl1jqsak2g9ai3514v2q8mp11fr10czknwf46c9gch6qzlwh4h"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
