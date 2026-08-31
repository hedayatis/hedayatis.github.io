"""Dependency-free regression checks for the public lab cards."""
from collections import Counter
from html.parser import HTMLParser
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SIMULATION = "https://isapdi-simulation-lab.onrender.com"
RIPPLE = "https://ripple-optimization-lab-ixsdhfedbevujnmwyqq6qh.streamlit.app/"


class Document(HTMLParser):
    def __init__(self, text):
        super().__init__()
        self.elements = []
        self.feed(text)

    def handle_starttag(self, tag, attrs):
        self.elements.append((tag, dict(attrs)))


class PortfolioTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = (ROOT / "index.html").read_text(encoding="utf-8")
        cls.doc = Document(cls.source)
        cls.readme = (ROOT / "README.md").read_text(encoding="utf-8")

    def test_simulation_launch_target_and_notice(self):
        links = [a for tag, a in self.doc.elements
                 if tag == "a" and a.get("href") == SIMULATION]
        self.assertEqual(len(links), 1)
        self.assertEqual(links[0]["target"], "_blank")
        self.assertIn("noopener", links[0]["rel"].split())
        self.assertEqual(links[0]["aria-describedby"], "simulation-startup-note")
        self.assertIn("Launch Simulation Lab</a>", self.source)
        self.assertIn("50 seconds or more", self.source)

    def test_existing_ripple_and_book_links_preserved(self):
        hrefs = [a.get("href") for tag, a in self.doc.elements if tag == "a"]
        self.assertIn(RIPPLE, hrefs)
        self.assertIn("books/the-abundance-within.pdf", hrefs)
        self.assertIn("Launch live optimization lab</a>", self.source)

    def test_unique_ids_and_accessible_references(self):
        ids = [a["id"] for _, a in self.doc.elements if "id" in a]
        duplicates = [value for value, count in Counter(ids).items() if count > 1]
        self.assertEqual(duplicates, [])
        for _, attrs in self.doc.elements:
            for name in ("aria-labelledby", "aria-describedby"):
                for value in attrs.get(name, "").split():
                    self.assertIn(value, ids)
            if attrs.get("href", "").startswith("#"):
                self.assertIn(attrs["href"][1:], ids)
        self.assertIn("simulation-lab", ids)
        self.assertIn("ripple", ids)

    def test_card_follows_ripple_inside_same_section(self):
        section = self.source.split('<section class="lab-section" id="ripple">', 1)[1].split("</section>", 1)[0]
        self.assertEqual(section.count('<article class="lab-shell"'), 2)
        self.assertLess(section.index("RIPPLE Optimization Lab"),
                        section.index("ISAPDI Simulation Lab"))
        self.assertIn(".lab-shell + .lab-shell{margin-top:22px}", self.source)

    def test_revision_and_documentation_agree(self):
        version = (ROOT / "VERSION").read_text().strip()
        self.assertRegex(version, r"^\d+\.\d+$")
        self.assertIn("v" + version + " (web)", self.source)
        self.assertIn("**" + version + "**", self.readme)
        self.assertIn("[" + version + "]", (ROOT / "CHANGELOG.md").read_text())
        self.assertIn(SIMULATION, self.readme)
        self.assertIn("50 seconds or more", self.readme)


if __name__ == "__main__":
    unittest.main()
