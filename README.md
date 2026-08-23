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
- `assets/bills-due-cover.jpg` — web-optimised export of the approved Bills Due app artwork
- `assets/bills-due-gameplay.png` — retained landscape capture from the actual game build
- `assets/bills-due-action.png` — supplied transparent landscape action capture
- `assets/bills-due-payday.png` — supplied transparent landscape coin-filled action capture
- `assets/bills-due-frontend.png` — supplied transparent landscape obligation and upgrades capture

## Before submitting an app

1. Replace the placeholder contact address `support@alulimgames.com` everywhere,
   or buy the domain and create the mailbox.
2. Put the live privacy URL into the game's `AdvertisingConfig` asset. That value is
   authored data, so changing it later needs a new build — set it once the final
   domain is known.
3. The privacy policy describes the app **as it ships with ads enabled**. Do not
   publish an app whose behaviour differs from it.

## Performance

The site has no framework, build step, JavaScript, analytics, or remote font request.
Navigation and FAQ disclosure use native HTML. The first action capture is preloaded;
the remaining game captures load lazily below the fold.
