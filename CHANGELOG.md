# Changelog

## [3.4] - 2026-08-31

**Status:** release

### Added

- ISAPDI Simulation Lab card beside RIPPLE with a direct Render launch button
  and a free-hosting startup-delay notice.
- Dependency-free checks for demo links, accessible markup, and version metadata.

### Changed

- The section heading now covers both optimization and simulation labs.
- README, footer, and VERSION identify website revision 3.4.

### Validation

- `python -m unittest discover -s tests -v`: 5/5 passed.
- Publication verification: check the GitHub Pages workflow and the public
  simulation card after merge.

### Compatibility and migration

- Backward compatible; existing RIPPLE links, the book, and all other sections
  are preserved. No model, data, API, hosting, or repository visibility changes.
- Retains the established two-part website revision convention.

### Known limitations

- Render's free instance can take 50 seconds or more to wake after inactivity.
- This portfolio revision does not validate simulation execution or resolve
  application runtime incidents.
- Browser-based visual and interaction testing was not performed for this
  static link addition.
