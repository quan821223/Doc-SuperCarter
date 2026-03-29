from __future__ import annotations

import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DOCS_DIR = ROOT / "docs"
CHANGELOG_PATH = DOCS_DIR / "CHANGELOG" / "CHANGELOG.md"
OUTPUT_PATH = DOCS_DIR / "_generated" / "latest-changelog.md"

RELEASE_HEADING_RE = re.compile(r"^## \[(?P<version>[^\]]+)\] - (?P<date>\d{4}-\d{2}-\d{2})\s*$")


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


def generate_latest_changelog() -> None:
    markdown = CHANGELOG_PATH.read_text(encoding="utf-8")
    title, body = extract_latest_release(markdown)
    OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_PATH.write_text(render_latest_release(title, body), encoding="utf-8")


def on_pre_build(**kwargs) -> None:
    generate_latest_changelog()
