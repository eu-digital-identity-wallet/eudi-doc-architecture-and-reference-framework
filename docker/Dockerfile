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

# pandoc/extra sets ENTRYPOINT to `pandoc`; reset it so `make` and shell commands
# run normally when the image is used as a CI job container or via `docker run`.
ENTRYPOINT []
CMD ["/bin/sh"]
