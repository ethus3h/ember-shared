(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-c1a68ba449ee2bc7de8220c9f109c1de16a08f97")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "c1a68ba449ee2bc7de8220c9f109c1de16a08f97")))
              (sha256
               (base32
                "1zar1mlfrn7lk55k8fs5lqrpbzabhwyhviwc7p0gi1xyqm2kzy8i"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
