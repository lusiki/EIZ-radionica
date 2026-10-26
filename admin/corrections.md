# Dnevnik činjeničnih i metodoloških ispravaka

Osnova pregleda: `d942375`. Revizija: 26. listopada 2026. Datumi događaja
nisu potvrđeni ovom revizijom. Izvorni sadržaj ostaje u povijesti Gita.
Brojevi redaka odnose se na osnovni commit, a ne na prepisane materijale.

| Mjesto prije revizije | Problem | Odluka i provjera |
|---|---|---|
| day1:158–168 | Vjerojatnost tokena i temperatura poistovjećene s točnošću | Razdvojeno generiranje, uzorkovanje i provjera dokaza; uklonjene stope halucinacija bez izvora. |
| day1:175–187, 250–256, 456 | Rangiranje modela, univerzalne mogućnosti, besplatan pristup | Uklonjene neprovjerene usporedbe i kvote; obvezni put radi bez AI računa. |
| day1:198–220; day2:450 | Univerzalna pravila akademske dopuštenosti | Upućivanje na pravila kolegija i ustanove; zapis uporabe nije dozvola ni izvor za stručnu tvrdnju. |
| day1:224, 329–350, 431 | Demonstracija ovisi o zajamčenoj pogrešci ili dovršetku živog servisa | Dodani pripremljeni primjeri, označeni kao ilustrativni. |
| day1:299–311 | Citati jamče provjeru; nejasno i pogrešno proširenje IAG | Uveden dokazni zapis; IAG uklonjen iz jezgre dok ne postoji definicija i korpus. |
| day1:363–375, 414 | Pretpostavljene interne faze i pogrešno značenje boja provjere | Uklonjeno; provjera u izvornom dokumentu, ne prema boji sučelja. |
| day1:486, 515, 518 | Uloga u promptu mijenja težine; opravdavanje unaprijed izabrane metode | Zamijenjeno provjerljivim zahtjevima i otvorenom kritikom plana. |
| day2:119, 139–201, 321, 415, 462, 512 | Nepotkrijepljene statistike i generalizacije iz benchmarka | Uklonjene iz nastavne jezgre. |
| day2:216, 338–350, 386 | Jedna zemlja nazvana panelom; automatizirani izbor testova | Vremenska serija; panel i napredna selekcija modela izvan jezgre. |
| day2:220, 228–236, 249–266 | Dvostruka os, inflacija umjesto očekivanja, nedostajuća konstanta, pogrešna p-vrijednost, automatski logovi | Odvojene jedinice i osi, opisni cilj, konstanta u dodatku, ispravljena inferencija. [ASA](https://www.amstat.org/asa/files/pdfs/p-valuestatement.pdf), [sandwich](https://sandwich.r-forge.r-project.org/reference/NeweyWest.html). |
| day2:281, 294–304 | RStudio nema Copilot; Positron koristi cijeli VS Marketplace | Ispravljeno prema [Positu](https://docs.posit.co/ide/user/ide/guide/tools/copilot.html) i [Positronu](https://positron.posit.co/extensions.html). |
| day2:380 | Skok s Hrvatske na američki FOMC slučaj | Jedan javno reproducibilan hrvatski slučaj. |
| day2:446, 485–546 | Generalizacije o pisanju; prompt jamči točnost; CLASSLA kao lektor; izmišljeni nalazi | Uvedena usporedba teksta prije/poslije i brojki s izlazom. [CLASSLA](https://github.com/clarinsi/classla). |
| day2:597; README i admin | Pogrešan repo i nepodudarni kontakti/datumi | Poveznice na ovaj repo; novi termin i kontakt ne izmišljaju se. |
| Plan drugog modela | Stari HICP kod, obvezni ADF/logovi, preširok skup alata | Novi prc_hicp_minr (ECOICOP v2); fiksni uzorak; opisna jezgra; inferencija izborna. |

Primarni izvori: [HICP](https://ec.europa.eu/eurostat/web/hicp/information-data),
[anketni saldo](https://economy-finance.ec.europa.eu/economic-forecast-and-surveys/business-and-consumer-surveys/methodology-business-and-consumer-surveys/methodological-concepts_en).
Za serije i datum preuzimanja mjerodavan je `data/raw/manifest.json`.

Prije nove izvedbe nastavnik potvrđuje datum, ciljanu skupinu, kontakt i
pravila ustanove; otvara izvore; pokreće testove; provodi pilot.
Ovaj zapis potvrđuje uređivačke odluke, ne potvrđuje da je pilot održan.
