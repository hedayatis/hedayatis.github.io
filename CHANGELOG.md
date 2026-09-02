# Changelog

## [3.7] - 2026-09-02

**Status:** release

### Added

- RevMode for LaTeX portfolio card with its single-source, three-view revision
  workflow, Overleaf/TeXstudio compatibility, open-source repository and direct
  template ZIP links.
- Regression coverage for the new card, workflow claims and public links.

### Changed

- Broaden the labs heading and masthead link to include open research tools.
- Synchronize VERSION, README and footer to revision 3.7.

### Validation

- `python -B -m unittest discover -s tests -v`: 8/8 passed.
- HTML parsing and accessibility-reference checks passed.

### Compatibility and migration

- Backward compatible; existing public URLs, lab cards, book assets and section
  order are preserved. No migration or hosting-provider change.

### Known limitations

- Static tests do not execute external applications or verify GitHub service
  availability.
- GitHub Pages publication must be verified after merge.

## [3.6] - 2026-08-31

**Status:** release

### Added

- Retail Analytics Lab card alongside RIPPLE and ISAPDI, with live-demo and
  public-source links, a three-stage pipeline overview and demonstrated skills.
- Explicit distinction between full-population summaries and sample-based
  browser execution, plus dataset-use and runtime-download notices.
- Regression check for analytics links, claims and accessibility references.

### Changed

- Broaden the lab heading and navigation label to include analytics.
- Synchronize VERSION, README and footer to revision 3.6.

### Validation

- `python -B -m unittest discover -s tests -v`: 7/7 passed.
- Source comparison preserves the existing lab cards, book and section order.
- Check the Pages deployment and live links after merge.

### Compatibility and migration

- Backward compatible; existing URLs and content remain intact, with the book
  still last above the footer. No migration or hosting-provider change.

### Known limitations

- Static checks do not execute browser WebAssembly runtimes or provide visual QA.
- External-app availability and initial runtime downloads depend on their hosts.

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
