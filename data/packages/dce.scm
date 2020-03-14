;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu packages dce)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (gnu packages vim))

(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "1.1.4.476-dcd0100376027e41a420ef32b96ebc48b4087f52")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "dcd0100376027e41a420ef32b96ebc48b4087f52")))
              (sha256
               (base32
                "1wbwi6gjbiql5zis7qvawqm45q60z6q5lhla86190rz9kz4adrbn"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs `(("xxd" ,xxd)))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))

(define-public ember-shared-core
  (package
    (name "ember-shared-core")
    (version "1.1.4.476-3357ea18d9f6f8029a8def5ebabcab7f40e4a346")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "3357ea18d9f6f8029a8def5ebabcab7f40e4a346")))
              (sha256
               (base32
                "1zd334b1gh8chp47kcpn9pw8szpihpybj2sarvr7r60k01h5wvb0"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module" "core") #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs `(
        ("ember-shared-error-notify" ,ember-shared-error-notify)
        ; many inputs this needs are implicit in the build system: bash, coreutils, util-linux, sed, gawk, diffutils
        ("util-linux" ,util-linux)
        ("perl" ,perl)
        ("xxd" ,xxd)
    ))
    (synopsis "ember-shared core")
    (description "Shell script library core module")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))
