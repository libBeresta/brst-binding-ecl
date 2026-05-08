# brst-binding-ecl

Language bindings for the `libBeresta` library for the [**Embeddable Common Lisp**][ecl] language.

[`libBeresta`][libBeresta] is a free, open-source, cross-platform library for generating PDF files.

This repository is part of the `brst-binding-<lang>` family of
language bindings for the `libBeresta` library, intended for
[Embeddable Common Lisp][ecl]. The bindings are automatically
generated from canonical definitions presented as S-expressions in
[`gen/data/*.lsp`][gen-data], which are updated alongside the library.

## Status: v1.0.0 &ndash; Pre-release
- The library API is generated automatically from `gen/data/*.lsp`.
- Only static build is implemented.
- Build has been tested only on Linux.
- Released together with the main library.

## Required Components

By convention in the `libBeresta` library, each language binding must include two files:
- [README.md](README.md) (this file) &ndash; description of the language binding.
- [CMakeLists.txt](CMakeLists.txt) &ndash; entry point for generating binding files, checking their functionality, and building a distributable archive.

All other contents are determined by the specifics of working with projects in [ECL][ecl].

## Quick Start

### Installation
Clone the library and language binding repositories:

```sh
git clone https://github.com/libBeresta/libBeresta.git
git clone https://github.com/libBeresta/brst-binding-ecl.git
```

Build the `libBeresta` library:

```sh
cd libBeresta
cmake -S . -B build -DLIBBRST_SHARED_LIB=OFF
cmake --build build
```

### Building the Example

Return to the language binding folder and create a file `test.lisp` with the following content:

```lisp
(ext:install-c-compiler)
(setf c:*user-cc-flags* "-I../libBeresta/include -I../libBeresta/build/include -fPIC")
(setf c:*user-linker-libs* " -L../libBeresta/build/src/ -lbrst -fPIC -lz")

;; If uiop is available, the next line is correct
(pushnew (uiop/os:getcwd) asdf:*central-registry*)

;; Otherwise, replace it with
;; (pushnew "<path to current folder>" asdf:*central-registry*)

(asdf:load-system 'cl-beresta)

(load "demos/minimal")

(si:exit 0)
```

Run with ECL (version 24 or higher):

```sh
ecl --load test.lisp
```

### Example Code
The example uses the content of `demos/minimal.lisp`:

```lisp
(in-package #:cl-beresta)

(with-pdf-document (pdf "minimal.pdf")
  (let ((page (doc-page-add pdf)))
    (page-setsize page
                  page-size-a4
                  page-orientation-landscape)))
```

## Rebuilding the Library

The library uses the CMake build system and requires ECL version 24 or higher.

Build steps:

```sh
cmake -S . -B build -DLIBBRST_SHARED_LIB=OFF
cmake --build build
```

If you have multiple ECL installations, you can select a specific one using the `ECL_BINARY` build option:

```sh
cmake -S . -B build -DLIBBRST_SHARED_LIB=OFF -DECL_BINARY=/path/to/ecl/bin/ecl
cmake --build build
```

Then, build the binding files:

```sh
cmake --build build --target binding
```

Minimal testing (smoke-test):

```sh
cmake --build build --target check
```

Building an archive:
```sh
cmake --build build --target bundle
```

## License

[MIT License](LICENSE) — same as libBeresta.

## Acknowledgments

- [libHaru][libHaru] &ndash; the original PDF generation library on which libBeresta and this binding are based.
- [Kenta Ishizaki](https://github.com/55728) &ndash; for his expertise in Open Source and approaches to source texts and documentation.

[libBeresta]: https://github.com/libBeresta/libBeresta
[libHaru]: https://github.com/libharu/libharu
[gen-data]: https://github.com/libBeresta/libBeresta/tree/master/gen/data
[ecl]: https://ecl.common-lisp.dev
