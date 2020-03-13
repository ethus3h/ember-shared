(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-511afe25e133b6566fae3b20c95090cd59965f9e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "511afe25e133b6566fae3b20c95090cd59965f9e")))
              (sha256
               (base32
                "0sk4jm371g9wnb883y8x057nkgvjhcn644g6qnlcgpim8msfkpfb"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
