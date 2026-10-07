#!/usr/bin/env bash
# Export installed Cursor extensions to a text file, one id per line.
# With versions: publisher.name@version
#
# Usage:
#   ./keymaps/cursor/export-extensions.sh
#   ./keymaps/cursor/export-extensions.sh /path/to/extensions.txt
#
# Reinstall on another machine:
#   while IFS= read -r extension; do
#     cursor --install-extension "$extension"
#   done < keymaps/cursor/extensions.txt

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
output="${1:-"$script_dir/extensions.txt"}"

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

mkdir -p "$(dirname "$output")"
"$cursor_bin" --list-extensions --show-versions | sort > "$output"

count="$(grep -c . "$output" || true)"
echo "Exported ${count} extensions to ${output}"
