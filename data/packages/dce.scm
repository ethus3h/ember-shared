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
    (version "1.1.4.510-b8944c9afa748bd5c24e7d0fb909d24400fa4b2a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "b8944c9afa748bd5c24e7d0fb909d24400fa4b2a")))
              (sha256
               (base32
                "0zzbr0wlwk8w4c6wsaj79vz6jirf8xf24v0cszbxax7zgsrqbmhf"))))
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
    (version "1.1.4.510-ccced214b4f28a1cecaa0a3f2fd03fd0a3ebfbc3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "ccced214b4f28a1cecaa0a3f2fd03fd0a3ebfbc3")))
              (sha256
               (base32
                "14vhbx7xyvb25vjfrdzh04z4al8d8swcfxd1cbakx5bf2kryfrg1"))))
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
    (version "1.1.4.510-35ac961d74df4316fce832e03249a1a3110eda1f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "35ac961d74df4316fce832e03249a1a3110eda1f")))
              (sha256
               (base32
                "04zaza4lw380zdjsjy4f7rdr8af2v90b5q5r3v7h48lmzrpw63c9"))))
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
    (version "1.1.4.509-7cadb360cdbcb43584a3970621d4ce150a0f8ce3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/ember-shared.git")
                (commit "7cadb360cdbcb43584a3970621d4ce150a0f8ce3")))
              (sha256
               (base32
                "1a4gaalfbv4dykdp5lv12l47zf003412xs5p8r774iz6gfpnfqb4"))))
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
    (version "0-ef0a1159c0e00c10fcd96365b81956c4d3d17452")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ethus3h/crystallize.git")
                (commit "ef0a1159c0e00c10fcd96365b81956c4d3d17452")))
              (sha256
               (base32
                "0j0ydvws1f6aikasnvy1wnsilnjiypi3iahcayxldxmjrcls8nrp"))))
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
