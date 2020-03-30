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

; If the build fails: ./pre-inst-env guix build -K ember-shared-main
; cd /tmp/guix-build-ember-shared-main-1.1.4.497-1e1d27a9115b400d1580705bc4a223e98afdb791.drv-1
; /nvme0n1p5/ember-auto-build/guix/pre-inst-env guix environment --no-grafts -C ember-shared-main

; guix build -e "(@ (gnu packages gcc) gcc)"
; guix build --check --no-substitutes --no-grafts -e "(@ (gnu packages gcc) gcc)"

; Interactive use:
#!
/nvme0n1p5/ember-auto-build/guix/pre-inst-env guile
(use-modules (ice-9 readline))
(activate-readline)
(use-modules (guix utils))
(pk (%current-system))
(use-modules (guix build utils))
!#


(define-module (gnu packages ddc)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix licenses)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages moreutils)
  #:use-module (gnu packages nano)
  #:use-module (gnu packages ncdu)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages php)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages search)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages web) ; python-internetarchive
  #:use-module (gnu packages wget)
)

(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "1.1.4.530-059e511cb6e61f71033c141fd92725f289eb502c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "059e511cb6e61f71033c141fd92725f289eb502c")))
              (sha256
               (base32
                "028zifdm5mlhv6r9v8xybnkzdpzzy1abx6g84a3wvzzx7vghfjps"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module=error-notify") #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs `(
        ("procps" ,procps)
        ("xxd" ,xxd)
    ))
    (synopsis "ember-shared error-notify script")
    (description "Shell script to notify of errors")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))

(define-public ember-shared-core
  (package
    (name "ember-shared-core")
    (version "1.1.4.530-e19a1733003ecc34ed2e473cd1e0d6c919e4aec8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "e19a1733003ecc34ed2e473cd1e0d6c919e4aec8")))
              (sha256
               (base32
                "0crpzx791w06zj97fs6rp8ws87rln2pxwznz2n3fd5mpiz6hgh8m"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module=core") #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs `(
        ("bc" ,bc)
        ("ember-shared-error-notify" ,ember-shared-error-notify)
        ; many inputs this needs are implicit in the build system: bash, coreutils, sed, gawk, diffutils
        ("perl" ,perl)
        ("util-linux" ,util-linux)
        ("xxd" ,xxd)
    ))
    (synopsis "ember-shared core")
    (description "Shell script library core module")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license (list agpl3+ gpl3+))))

