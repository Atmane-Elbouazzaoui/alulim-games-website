#!/usr/bin/env sh
# Switches the site from the github.io URL to the custom domain.
# Run ONLY after `dig +short A alulimgames.com` returns GitHub's four addresses.
set -e
cd "$(dirname "$0")/.."

OLD="https://atmane-elbouazzaoui.github.io/alulim-games-website"
NEW="https://alulimgames.com"

if [ "$(dig +short A alulimgames.com | grep -c '^185\.199\.')" -lt 1 ]; then
  echo "Refusing to cut over: alulimgames.com does not resolve to GitHub Pages yet." >&2
  echo "Committing CNAME now would redirect the working github.io URL to nothing." >&2
  exit 1
fi

mv deploy/CNAME CNAME
for f in *.html; do
  sed -i '' "s|$OLD|$NEW|g" "$f" 2>/dev/null || sed -i "s|$OLD|$NEW|g" "$f"
done

echo "Cut over to $NEW."
echo "Next: commit, push, then tick Settings -> Pages -> Enforce HTTPS."
