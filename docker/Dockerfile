# syntax=docker/dockerfile:1
#
# Reproducible PDF build environment for the Architecture and Reference Framework.
#
# pandoc/extra already bundles:
#   - pandoc
#   - the Eisvogel LaTeX template
#   - a TeX Live installation curated for Eisvogel
# We only add GNU make so the repo's Makefile runs unchanged.
#
# Reproducibility model: the floating base tag below is resolved once, at image
# build time, and captured into our published, digest-pinned image. Downstream
# workflows reference THIS image by @sha256 digest, so neither the pandoc version
# nor the TeX Live package set can drift under them. Bump the base tag here (and
# re-run the build-pdf-image workflow) to deliberately upgrade.
FROM pandoc/extra:latest

# The Alpine-based pandoc image ships pandoc + TeX Live but not GNU make (needed
# by the repo Makefile) or zip (needed by the zip-pdfs target).
USER root
RUN apk add --no-cache make zip

# The PDF/A-2b output configured via `pdfstandard` in pandoc/metadata.yml needs
# pdfmanagement-testphase on LaTeX kernels older than 2025-11 (where the
# functionality was integrated into the kernel and the package retired from
# current CTAN mirrors). The base image's TeX Live has such a kernel, but its
# tlmgr points at a current mirror that no longer carries the package, so
# install it from the frozen archive matching the installed TeX Live year.
# The kpsewhich guard makes this a no-op once a future base ships the
# integrated kernel.
RUN kpsewhich pdfmanagement-testphase.sty >/dev/null 2>&1 || { \
      TLYEAR=$(tlmgr --version | sed -n 's/.*version \([0-9]\{4\}\).*/\1/p') && \
      tlmgr option repository "https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/${TLYEAR}/tlnet-final" && \
      tlmgr install pdfmanagement-testphase && \
      tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet ; \
    }

# pandoc/extra sets ENTRYPOINT to `pandoc`; reset it so `make` and shell commands
# run normally when the image is used as a CI job container or via `docker run`.
ENTRYPOINT []
CMD ["/bin/sh"]
