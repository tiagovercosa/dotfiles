#!/bin/sh
# Preview for fzf/fzf-tab: images with kitten icat, directories with eza, everything else with bat.
file=$1
[ -n "$file" ] || exit 0

if [ -d "$file" ]; then
  LS_COLORS= exec eza -1 --color=always --icons=auto --group-directories-first -- "$file"
fi
[ -f "$file" ] || exit 0

case $(file --brief --mime-type -- "$file") in
  image/*)
    cols=${FZF_PREVIEW_COLUMNS:-80} lines=${FZF_PREVIEW_LINES:-25}
    # Ghostty/kitty: Unicode placeholders tie the image to text cells, so fzf
    # clears it with the text on exit (plain kitty graphics linger with --height).
    case $TERM in
      xterm-ghostty|xterm-kitty)
        if command -v kitten >/dev/null 2>&1 &&
          out=$(kitten icat --clear --transfer-mode=memory --unicode-placeholder --stdin=no \
            --place="${cols}x${lines}@0x0" "$file" 2>/dev/null); then
          # Drop the trailing reset line (fzf shows a scroll offset otherwise)
          reset=$(printf '\033[m')
          printf '%s\n' "$out" | sed '$d' | sed "\$s/\$/$reset/"
          exit
        fi
        ;;
    esac
    ;;
esac

# bat wraps text itself: fzf's own wrap would also split the image placeholder rows
exec bat --color=always --style=plain,numbers --line-range=:500 \
  --wrap=character --terminal-width="${FZF_PREVIEW_COLUMNS:-80}" -- "$file"
