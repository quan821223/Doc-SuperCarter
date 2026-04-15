from __future__ import annotations

import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DOCS_DIR = ROOT / "docs"
CHANGELOG_PATH = DOCS_DIR / "CHANGELOG" / "CHANGELOG.md"
INDEX_SNIPPET_MARKER = '--8<-- "_generated/latest-changelog.md"'

RELEASE_HEADING_RE = re.compile(r"^#{1,2} \[(?P<version>[^\]]+)\] - (?P<date>\d{4}-\d{2}-\d{2})\s*$")


def extract_latest_release(markdown: str) -> tuple[str, str]:
    lines = markdown.splitlines()
    release_start = None
    version = None
    release_date = None

    for index, line in enumerate(lines):
        match = RELEASE_HEADING_RE.match(line.strip())
        if match:
            release_start = index
            version = match.group("version")
            release_date = match.group("date")
            break

    if release_start is None or version is None or release_date is None:
        raise RuntimeError(f"No released version heading found in {CHANGELOG_PATH}")

    release_lines: list[str] = []
    for line in lines[release_start + 1 :]:
        if line.startswith("## "):
            break
        release_lines.append(line)

    body = "\n".join(release_lines).strip()
    return f"{version} ({release_date})", body


def render_latest_release(title: str, body: str) -> str:
    parts = [
        f"### 最新版本：{title}",
        "",
        body or "_目前沒有變更內容_",
    ]
    return "\n".join(parts).rstrip() + "\n"


def generate_latest_changelog() -> str:
    markdown = CHANGELOG_PATH.read_text(encoding="utf-8")
    title, body = extract_latest_release(markdown)
    return render_latest_release(title, body)


def on_pre_build(**kwargs) -> None:
    return None


def on_page_markdown(markdown: str, page, **kwargs) -> str:
    if getattr(page.file, "src_uri", "") != "index.md":
        return markdown

    latest_release = generate_latest_changelog()
    return markdown.replace(INDEX_SNIPPET_MARKER, latest_release)
