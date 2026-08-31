# Changelog

## [3.5] - 2026-08-31

**Status:** release

### Changed

- Move the complete book section to the end of the portfolio, directly above
  the footer. Preserve its content, cover, PDF links, and navigation anchor.
- Preserve the relative order and content of all other sections, including
  RIPPLE and ISAPDI.
- Synchronize VERSION, README, and footer with revision 3.5.

### Validation

- `python -m unittest discover -s tests -v`: 6/6 passed.
- Exact source comparison confirms the book block is unchanged and all
  non-book sections retain their content and order.
- Publication verification: check the GitHub Pages workflow after merge.

### Compatibility and migration

- Backward compatible; no asset, URL, model, API, hosting, or visibility changes.
  No migration required.

### Known limitations

- Static checks do not execute the external labs or provide browser visual QA.
- The existing Render free-hosting startup delay remains unchanged.

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
