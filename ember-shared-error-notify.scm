(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-9cdbe634b4964d0cb30a279d1688ef6b70cf27e7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "9cdbe634b4964d0cb30a279d1688ef6b70cf27e7")))
              (sha256
               (base32
                "1mamm2f4dlvrp1dxmiyg4vx3z7vh8rxs1p81d0pxpn47l1f63yg5"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
