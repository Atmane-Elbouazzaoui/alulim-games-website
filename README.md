# Alulim Games — studio website

Static site served by GitHub Pages. No build step: edit the HTML and push.

- `index.html` — studio landing
- `bills-due.html` — game page for *Bills Due: Smash to Pay*
- `privacy.html` — privacy policy (required by both app stores)
- `support.html` — support page (Apple requires a reachable support URL)
- `terms.html` — terms of use
- `css/style.css` — design system inherited from the Pippin Plaza site, restyled
  to a lapis-and-brass studio palette so the studio and the game brands stay distinct

## Before submitting an app

1. Replace the placeholder contact address `support@alulimgames.com` everywhere,
   or buy the domain and create the mailbox.
2. Put the live privacy URL into the game's `AdvertisingConfig` asset. That value is
   authored data, so changing it later needs a new build — set it once the final
   domain is known.
3. The privacy policy describes the app **as it ships with ads enabled**. Do not
   publish an app whose behaviour differs from it.

## Fonts

The Pippin Plaza display font (`Jumps-Winter.ttf`) is deliberately **not** copied here.
Its licence is not declared in that repository and font licences are frequently
per-project. This site uses DM Sans and JetBrains Mono from Google Fonts.
