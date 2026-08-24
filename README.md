# Sajjad (Sam) Hedayati

Operations research, optimization, simulation and decision support for
manufacturing and logistics. Ghent, Belgium.

This repository serves my profile page:
**[hedayatis.github.io](https://hedayatis.github.io)**

[Email](mailto:sajjad.hedayati@ugent.be) |
[LinkedIn](https://www.linkedin.com/in/sajjad-hedayati-13703725a) |
[ORCID](https://orcid.org/0000-0002-1008-6288) |
[Google Scholar](https://scholar.google.com/citations?user=vNrnIkoAAAAJ)

---

## What the page is

A one-page, LinkedIn-ready portfolio of my work in operations research: exact
and stochastic optimization, discrete-event simulation, and the decision tools
built on top of them. It shows the problems I have worked on -- inspection
allocation, warehouse and marketplace routing, mobile parcel-locker resupply,
and remanufacturing planning -- with compact schematics and measured outcomes.

## Selected measured outcomes

- **95% scenario reduction:** 1,000 scenarios compressed to 50; a certified
  variant reduced training time from 88.77 s to 5.27 s while retaining the
  full-SAA holdout cost in the tested setting.
- **13.3-29.4% lower routing cost:** across 80 marketplace-routing instances,
  the integrated method reduced cost by 13.3% against the best sequential
  policy and 29.4% against cheapest-source planning; it was better on 75 of 80
  and never worse.
- **94.4% less solve time:** 418.50 s reduced to 23.31 s on the largest
  delayed-inspection benchmark, with the reported gap kept below 8%.
- **10,000 exact matches:** a tailored dynamic program matched the IP optimum
  on every tested instance and averaged an 8.6x speedup at 100 stages.
- **40.0% lower weekly planning cost:** against a strong workload-coverage
  roster in paired synthetic remanufacturing weeks; condition and skill
  information contributed 8.9% and 12.0% against their respective ablations.
- **More than 80% less waiting:** from fleet sizing in both tested stochastic
  mobile-depot mobility regimes; multi-start search recovered all 12 of 12
  exactly enumerable optima.

These figures are published or fully scripted computational benchmark results
under each study's stated assumptions. They are not presented as realized client
savings.

Publications behind the page:

- *Inspection station allocation in a production line with delayed inspection.*
  Computers & Operations Research 194, 107588 (2026).
- *A new approach to the joint order batching and picker routing problem with
  alternative locations.* IMA Journal of Management Mathematics 35(2), 241-265 (2024).
- *Re-supplying autonomous mobile parcel lockers in last-mile distribution.*
  Future Transportation 4(4), 1266-1296 (2024).

## How the page is built

Deliberately simple, and kept that way:

- **One self-contained HTML file.** All styles are inline, every drawing is
  hand-written inline SVG, and there is no JavaScript, framework or build step.
  The page survives being copied, emailed, printed or opened offline.
- **CSS-only animation.** The journal-paper schematics run a single slow,
  staged choreography per scene; `prefers-reduced-motion` renders the completed
  state statically instead.
- **Typography:** IBM Plex (Sans Condensed / Serif / Mono) with system fallbacks.
- **Print-aware.** A print stylesheet turns the dark bands white so the page
  exports cleanly to PDF.
- **Plain ASCII source.** Special characters are written as HTML entities so the
  file cannot be mangled by an editor guessing the wrong encoding.
- **Public-profile ready.** Canonical, search and Open Graph metadata support
  discovery and a clean preview when the page is shared on LinkedIn.

The current version is stamped in the page footer.

## License

Content (text, drawings) (c) Sajjad Hedayati. Please do not reuse the personal
content; feel free to borrow the technical approach.
