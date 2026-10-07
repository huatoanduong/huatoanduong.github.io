#!/usr/bin/env bash
# Install Cursor extensions listed in extensions.txt.
# Each line is publisher.name or publisher.name@version.
#
# Usage:
#   ./keymaps/cursor/install-extensions.sh
#   ./keymaps/cursor/install-extensions.sh /path/to/extensions.txt

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
list="${1:-"$script_dir/extensions.txt"}"

find_cursor() {
    if command -v cursor >/dev/null 2>&1; then
        command -v cursor
        return 0
    fi

    local mac_app="/Applications/Cursor.app/Contents/Resources/app/bin/cursor"
    if [[ -x "$mac_app" ]]; then
        echo "$mac_app"
        return 0
    fi

    local win_cmd="${LOCALAPPDATA:-}/Programs/cursor/resources/app/bin/cursor.cmd"
    if [[ -n "${LOCALAPPDATA:-}" && -f "$win_cmd" ]]; then
        echo "$win_cmd"
        return 0
    fi

    return 1
}

cursor_bin="$(find_cursor)" || {
    echo "Cursor CLI was not found. In Cursor, run \"Shell Command: Install 'cursor' command in PATH\"." >&2
    exit 1
}

if [[ ! -f "$list" ]]; then
    echo "Extension list not found: ${list}" >&2
    exit 1
fi

installed=0
failed=0

while IFS= read -r line || [[ -n "$line" ]]; do
    extension="${line%%#*}"
    extension="${extension//[[:space:]]/}"
    if [[ -z "$extension" ]]; then
        continue
    fi

    echo "Installing ${extension}"
    if "$cursor_bin" --install-extension "$extension"; then
        installed=$((installed + 1))
    else
        echo "Failed to install ${extension}" >&2
        failed=$((failed + 1))
    fi
done < "$list"

echo "Installed ${installed} extensions. Failed: ${failed}."
[[ "$failed" -eq 0 ]]
