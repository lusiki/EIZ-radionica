# Istraživanje uz AI

Pregled materijala, 27. listopada 2026.

## Jedan primjer kroz osam tema

Radionica povezuje traženje izvora, planiranje, analizu i pisanje.
Pratimo ostvarenu inflaciju i kvalitativni saldo očekivanja cijena u
Hrvatskoj od 2015. do 2024. Materijale možete koristiti redom,
samostalno ili u grupi, vlastitim tempom.

| Tema | Primjer rada |
|---|---|
| 1.1 Postavite istraživačko pitanje | Pitanje o dvjema mjerama |
| 1.2 Pronađite i provjerite izvore | Bilješke o izvorima i njihovim tvrdnjama |
| 1.3 Provjerite i uredite sažetak | Početni sažetak i vlastiti ispravak |
| 1.4 Pripremite plan analize | Skica postupka i prikaza |
| 2.1 Upoznajte i provjerite podatke | Pregled 120 mjesečnih opažanja |
| 2.2 Dopunite i objasnite kod | Mala dopuna R skripte |
| 2.3 Ponovite analizu od početka | Tablica i graf iz spremljene skripte |
| 2.4 Napišite i uredite zaključak | Odlomak povezan s dobivenim rezultatom |

Stranice dana daju kratke preglede, priručnik donosi objašnjenja,
a vježbe primjere za isprobavanje. Naslovi i poveznice prate isti redoslijed.
Osvrt na rad čine pitanja koja pomažu odlučiti što dalje doraditi.

## Podaci i metode

Uzorak sadrži 120 mjeseci za Hrvatsku, od 2015-01 do 2024-12.
Godišnju promjenu HICP-a izražavamo u postocima, a sezonski neprilagođen
anketni saldo u bodovima salda. Zadržavamo izvorne jedinice i sva opažanja.

Osnovna analiza koristi odvojene vremenske grafove i godišnje prosjeke.
Korelacija opisuje istodobnu linearnu povezanost. Pitanja o uzroku ili
prognoznoj točnosti traže zaseban postupak. OLS/HAC je dodatni primjer,
s konstantom, navedenim postavkama i objašnjenim ograničenjima.

## Alati i datoteke

Početna skripta radi u osnovnom R-u, u Positronu ili RStudiju.
Pripremljeni podaci, tekst i pogrešna skripta omogućuju rad izvan mreže.
AI pomoć možete isprobati dostupnim alatom.

Za obnovu svih referentnih rezultata služe skripte i renv.lock.
Izvorni JSON i manifest bilježe podrijetlo podataka. Quarto i PDF skripta
grade web i priručnik iz zajedničkih izvora. Upute za gradnju i objavu
nalaze se u README.md.

Povezani materijali su admin/workshop_overview.qmd,
materials/exercises/index.qmd i materials/rubric.qmd.