(define-public ember-shared-main
  (package
    (name "ember-shared-main")
    (version "1.1.4.530-f5c92c580f5ef8d6edf862f2184e8922dc317f18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "f5c92c580f5ef8d6edf862f2184e8922dc317f18")))
              (sha256
               (base32
                "1l6paqbj4zlaq9g6bc5qg33nlp2j78dyqp697g1sj4x6y6gazf6l"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module=main") #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs `(
        ("ember-shared-core" ,ember-shared-core)
        ; inputs this needs are implicit in the build system: grep, findutils
        ("nano" ,nano)
        ("sudo" ,sudo)
    ))
    (synopsis "ember-shared core")
    (description "Shell script library main module")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))

(define-public ember-shared-extra
  (package
    (name "ember-shared-extra")
    (version "1.1.4.530-4bada1d500db872429e586cd797b33dd2d06c1f2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "4bada1d500db872429e586cd797b33dd2d06c1f2")))
              (sha256
               (base32
                "0k2n6z5xl1d5p6wl4mlwsmfrv2khfw5cipf7510z4fhis94z7i95"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module=extra") #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs `(
        ("ember-shared-main" ,ember-shared-main)
        ; inputs this needs are implicit in the build system: grep, findutils
        ; csum (depends hashdeep), ember_bash_setup_extra (see for dependencies), ember-shared-update, findq/findq-update (depend locate), htmlToText.pl (depends HTML::Restrict), serve-ember-web-site (depends PHP & futuramerlin-web-toolkit), wave2png.py (depends wave, matplotlib, pylab (part of matplotlib)). ia, wget, rsync, sshpass, ssh, csvfix, jq, grab-site, phantomjs, ldconfig, python, ffmpeg, youtube-dl, git, sqlite3, moreutils, imagemagick, xz; guix
        ; Miscellaneous scripts' dependencies:
        ("hashdeep" ,hashdeep) ; csum
        ("mlocate" ,mlocate) ; findq/findq-update
        ("perl" ,perl) ; htmlToText.pl
        ;("perl-html-restrict" ,perl-html-restrict) ; htmlToText.pl
        ("php" ,php) ; serve-ember-web-site
        ;("futuramerlin-web-toolkit" ,futuramerlin-web-toolkit) ; serve-ember-web-site
        ("python" ,python) ; wave2png.py
        ("python-matplotlib" ,python-matplotlib) ; wave2png.py
        ; Main ember_bash_setup_extra dependencies:
        ("python-internetarchive" ,python-internetarchive)
        ("wget" ,wget)
        ("rsync" ,rsync)
        ("openssh" ,openssh)
        ("sshpass" ,sshpass)
        ;("csvfix" ,csvfix)
        ("jq" ,jq)
        ;("grab-site" ,grab-site)
        ;("phantomjs" ,phantomjs)
        ("glibc" ,glibc) ; available but not propagated by default, I think?? Not sure how to tell for sure. Provides ldconfig
        ("ffmpeg" ,ffmpeg)
        ("youtube-dl" ,youtube-dl)
        ("git" ,git)
        ("sqlite" ,sqlite)
        ("moreutils" ,moreutils)
        ("imagemagick" ,imagemagick)
        ("xz" ,xz)
        ("guix" ,guix)
    ))
    (synopsis "ember-shared extra")
    (description "Shell script library extra module")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license agpl3+)))

(define-public crystallize
  (package
    (name "crystallize")
    (version "3.1.2.5.14.350-574392b165412bf313a48d850072b2038bf7fda7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/crystallize.git")
                (commit "574392b165412bf313a48d850072b2038bf7fda7")))
              (sha256
               (base32
                "1wcjrzpl4iv9w7s5bvrpr6y7bb0pyc1aix8iy67kc9bkf07a0188"))))
    (build-system gnu-build-system)
    (propagated-inputs `(
        ("ember-shared-extra" ,ember-shared-extra)
        ("ncdu" ,ncdu)
        ; python fuse
        ;("futuramerlin-web-toolkit" ,futuramerlin-web-toolkit) ; for egup-web
    ))
    (synopsis "Collection of tools for working with files and filesystems")
    (description "Collection of tools for working with files and filesystems")
    (home-page "http://futuramerlin.com/ancillary/crystallize/")
    (license (list agpl3+ bsd-2))))

(define-public ddc-common-attributes
        (package
            ; do-nothing package to hold common aspects of ddc packages
            (name "ddc-common-attributes")
            (version "0-2b2ae3b85e8f66cc121c2ef5de85e5532b787fa7")
            (build-system trivial-build-system)
            (source (origin
                (method git-fetch)
                (uri (git-reference
                    (url "https://github.com/ethus3h/ember-information-technology-environment.git")
                    (commit "2b2ae3b85e8f66cc121c2ef5de85e5532b787fa7")))
                (sha256
                (base32
                    "0xy969jdpl2nardslfjz0vh70rncmz71qm9qghaq0n6y41h16jfr"))
                (modules '((guix build utils)))
                (snippet '(begin
                    (for-each delete-file-recursively '(".egup.stat" ".stagel-cache" "built"))
                    (for-each delete-file-recursively (find-files "tests" "^run$" #:directories? #t)) ; "run" folders hold the generated output, while "out" folders hold the expected output
                    #t
                ))
            ))
            (synopsis "Deterministic Document Computing")
            (description "Document-centric software environment")
            (home-page "http://futuramerlin.com/specification/engineering-and-tech/information-technology/software/")
            (license (list
                agpl3+
                unicode
                silofl1.1 ; soccer.otf
                ; FIXME: papaparse
                (x11-style "file://thirdparty-licenses/LICENSE.base16b.md")
                (x11-style "file://thirdparty-licenses/LICENSE.kde-syntax-highlighting.md")
                (x11-style "file://thirdparty-licenses/LICENSE.wtf8.md")
            ))
            (propagated-inputs `(
                ("ember-shared-core" ,ember-shared-core)
            ))
        )
)

