(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "0-998f87159c718e5d4739fbb727354436b898bf57")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "998f87159c718e5d4739fbb727354436b898bf57")))
              (sha256
               (base32
                "1p0f7x6kqyahj553qayry44vw4xcs7l56nadw2bsnwajc8gq4ciz"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
