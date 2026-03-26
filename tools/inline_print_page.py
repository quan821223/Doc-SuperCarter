from __future__ import annotations

import base64
import mimetypes
import re
from pathlib import Path
from bs4 import BeautifulSoup

ROOT = Path(__file__).resolve().parents[1]
SITE_DIR = ROOT / 'site'
PRINT_PAGE = SITE_DIR / 'print_page' / 'index.html'
OUTPUT = SITE_DIR / 'offline-manual.html'

URL_RE = re.compile(r'url\(([^)]+)\)')


def is_remote(value: str) -> bool:
    value = value.strip()
    return value.startswith(('http://', 'https://', '//', 'data:', 'mailto:', 'javascript:'))


def to_data_uri(path: Path) -> str:
    mime, _ = mimetypes.guess_type(path.name)
    mime = mime or 'application/octet-stream'
    encoded = base64.b64encode(path.read_bytes()).decode('ascii')
    return f'data:{mime};base64,{encoded}'


def resolve_asset(base_dir: Path, value: str) -> Path | None:
    value = value.strip()
    if not value or is_remote(value) or value.startswith('#'):
        return None
    clean = value.split('?', 1)[0].split('#', 1)[0]
    return (base_dir / clean).resolve()


def inline_css_urls(css_text: str, css_path: Path) -> str:
    def repl(match: re.Match[str]) -> str:
        raw = match.group(1).strip().strip('"\'')
        asset_path = resolve_asset(css_path.parent, raw)
        if asset_path and asset_path.exists() and asset_path.is_file():
            return f"url('{to_data_uri(asset_path)}')"
        return match.group(0)

    return URL_RE.sub(repl, css_text)


def main() -> None:
    html = PRINT_PAGE.read_text(encoding='utf-8')
    soup = BeautifulSoup(html, 'lxml')
    base_dir = PRINT_PAGE.parent

    for link in list(soup.find_all('link', href=True)):
        href = link['href']
        rel = {item.lower() for item in link.get('rel', [])}

        if 'preconnect' in rel and 'fonts.gstatic.com' in href:
            link.decompose()
            continue

        if 'stylesheet' in rel:
            if is_remote(href):
                if 'fonts.googleapis.com' in href:
                    link.decompose()
                continue

            asset_path = resolve_asset(base_dir, href)
            if asset_path and asset_path.exists() and asset_path.is_file():
                style = soup.new_tag('style')
                style['data-inline-source'] = href
                style.string = inline_css_urls(asset_path.read_text(encoding='utf-8'), asset_path)
                link.replace_with(style)
            continue

        asset_path = resolve_asset(base_dir, href)
        if asset_path and asset_path.exists() and asset_path.is_file():
            link['href'] = to_data_uri(asset_path)

    for script in list(soup.find_all('script', src=True)):
        src = script['src']
        if is_remote(src):
            continue
        asset_path = resolve_asset(base_dir, src)
        if asset_path and asset_path.exists() and asset_path.is_file():
            script.string = asset_path.read_text(encoding='utf-8')
            del script['src']
            script['data-inline-source'] = src

    for tag_name, attr in [('img', 'src'), ('source', 'src'), ('audio', 'src'), ('video', 'src')]:
        for tag in soup.find_all(tag_name):
            value = tag.get(attr)
            if not value:
                continue
            asset_path = resolve_asset(base_dir, value)
            if asset_path and asset_path.exists() and asset_path.is_file():
                tag[attr] = to_data_uri(asset_path)

    for tag in soup.find_all(srcset=True):
        entries = []
        changed = False
        for item in tag['srcset'].split(','):
            parts = item.strip().split()
            if not parts:
                continue
            asset_path = resolve_asset(base_dir, parts[0])
            if asset_path and asset_path.exists() and asset_path.is_file():
                parts[0] = to_data_uri(asset_path)
                changed = True
            entries.append(' '.join(parts))
        if changed:
            tag['srcset'] = ', '.join(entries)

    OUTPUT.write_text(str(soup), encoding='utf-8')
    print(f'Wrote {OUTPUT}')


if __name__ == '__main__':
    main()
