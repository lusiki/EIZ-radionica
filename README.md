# Istraživanje uz AI

**[Otvorite glavnu stranicu radionice](https://lusiki.github.io/EIZ-radionica/).**
Materijali uređeni 27. listopada 2026. Dokumentacija alata provjerena 26. listopada 2026.

Radionica na hrvatskom jeziku ima osam povezanih tema. Svaka počinje
razgovorom, pokazuje primjer i daje priliku za vlastitu analizu.
Koristimo svih 120 mjesečnih opažanja za Hrvatsku od 2015. do 2024.
CSV dodajemo jednom u AI razgovor koji podržava izvršavanje koda.
Pitanje, plan, grafovi, tablice i zaključak ostaju u istom razgovoru.

Stranice dana i primjera sadrže upite, pregled svih podataka i referentne
brojke. Priručnik detaljnije objašnjava isti postupak. R projekt,
predlošci i dodatni alati dostupni su za samostalni nastavak.

## Izrada i lokalni pregled materijala

GitHub Pages objavljuje provjerenu statičku mapu `docs/` nakon promjene na
`main`. Za novu objavu pokrenite `scripts/build.ps1`, zatim
`scripts/prepare_pages.ps1`. Uključite osvježenu mapu `docs/` u isti commit
kao izvore. Workflow provjerava poveznice i podatke prije objave.

Na Windowsu u korijenskoj mapi repozitorija.

```powershell
powershell -ExecutionPolicy Bypass -File scripts/build.ps1
powershell -ExecutionPolicy Bypass -File scripts/preview.ps1
```

Otvorite http://127.0.0.1:4317. Pregled zaustavite s Ctrl+C.
Gradnja stvara lokalne izlaze u `_site/`, `results/` i `downloads/`, bez objave
ili push-a. Quarto se izvršava u privremenoj kopiji izvan Dropboxa kako sinkronizacija
ne bi zaključala međudatoteke i kako bi stari izvozi ostali netaknuti.
Gotov `_site/index.html` možete otvoriti i izravno u pregledniku. Pretraživanje
weba pouzdanije radi preko lokalnog poslužitelja.

Preduvjeti za punu gradnju, R 4.6.0 (provjerena verzija), Quarto 1.9.38
(provjerena verzija), Python s paketom ReportLab i R paketi iz renv.lock.
PDF priručnik gradi se iz istih izvora kao čitateljske stranice. Po potrebi
instalirajte `python -m pip install reportlab` i postavite `EIZ_PYTHON` na
putanju tog Python interpretera. Skripta na ovom računalu prepoznaje i
bundled Codex Python. Za provjeru PDF-a koristite `pypdf` i `pdfplumber`.
Na Linuxu paketi za fontove mogu
zahtijevati sistemske biblioteke. Taj sustav nije provjeren ovom revizijom.

```r
install.packages("renv", repos = "https://cloud.r-project.org")
renv::restore(prompt = FALSE)
renv::load()
source("code/run_all.R", encoding = "UTF-8")
```

Pakiranje ZIP-a automatizirano je PowerShell skriptom za Windows.
Na drugim sustavima referentni R postupak i `quarto render` mogu se izvesti
zasebno. Lokalni ZIP treba pripremiti prije provjere poveznice za preuzimanje.
Za samostalni nastavak u R-u možete pokrenuti
`source("code/starter.R", encoding = "UTF-8")`.

## Kako su materijali povezani

Svaka tema ima isti broj i naslov na stranici dana, u priručniku
i u primjerima. Dan 1 i Dan 2 sadrže cijeli sadržaj za zajednički rad.
Stranica Primjeri okuplja ih na jednom mjestu. Zajednički izvori su u
`materials/activities/`. Priručnik počinje istim aktivnostima, a zatim
objašnjava širi postupak. Pregled poveznica je u
[priručniku](booklet/index.qmd#osam-povezanih-blokova).

## Materijali

- [Početak](admin/prerequisites.qmd), [put kroz radionicu](admin/workshop_overview.qmd)
- [Dan 1](slides/day1.qmd), [Dan 2](slides/day2.qmd), kratki pregledi
- [Prošireni priručnik](booklet/index.qmd), revidirani izvorni tekst u osam
  poglavlja, dva dijela za web i cjelovit PDF u `downloads/EIZ-prirucnik.pdf`
- [Osam povezanih primjera](materials/exercises/index.qmd), [rješenja](materials/solutions.qmd)
- [Rječnik podataka](data/dictionary.qmd), [izvori](materials/sources.qmd)
- [Završni razgovor](materials/rubric.qmd), [kako voditi radionicu](admin/instructor.qmd)
- [Ispravci](admin/corrections.md), [dizajn](DESIGN.md)

Provjere ove revizije zapisane su u [compatibility.md](admin/compatibility.md).
Dodatna provjera s Pythonovom standardnom bibliotekom.
`python scripts/check_release.py` (nakon gradnje).

Radni ZIP nastaje u downloads/eiz-workshop.zip. Sadrži izvore, podatke,
skripte, upute i novi PDF priručnik. Ne sadrži .git, osobne postavke,
staru objavu ili renv biblioteku.
Novi web gradi se isključivo iz eksplicitnog popisa u _quarto.yml.

## Povijesni materijal i sljedeće odluke

Postojeći HTML/PDF izvozi u slides/ i admin/ te stare najave nisu revidirani
izvozi ove grane i nisu dio novog weba ili paketa. Izvorni sadržaj je u
povijesti Gita, početni commit d942375. Koristite _site/ za pregled revizije.

Primjer komunikacije HNB-a i medija može se razviti u zaseban projekt
uz prikupljanje korpusa i opis postupka. Za organiziranu izvedbu datum,
prostor i kontakt objavljuju se zasebno.

Izvorni repozitorij navodi financiranje iz Nacionalnog plana oporavka i
otpornosti 2021.–2026. (NextGenerationEU). Taj povijesni podatak nije potvrda
financiranja nove izvedbe. Prava za podatke i pisma, LICENSE-NOTICE.md.
