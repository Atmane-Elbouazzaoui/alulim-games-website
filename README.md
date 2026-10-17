# Alulim Games — studio website

Static site served by GitHub Pages. No build step: edit the HTML and push.

- `index.html` — publisher landing for both games
- `brainrot-bills.html` — game page for *Brainrot Bills: Smash an Egg* (formerly *Bills Due: Piggy Bank Smash*)
- `bills-due.html` — forwards the old game-page address to `brainrot-bills.html`
- `privacy.html` and its four translations — Brainrot Bills privacy policy
- `support.html` — Brainrot Bills support and developer contact
- `terms.html` — Brainrot Bills terms of use
- `licenses.html` — Brainrot Bills credits, creation-tool terms and software notices
- `licenses/` — preserved font, sound-pack and software licence records
- `css/style.css` — original responsive design system for the Alulim publisher identity
- `assets/alulim-logo.png` — the supplied master logo lockup. **Source artwork only**: no page
  loads it. Every derived asset below is cut from it, so regenerate from here if the logo changes.
- `assets/alulim-emblem.png` — the emblem alone, transparent, used in the header and footer
  lockups beside live `ALULIM / GAMES` text
- `favicon.ico`, `assets/favicon-{16,32,48,192,512}.png`, `assets/apple-touch-icon.png` —
  the emblem on white with rounded corners. Small sizes carry less padding than large ones
  because this mark's thin gaps close up below about 24px. The Apple touch icon is a
  full-bleed square: iOS applies its own mask and would otherwise round it twice.
- `assets/og-alulim.png` — 1200×630 social card for every page except the game page
- `site.webmanifest` — names the 192/512 icons for Android and installed-PWA use
- `assets/bills-due-hero.jpg` — legacy web-optimised 1024×500 Bills Due promotional art
- `assets/bills-due-social.jpg` — 1920×720 launch artwork used for Bills Due social previews
- `assets/bills-due-{smash,bills,banks,cabinet}.jpg` — legacy web-optimised Bills Due storefront frames

## Release maintenance

1. As of 2026-10-13, Brainrot Bills is unavailable for new App Store downloads and
   its Google Play release is not public. The homepage and game page link to an
   availability section instead of offering downloads. Before restoring download
   buttons, verify the live listings and update visible status, metadata and structured data together.
2. Keep the in-game privacy URL aligned with `https://alulimgames.com/privacy.html`.
3. The iOS 3.0 edition has ads between runs and optional in-app purchases; any
   purchase removes those ads, and there are no player-accessible rewarded ads.
   The Google Play edition
   has ads, including optional rewarded ads, and no in-app purchases. Keep the
   privacy policy, support page and terms consistent with these platform differences.
4. These policy and purchase statements apply to Brainrot Bills only. Pippin Plaza
   has separate information at `https://pippinplaza.com/`.
5. In-game navigation uses `VIBE CHECK`, `PRIVACY CHOICES`, `REPORT AN AD`,
   `DRIP SHOP` and `RESTORE PURCHASES`. On iOS, `PRIVACY CHOICES` is hidden when
   tracking is not allowed; device tracking permission changes in iOS Settings.
6. Keep all five policy languages aligned. The current policy revision is
   2026-10-13. Individual developer identity and existing canonical URLs remain in place.

## Performance

The site has no framework, build step, JavaScript, analytics, or remote font request.
Navigation and FAQ disclosure use native HTML. The current Pippin App Store hero is preloaded; remaining screenshots load lazily below the fold. Current Pippin PNGs are preserved without image alterations.

## Licensing page maintenance

Creation-tool references identify the current workflow reported by the owner;
they are not a blanket commercial-clearance certificate. Confirm the exact
service and model/dependency versions before making commercial-rights claims.
Fredoka is referenced by the saved scenes. Selected Kenney-derived hammer and
vibe impacts match the recorded hashes and are referenced by the audio catalogues.
Preserve original copyright and licence text in `licenses/`.


## Publisher catalogue and game document routing

pippin-plaza.html is the Pippin Plaza publisher overview.
policies.html is the game chooser for support, privacy, terms and licensing.
Pippin's main marketing and player-help site remains https://pippinplaza.com/.

Do not merge the games' policies or redirect their existing document URLs.
Brainrot Bills keeps privacy.html and its four translations, terms.html,
support.html and licenses.html on this domain. Pippin Plaza keeps its privacy,
terms, support and licensing documents on pippinplaza.com, including existing
translations. Pippin's publisher page links directly to Pippin's own documents.

## Current Pippin screenshot source

The owner supplied Pippin plaza_2_9_Screenshots on 2026-10-17 and identified
the files as screenshots from the live App Store listing. The selected iPhone
PNGs in assets/pippin-current-*.png are byte-for-byte copies. They contain
promotional overlays as supplied and are not described as raw captures.
PIPPIN_SCREENSHOT_SOURCES.json records the source filenames and exact hashes.
