# Sajjad (Sam) Hedayati

Optimization, simulation and decision support for manufacturing and logistics.
Ghent, Belgium.

This repository serves my profile page:
**[hedayatis.github.io](https://hedayatis.github.io)**

[Email](mailto:sajjad.hedayati@ugent.be) |
[LinkedIn](https://www.linkedin.com/in/sajjad-hedayati-13703725a) |
[ORCID](https://orcid.org/0000-0002-1008-6288) |
[Google Scholar](https://scholar.google.com/citations?user=vNrnIkoAAAAJ)

---

## What the page is

A one-page portfolio of my work in operations research: exact and stochastic
optimization, discrete-event simulation, and the decision tools built on top of
them. It shows the problems I have worked on -- inspection allocation in
production lines, warehouse picker routing, mobile parcel locker resupply,
remanufacturing planning -- each drawn as a small schematic of the problem
structure rather than described in adjectives.

Publications behind the page:

- *Inspection station allocation in a production line with delayed inspection.*
  Computers & Operations Research 194, 107588 (2026).
- *A new approach to the joint order batching and picker routing problem with
  alternative locations.* IMA Journal of Management Mathematics 35(2), 241-265 (2023).
- *Re-supplying autonomous mobile parcel lockers in last-mile distribution.*
  Future Transportation 4(4), 1266-1296 (2024).

## How the page is built

Deliberately simple, and kept that way:

- **One self-contained HTML file.** All styles inline, every drawing is
  hand-written inline SVG, no JavaScript, no framework, no build step. The page
  survives being copied, emailed, printed or opened offline.
- **CSS-only animation.** The journal-paper schematics run a single slow,
  staged choreography per scene; `prefers-reduced-motion` renders the completed
  state statically instead.
- **Typography:** IBM Plex (Sans Condensed / Serif / Mono) with system fallbacks.
- **Print-aware.** A print stylesheet turns the dark bands white so the page
  exports cleanly to PDF.
- **Plain ASCII source.** Special characters are written as HTML entities so the
  file cannot be mangled by an editor guessing the wrong encoding.
- **Link-only by design.** The page carries `noindex` -- it is meant to be
  reached from my CV and applications, not from search results.

The current version is stamped in the page footer.

## License

Content (text, drawings) (c) Sajjad Hedayati. Please do not reuse the personal
content; feel free to borrow the technical approach.