(define-public ddc-dist
    (hidden-package
        (package
            (inherit ddc-common-attributes)
            (name "ddc-dist")
            (build-system gnu-build-system)
            (arguments '(
                #:configure-flags '("--" "--build-type" "dist")
                #:phases (modify-phases %standard-phases
                    (
                        add-after 'unpack 'prepare-additional
                            (lambda* (#:key inputs #:allow-other-keys)
                                (mkdir-p "build-temp/distfiles/")
                                (copy-file (assoc-ref inputs "ddc-input-ucd") (string-append "build-temp/distfiles/" (strip-store-file-name (assoc-ref inputs "ddc-input-ucd"))))
                                (invoke "bash" "./support/build-scripts/dist-unpack")
                                (invoke "touch" "build-temp/dist-already-unpacked")
                            )
                    )
                )
            ))
            (inputs `(
                ("ddc-input-ucd" ,ddc-input-ucd)
                ("unzip" ,unzip) ; to unpack distfiles
            ))
        )
    )
)

(define-public ddc-data
    (hidden-package
        (package
            (inherit ddc-common-attributes)
            (name "ddc-data")
            (build-system gnu-build-system)
            (arguments '(
                #:configure-flags '("--" "--build-type" "data")
            ))
        )
    )
)

(define-public ddc-bootstrap
    (hidden-package
        (package
            (inherit ddc-common-attributes)
            (name "ddc-bootstrap")
            (build-system gnu-build-system)
            (arguments '(
                #:configure-flags '("--" "--build-type" "bootstrap")
            ))
        )
    )
)

(define-public ddc-implementation-parts
    (hidden-package
        (package
            (inherit ddc-common-attributes)
            (name "ddc-implementation-parts")
            (build-system gnu-build-system)
            (arguments '(
                #:configure-flags '("--" "--build-type" "implementation-parts")
            ))
            (inputs `(
                ("ddc-bootstrap" ,ddc-bootstrap)
            ))
            (propagated-inputs `(
                ("ember-shared-core" ,ember-shared-core)
            ))
        )
    )
)

(define-public ddc-main
    (hidden-package
        (package
            (inherit ddc-common-attributes)
            (name "ddc-main")
            (build-system gnu-build-system)
            (arguments '(
                #:configure-flags '("--" "--build-type" "ddc")
            ))
        )
    )
)

(define-public ddc-web
    (hidden-package
        (package
            (inherit ddc-common-attributes)
            (name "ddc-web")
            (build-system gnu-build-system)
            (arguments '(
                #:configure-flags '("--" "--build-type" "web")
            ))
            (inputs `(
                ("ddc-dist" ,ddc-dist)
                ("ddc-data" ,ddc-data)
                ("ddc-implementation-parts" ,ddc-implementation-parts)
                ("ddc-main" ,ddc-main)
            ))
        )
    )
)

(define-public ddc-edit-webextension
    (hidden-package
        (package
            (inherit ddc-common-attributes)
            (name "ddc-edit-webextension")
            (build-system gnu-build-system)
            (arguments '(
                #:configure-flags '("--" "--build-type" "edit-webextension")
            ))
            (inputs `(
                ("ddc-web" ,ddc-web)
            ))
        )
    )
)

(define-public ddc
  (package
    (inherit ddc-common-attributes)
    (name "ddc")
    (build-system gnu-build-system)
    (arguments '(
        #:configure-flags '("--" "--build-type" "none")
    ))
    (propagated-inputs `(
        ("ddc-web" ,ddc-web)
        ("ddc-edit-webextension" ,ddc-edit-webextension)
        ("ember-shared-core" ,ember-shared-core)
        ; can use srsync from crystallize to copy the built webextension
    ))
    ))

; DDC distfiles

(define ddc-input-ucd
    ; This is a hidden package-ish thing that is used as an input to the main ddc package. It just returns the ZIP file. To get the source for ddc including this package, use "guix build --sources=all ddc".
    (let ((version "12.0.0"))
    (origin
              (method url-fetch)
              (uri (string-append "https://www.unicode.org/Public/" version "/ucdxml/ucd.all.flat.zip"))
              (file-name (string-append "ucd.all.flat-" version ".zip"))
              (sha256
               (base32
                "18nmj93m71jl399bzzdlprz8w7idcmbg71x3fz0lpj62sl0jhpnq"))
        )
))

; Dependencies

(define-public hashdeep
  (package
    (name "hashdeep")
    (version "4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jessek/hashdeep/archive/release-" version ".tar.gz"))
              (sha256
               (base32
                "0inciwf5av0jzb5z2cp75vaw7n12s20fkjmdcr2qsy4w5as8mnnv"))
              ; Remove bundled dependencies and binaries
              ; Also remove the test suite, since it depends on a pre-built known good binary to test against
              (modules '((guix build utils)))
              (snippet '(begin
                    (for-each delete-file-recursively '("dist" "tests"))
                    (substitute* "bootstrap.sh" (("/bin/rm") "rm"))
                    (substitute* "Makefile.am"
                        (("src tests man tests/testfiles") "src man")
                    )
                    (substitute* "configure.ac"
                        (("tests/Makefile tests/testfiles/Makefile") "")
                    )
                    #t
              ))
            ))
    (build-system gnu-build-system)
    (arguments '(
        #:phases (modify-phases %standard-phases (
            add-after 'patch-source-shebangs 'run-bootstrap-script (
                lambda _ (invoke "bash" "./bootstrap.sh")
            )
        ))
    ))
    (inputs `(
        ("autoconf" ,autoconf)
        ("automake" ,automake)
        ("bash" ,bash)
    ))
    (synopsis "recursively calculate file hashes in a directory tree")
    (description "Recursively calculates file hashes in a directory tree.")
    (home-page "https://github.com/jessek/hashdeep")
    (license (list public-domain gpl2 lgpl2.1+))))