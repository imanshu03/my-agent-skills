#!/usr/bin/env bash
# Compares the pinned upstream snapshots in references/upstream with the latest upstream files.
# Usage: check-upstream.sh            show what changed upstream since the pinned commit
#        check-upstream.sh --refresh  overwrite the snapshots and pins with the latest upstream
set -euo pipefail
dir="$(cd "$(dirname "$0")/../references/upstream" && pwd)"
refresh=false; [ "${1:-}" = "--refresh" ] && refresh=true
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
changed=0
while IFS=$'\t' read -r repo path pinned file; do
  latest="$(gh api "repos/$repo/commits?path=$path&per_page=1" --jq '.[0].sha')"
  if [ "$latest" = "$pinned" ]; then echo "up to date  $repo/$path"; continue; fi
  changed=1
  curl -sfL "https://raw.githubusercontent.com/$repo/$latest/$path" -o "$tmp/$file"
  echo "CHANGED     $repo/$path  ${pinned:0:7} -> ${latest:0:7}"
  diff -u "$dir/$file" "$tmp/$file" --label "pinned/$file" --label "latest/$file" || true
  if $refresh; then cp "$tmp/$file" "$dir/$file"; echo "$repo	$path	$latest	$file" >> "$tmp/sources.tsv"; continue; fi
  echo
done < "$dir/sources.tsv"
if $refresh && [ "$changed" = 1 ]; then
  awk -F'\t' 'NR==FNR{new[$2]=$0; next} ($2 in new){print new[$2]; next} {print}' "$tmp/sources.tsv" "$dir/sources.tsv" > "$tmp/merged.tsv"
  mv "$tmp/merged.tsv" "$dir/sources.tsv"; echo "Snapshots and pins refreshed."
fi
