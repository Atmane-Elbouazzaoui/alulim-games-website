# Domain cutover runbook — Namecheap → GitHub Pages

**Do this immediately before submitting to App Store Connect or Google Play, not earlier.**

The site is live now at `https://atmane-elbouazzaoui.github.io/alulim-games-website/` and that URL
is a perfectly valid privacy/support URL. This runbook swaps it to `alulimgames.com`.

## The one ordering rule

**DNS first, `CNAME` file second.** Committing a `CNAME` file to the repository root makes GitHub
Pages start serving that hostname *and redirect the `github.io` URL to it*. If DNS does not resolve
yet, the redirect points at nothing and the site is down — including the privacy URL a store
reviewer may be loading at that moment. `deploy/CNAME` is staged out of the root for exactly this
reason.

## 1. Buy the domain

Namecheap → register `alulimgames.com`. Enable WHOIS privacy (free with Namecheap) so your home
address is not published in the public WHOIS record.

## 2. Point DNS at GitHub Pages

Namecheap → **Domain List → Manage → Advanced DNS**.

**Delete the parking records first.** A fresh Namecheap domain ships with a `URL Redirect Record`
on `@` and a `CNAME` on `www` pointing at `parkingpage.namecheap.com`. Both conflict with the
records below and will silently keep the parking page live.

Add these Host Records:

| Type | Host | Value | TTL |
|---|---|---|---|
| A | @ | 185.199.108.153 | Automatic |
| A | @ | 185.199.109.153 | Automatic |
| A | @ | 185.199.110.153 | Automatic |
| A | @ | 185.199.111.153 | Automatic |
| AAAA | @ | 2606:50c0:8000::153 | Automatic |
| AAAA | @ | 2606:50c0:8001::153 | Automatic |
| AAAA | @ | 2606:50c0:8002::153 | Automatic |
| AAAA | @ | 2606:50c0:8003::153 | Automatic |
| CNAME | www | atmane-elbouazzaoui.github.io. | Automatic |

The four A records are GitHub's published apex addresses. **Re-check them against GitHub's current
documentation before you enter them** — GitHub has changed these before, and stale values produce a
site that resolves to someone else's server.

## 3. Set up the support mailbox

`support@alulimgames.com` must actually receive mail: Apple and Google both expect a working
contact, and a bounced reviewer email is a rejection.

Namecheap's free **Email Forwarding** is enough. In Advanced DNS, add:

| Type | Host | Value | Priority |
|---|---|---|---|
| MX | @ | eforward1.registrar-servers.com | 10 |
| MX | @ | eforward2.registrar-servers.com | 10 |
| MX | @ | eforward3.registrar-servers.com | 10 |
| MX | @ | eforward4.registrar-servers.com | 15 |
| MX | @ | eforward5.registrar-servers.com | 20 |
| TXT | @ | `v=spf1 include:spf.efwd.registrar-servers.com ~all` | — |

Then **Domain → Redirect Email** and forward `support@` to a mailbox you read.
Verify these hostnames against Namecheap's current documentation; mail hostnames drift.

## 4. Verify DNS before touching the repo

```sh
dig +short A alulimgames.com          # expect the four 185.199.x.153 addresses
dig +short CNAME www.alulimgames.com  # expect atmane-elbouazzaoui.github.io.
dig +short MX alulimgames.com         # expect the eforward hosts
```

Do not continue until the A records return GitHub's addresses. Propagation is usually minutes but
can take hours.

## 5. Cut the site over

```sh
./deploy/cutover.sh          # moves deploy/CNAME to root, rewrites canonical + og:url
git add -A && git commit -m "Point the site at alulimgames.com" && git push
```

Then GitHub → repo **Settings → Pages**: confirm the custom domain shows `alulimgames.com`, wait
for the TLS certificate to issue (usually minutes, occasionally an hour), and tick **Enforce
HTTPS**. Do not skip that tick — a privacy policy served over plain HTTP is a bad look at review
and some browsers will warn on it.

## 6. Verify the live site

```sh
curl -sIL https://alulimgames.com/privacy.html | head -1     # expect 200
curl -sIL https://alulimgames.com/support.html | head -1     # expect 200
curl -sI  http://alulimgames.com/ | head -1                  # expect 301 to https
```

Send a test email to `support@alulimgames.com` and confirm it arrives.

## 7. Only then, wire the URL into the game

`Assets/_Project/Content/Catalogs/AdvertisingConfig.asset` → set the privacy policy URL to
`https://alulimgames.com/privacy.html`.

That field is **authored data compiled into the build**, so changing it later requires a new binary.
Set it once, after the domain is confirmed working. Until it is set, the settings screen hides its
Privacy Policy button rather than opening a dead link — which is the intended behaviour, not a bug.

Store listings take the same URLs:

- App Store Connect → Privacy Policy URL, Support URL
- Google Play → Store listing privacy policy, and the Data safety form

## What can be done before all of this

Everything else. The site is complete and live on the `github.io` URL; this runbook only changes
which hostname serves it.
