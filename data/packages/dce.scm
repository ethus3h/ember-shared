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

(define-module (gnu packages dce)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages nano)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages search)
  #:use-module (gnu packages php)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages web) ; python-internetarchive
  #:use-module (gnu packages wget)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages base)
  #:use-module (gnu packages video)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages moreutils)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages autotools)
)

(define-public ember-shared-error-notify
  (package
    (name "ember-shared-error-notify")
    (version "1.1.4.515-5f7e8b0d8cfdd11ab2e3c52f8d2f7e3108d2e012")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "5f7e8b0d8cfdd11ab2e3c52f8d2f7e3108d2e012")))
              (sha256
               (base32
                "0qx5q7ri0am7q1qq2zbh3m2x83wgqabjg70x98dx0zkfs4rlifq6"))))
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
    (version "1.1.4.515-b9e20a8a1944d8491956a719d8a585b6e4b718a5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "b9e20a8a1944d8491956a719d8a585b6e4b718a5")))
              (sha256
               (base32
                "06lsmjhyxri91q2sl5dlypmilkxcr6jwjd39bi50l49zfizr6a1j"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--module=core") #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs `(
        ("ember-shared-error-notify" ,ember-shared-error-notify)
        ; many inputs this needs are implicit in the build system: bash, coreutils, sed, gawk, diffutils
        ("util-linux" ,util-linux)
        ("perl" ,perl)
        ("xxd" ,xxd)
    ))
    (synopsis "ember-shared core")
    (description "Shell script library core module")
    (home-page "http://futuramerlin.com/ancillary/ember-shared/")
    (license (list agpl3+ gpl3+))))

(define-public ember-shared-main
  (package
    (name "ember-shared-main")
    (version "1.1.4.515-dae646deda98224a0e6248900e1008b772445048")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "dae646deda98224a0e6248900e1008b772445048")))
              (sha256
               (base32
                "0mgh5614hym6izmh5ydvx7zwi02q7gjcf0zp43ccb45qgp3bbylp"))))
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
    (version "1.1.4.514-fefc9bb559c1f8444ba4c9be2418151d7589f1a5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "fefc9bb559c1f8444ba4c9be2418151d7589f1a5")))
              (sha256
               (base32
                "0c53shnmplb20w1v2k2994bh30fd3pmzjybnhsx7q8a8xy56a0r5"))))
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
    (version "0-4142aa518d749cf2273a38aa128c56c6a99059b8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/crystallize.git")
                (commit "4142aa518d749cf2273a38aa128c56c6a99059b8")))
              (sha256
               (base32
                "166fzq2vwxgbxfj8anwgrc41xrjm11zssj0c0b9hgqmg68bjs2ik"))))
    (build-system gnu-build-system)
    (propagated-inputs `(
        ("ember-shared-extra" ,ember-shared-extra)
        ;("futuramerlin-web-toolkit" ,futuramerlin-web-toolkit) ; for egup-web
    ))
    (synopsis "Collection of tools for working with files and filesystems")
    (description "Collection of tools for working with files and filesystems")
    (home-page "http://futuramerlin.com/ancillary/crystallize/")
    (license (list agpl3+ bsd-2))))

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
    ))
    (synopsis "recursively calculate file hashes in a directory tree")
    (description "Recursively calculates file hashes in a directory tree.")
    (home-page "https://github.com/jessek/hashdeep")
    (license (list public-domain gpl2 lgpl2.1+))))
