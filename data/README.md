# Zamrznuti nastavni slučaj

Hrvatska, 2015-01–2024-12; 120 mjeseci. Preuzeto 26. listopada 2026.
Dva javna izvora: Eurostat prc_hicp_minr (ukupni HICP, RCH_A, ECOICOP v2)
i ei_bsco_m (DG ECFIN, BS-PT-NY, BAL, NSA). Podaci su povijesne serije
prema trenutačno dostupnoj reviziji, ne povijesna izdanja za prognoziranje.

- raw/: izvorni JSON-stat odgovori i manifest s upitima, vremenom i kontrolnim zbrojevima.
- processed/croatia_inflation.csv: zajednički ključ month, bez imputacije.
- reference/: zamrznuti numerički rezultati za provjeru skripti.
- dictionary.qmd: značenje stupaca, jedinice, obrada i ograničenja.

Izvori:
[HICP](https://ec.europa.eu/eurostat/databrowser/view/prc_hicp_minr/default/table?lang=en),
[anketa](https://ec.europa.eu/eurostat/databrowser/view/ei_bsco_m/default/table?lang=en).
© European Union, Eurostat / European Commission DG ECFIN, pristupljeno
26. listopada 2026. Ovaj je paket prilagođen za nastavu: odabrani su mjeseci
i zemlja, spojene serije i izračunani sažetci. Eurostat nije odgovoran za
ovu obradu i tumačenje.
[Uvjeti ponovne uporabe](https://ec.europa.eu/eurostat/help/copyright-notice).
Poštujte posebne napomene izvornog izvora; ne pretpostavljajte da paket
dodjeljuje opću licencu svim tuđim sadržajima.

Mogući HNB/medijski korpus nije uključen niti simuliran kao stvarni podatak.
