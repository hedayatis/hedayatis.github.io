# Changelog

## [4.2] - 2026-10-26

**Status:** release

### Fixed

- Conference contributions: eight peer-reviewed, not six. The headline
  figure and the publications list now include CORS/INFORMS International
  Conference 2022 and the 9th INFORMS TSL Workshop 2021, matching the
  academic CV (confirmed by Sam, 26 October 2026). The CV page states the
  count and labels the list peer-reviewed (CV v1.1, PDF regenerated).

### Validation

- `python -B -m unittest discover -s tests -v`: 12/12 passed.

## [4.1] - 2026-10-26

**Status:** release

### Added

- A detailed CV page (`cv.html`) in the v4.0 design, with an A4 print layout
  and a five-page PDF (`assets/Sajjad_Hedayati_CV.pdf`) generated from it.
  It merges the industry CV (v4.1, 15 October 2026) and the academic CV
  (October 2026): experience with outcome bullets, research contributions,
  the doctoral thesis title, eight conference contributions with full titles,
  manuscripts in preparation, research projects, graded skills, labs,
  languages and certification.
- CV links in the section bar, the masthead and the footer.
- A regression check that the CV page and PDF exist, are linked, stay ASCII
  and carry nothing private.

### Removed from the public CV by design

- Phone number, relocation and notice-period lines, the contract end date,
  pending funding applications and the planned 2027 visit, and referees'
  email addresses ("References available on request" instead).

### Validation

- `python -B -m unittest discover -s tests -v`: 12/12 passed.
- CV rendered at 1280 px and 390 px with no failed requests and no horizontal
  overflow; PDF checked page by page.

## [4.0] - 2026-10-26

**Status:** release

### Added

- Lead the page with the strongest verified result: the simulation tool that
  provided the key evidence behind Flanders Make's decision to continue funding
  the programme, with a spec sheet of what was built and how it was delivered.
- Builder positioning in the masthead: "I build the model, then the tool people
  run it in."
- A sticky section bar, a route-to-decision brand mark and favicon, a numbered
  section system, and a hero schematic that draws one route through a candidate
  set. The schematic shows the shape of the problem, not a result.
- A headline-figures strip, a GitHub profile link, and a closing contact band.
- Regression checks that the funding result leads the page, that the source
  stays pure ASCII, and that no availability, permit or job-seeking wording
  reaches the public page.

### Changed

- Replace the v3.8 identity with a new brand system: warm paper, near-black ink
  and one vermilion signal colour; Instrument Serif, Inter and JetBrains Mono.
- Redesign every section: outcome cards with large figures, numbered lab cards,
  a two-column capability grid, a timeline, numbered publications.
- Recolour all existing hand-drawn schematics and journal-paper animations to
  the new palette without redrawing them.
- Reword "dashboards" as self-service reporting and decision tools, matching
  the builder positioning.

### Fixed

- The process-analytics capability claimed "six years inside operations"; the
  verified record is six positions totalling three years and three months. The
  card now says "six positions in operating companies", consistent with the
  track record.

### Validation

- `python -B -m unittest discover -s tests -v`: 11/11 passed.
- Rendered in Chromium at 1440 px (light and dark) and 390 px: fonts load, no
  console errors, no horizontal overflow.
- Text and accent pairings measure at least 4.66:1 contrast in light mode and
  6.28:1 in dark mode.

### Compatibility

- Every external link, lab card id and anchor from 3.8 is preserved. The page
  remains a single self-contained HTML file with no JavaScript or build step.

## [3.8] - 2026-09-02

**Status:** release

### Added

- A complete operating-system-aware dark theme covering page surfaces, cards,
  controls, technical drawings, inverse sections and browser chrome.
- A personal four-font system: Fraunces for the name and editorial signature,
  Manrope for technical headings, Source Serif 4 for long-form research text,
  and IBM Plex Mono for evidence and data labels.
- Regression checks for the dark-theme contract, personal name treatment and
  font loading.

### Changed

- Replace isolated dark bands with a coherent midnight ink-blue palette using
  accessible teal and brass accents.
- Give the masthead name, thesis statement and book title a tailored editorial
  voice while preserving the existing content hierarchy.
- Synchronize VERSION, README and footer to revision 3.8.

### Validation

- `python -B -m unittest discover -s tests -v`: 9/9 passed.
- HTML parsing, link-reference and accessibility-reference checks passed.
- Dark-theme text and accent combinations measure at least 8.09:1 contrast.
- Print colors reset correctly when the operating system uses dark mode.

### Compatibility and migration

- Backward compatible; all content, URLs, interactive labs, book assets and
  section order are preserved. No hosting or data migration is required.

### Known limitations

- Web fonts depend on Google Fonts availability and fall back to system fonts
  when blocked.
- Static tests cannot assess subjective font rendering on every platform.

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
