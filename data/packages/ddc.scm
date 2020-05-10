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
; or /nvme0n1p5/ember-auto-build/guix/pre-inst-env guix environment --no-grafts -C -e "(@ (gnu packages ddc) ddc-data)"

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
  #:use-module (gnu packages backup)
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
    (version "1.1.4.582-3d1c7e4e978994020ce4aff9ed371589cfd02d42")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "3d1c7e4e978994020ce4aff9ed371589cfd02d42")))
              (sha256
               (base32
                "1pg7ypmvb8cmzn3zz7j5y4dd831ak3myr2ya0hbjr0n5cy3d32qa"))))
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
    (version "1.1.4.582-411f3f76bcccfc028f32eaae7cd0f14d3d5d62ea")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "411f3f76bcccfc028f32eaae7cd0f14d3d5d62ea")))
              (sha256
               (base32
                "13sl30f057f5zxvs5br0sighnzcalk5v1v731xny7qbhs6dwrn5m"))))
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
    (version "1.1.4.582-89a34ab5be09a7fe660c0d3bd5f3262723a0a799")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "89a34ab5be09a7fe660c0d3bd5f3262723a0a799")))
              (sha256
               (base32
                "01bfmjvlx3xzbbjssaf1npav2d5408py3iaq03x3qqqij2c32p2a"))))
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
    (version "1.1.4.582-bf0c92718521c24b34447aec2145584ad511eaa1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "bf0c92718521c24b34447aec2145584ad511eaa1")))
              (sha256
               (base32
                "1s2aki1sc30frwmmg76x95z8yalqdbg2l9v7abwv4n4i0c5jiwj3"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module=extra") #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs `(
        ("ember-shared-main" ,ember-shared-main)
        ; inputs this needs are implicit in the build system: grep, findutils
        ; csum (depends hashdeep), borgw (depends borg), ember_bash_setup_extra (see for dependencies), ember-shared-update, findq/findq-update (depend locate), htmlToText.pl (depends HTML::Restrict), serve-ember-web-site (depends PHP & futuramerlin-web-toolkit), wave2png.py (depends wave, matplotlib, pylab (part of matplotlib)). ia, wget, rsync, sshpass, ssh, csvfix, jq, grab-site, phantomjs, ldconfig, python, ffmpeg, youtube-dl, git, sqlite3, moreutils, imagemagick, xz; guix
        ; Miscellaneous scripts' dependencies:
        ("hashdeep" ,hashdeep) ; csum
        ("borg" ,borg)
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
    (version "3.1.2.5.14.368-41438d1d2c03280bd46265cd85d83edcb16360ef")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/crystallize.git")
                (commit "41438d1d2c03280bd46265cd85d83edcb16360ef")))
              (sha256
               (base32
                "0vqw43pgz884pr1s0p3ln32kr6fg0fayg2asqscvxr0s4m47h0j1"))))
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
            (version "0-efe15d4fab549d7d41100cf64e61e0e6df9d3d69")
            (build-system trivial-build-system)
            (source (origin
                (method git-fetch)
                (uri (git-reference
                    (url "https://github.com/ethus3h/ember-information-technology-environment.git")
                    (commit "efe15d4fab549d7d41100cf64e61e0e6df9d3d69")))
                (sha256
                (base32
                    "0cs2qlhpksy146zxfysi1q2qlln1p3hlpjyd7iwwmx11fxmnl1b8"))
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
            (inputs `(
                ("ddc-dist" ,ddc-dist)
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
            (inputs `(
                ; actually only requires ddc-dist, except to maintain the chain of modules
                ("ddc-data" ,ddc-data)
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
                #:configure-flags '("--" "--build-type" "main")
            ))
            (inputs `(
                ; actually only requires ddc-dist, except to maintain the chain of modules
                ("ddc-implementation-parts" ,ddc-implementation-parts)
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
                ; these first two are required if not for the adjustments to maintain the chain of modules
                ;("ddc-data" ,ddc-data)
                ;("ddc-implementation-parts" ,ddc-implementation-parts)
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
        #:configure-flags '("--" "--build-type" "meta") ))
    (propagated-inputs `(
        ;("ddc-web" ,ddc-web) required if not for the chain of modules
        ("ddc-edit-webextension" ,ddc-edit-webextension)
        ("ember-shared-core" ,ember-shared-core)
        ; can use srsync from crystallize to copy the built webextension
    )) ))

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
