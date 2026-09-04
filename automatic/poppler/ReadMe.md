# [Poppler](https://chocolatey.org/packages/poppler)

Poppler is a PDF rendering library based on the [xpdf-3.0](http://www.foolabs.com/xpdf) code base.

This package installs the prebuilt, self-contained Windows binaries from [oschwartz10612/poppler-windows](https://github.com/oschwartz10612/poppler-windows) (conda-forge based build with all dependency DLLs included).

Versioning: chocolatey.org already hosts source-only poppler packages up to 26.6.0, so binary releases are published as `26.6.0.<encoded binary version>` (see `update.ps1`) until poppler-windows versions overtake 26.6.0.