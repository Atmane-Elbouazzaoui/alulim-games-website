# Alulim Games — studio website

Static site served by GitHub Pages. No build step: edit the HTML and push.

- `index.html` — studio landing
- `bills-due.html` — game page for *Bills Due: Smash to Pay*
- `privacy.html` — privacy policy (required by both app stores)
- `support.html` — support page (Apple requires a reachable support URL)
- `terms.html` — terms of use
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
- `assets/bills-due-hero.jpg` — web-optimised 1024×500 Amazon promotional art used above the fold
- `assets/bills-due-social.jpg` — 1920×720 launch artwork used for Bills Due social previews
- `assets/bills-due-{smash,bills,banks,cabinet}.jpg` — web-optimised official iOS and Amazon storefront frames used in the release gallery

## Release maintenance

1. Keep the App Store and Amazon download URLs aligned with the live listings.
2. Keep the in-game privacy URL aligned with `https://alulimgames.com/privacy.html`.
3. The privacy policy distinguishes the ad-supported iOS edition from the ad-free
   Amazon edition. Update it before shipping a build whose behaviour differs.

## Performance

The site has no framework, build step, JavaScript, analytics, or remote font request.
Navigation and FAQ disclosure use native HTML. The 213 KB hero is preloaded; the
remaining release frames load lazily below the fold.
