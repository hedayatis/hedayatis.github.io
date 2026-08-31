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

## RIPPLE Optimization Lab

RIPPLE -- Recovery Inventory Planning under Probabilistic Yield and Lead-Time
External Sourcing -- is an original interactive stochastic optimization
demonstrator. It coordinates EOL disassembly, module-core reprocessing,
probabilistic recovery, refurbished-product reassembly, inventory, regular
supplier orders, emergency purchasing, and backlog.

The app uses a mixed-integer model solved by the open-source HiGHS solver. The
interface compares reactive, safety-stock, stochastic, and CVaR risk-averse
policies using synthetic data. The source repository remains private, while the
public demonstrator is available at:
**[https://ripple-optimization-lab-ixsdhfedbevujnmwyqq6qh.streamlit.app/](https://ripple-optimization-lab-ixsdhfedbevujnmwyqq6qh.streamlit.app/)**.

## ISAPDI Simulation Lab

[Launch Simulation Lab](https://isapdi-simulation-lab.onrender.com)

Explore inspection allocation and production-line simulation through an
interactive dashboard. The portfolio links to the existing Render deployment;
the application remains maintained separately from this static website.

First launch may take 50 seconds or more while the free server wakes up.

## Retail Analytics Lab

[Launch Analytics Lab](https://hedayatis.github.io/retail-analytics-lab/) |
[Explore source on GitHub](https://github.com/hedayatis/retail-analytics-lab)

A reproducible analytics portfolio project over 1,067,371 UCI Online Retail II
transaction lines: data contracts, checksum-verified ingestion, a cleaning
ledger, DuckDB star schema, RFM segmentation and cohort retention.

The project demonstrates Python/pandas, SQL/DuckDB and base R, backed by
cross-engine parity checks and 60 passing tests. RFM has four implementations;
cohort retention has three. The browser lab displays full-population summaries
and runs R/Python RFM comparisons on a 25-customer sample.

The dataset is used for non-commercial demonstration. The language runtimes
download on first execution; project code and validation are publicly available.

## Book

**[The Abundance Within: How Seeing What We Have Saves Us from the Culture of
Lack](https://hedayatis.github.io/books/the-abundance-within.pdf)** (2026), by
Sam Hedayati. A 275-page book about the personal and cultural habit of seeing
only what is missing, and the practices of accurate seeing, gratitude,
sufficiency, attention and generosity that can rebuild abundance without
denying real need or injustice.

[Read online](https://hedayatis.github.io/books/the-abundance-within.pdf) |
[Download the PDF](https://hedayatis.github.io/books/the-abundance-within.pdf)

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

- **A self-contained profile page.** All page styles are inline, every technical
  drawing is hand-written inline SVG, and there is no JavaScript, framework or
  build step. The book cover and PDF are served as static companion assets.
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

## Revision and validation

Current revision: **3.6**. The existing two-part website revision convention is
preserved in `VERSION`, the footer, and `CHANGELOG.md`.

The book closes the portfolio immediately above the footer; all other sections
retain their existing order.

Run the dependency-free static checks from the repository root:

```bash
python -m unittest discover -s tests -v
```

After GitHub Pages publishes, verify all three lab launch buttons, the
[analytics source link](https://github.com/hedayatis/retail-analytics-lab), and
the startup notices in the lab cards.
Static tests validate links and markup, not execution of the externally hosted
applications.

## License

Site content (text, drawings) (c) Sajjad Hedayati. The book PDF is (c) 2026 Sam
Hedayati, all rights reserved. Please do not reuse the personal content; feel
free to borrow the technical approach.
