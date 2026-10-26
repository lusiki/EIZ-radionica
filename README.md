# Upotreba AI alata u studentskom istraživanju

**Lokalna radna verzija za pregled** na grani `codex/workshop-core-redesign`.
Revidirana 26. listopada 2026.; datum sljedeće izvedbe nije potvrđen.

Radionica na hrvatskom jeziku povezuje provjeru izvora, istraživački plan,
analizu i pisanje kroz jedan slučaj: ostvarenu inflaciju i kvalitativni
saldo očekivanja cijena u Hrvatskoj, 2015.–2024. Osam blokova, sedam sati,
200 minuta predviđenog aktivnog rada.

## Lokalni pregled

Na Windowsu u korijenskoj mapi repozitorija:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/build.ps1
powershell -ExecutionPolicy Bypass -File scripts/preview.ps1
```

Otvorite http://127.0.0.1:4317. Pregled zaustavite s Ctrl+C.
Gradnja stvara lokalne izlaze u `_site/`, `results/` i `downloads/`, bez objave
ili push-a. Quarto se izvršava u privremenoj kopiji izvan Dropboxa kako sinkronizacija
ne bi zaključala međudatoteke i kako bi stari izvozi ostali netaknuti.
Gotov `_site/index.html` možete otvoriti i izravno u pregledniku; pretraživanje
weba pouzdanije radi preko lokalnog poslužitelja.

Preduvjeti za punu gradnju: R 4.6.0 (provjerena verzija), Quarto 1.9.38
(provjerena verzija), Python s paketom ReportLab i R paketi iz renv.lock.
PDF priručnik gradi se iz istih izvora kao čitateljske stranice. Po potrebi
instalirajte `python -m pip install reportlab` i postavite `EIZ_PYTHON` na
putanju tog Python interpretera. Skripta na ovom računalu prepoznaje i
bundled Codex Python. Za provjeru PDF-a koristite `pypdf` i `pdfplumber`.
Na Linuxu paketi za fontove mogu
zahtijevati sistemske biblioteke; taj sustav nije provjeren ovom revizijom.

```r
install.packages("renv", repos = "https://cloud.r-project.org")
renv::restore(prompt = FALSE)
renv::load()
source("code/run_all.R", encoding = "UTF-8")
```

Pakiranje ZIP-a automatizirano je PowerShell skriptom za Windows.
Na drugim sustavima referentni R postupak i `quarto render` mogu se izvesti
zasebno; lokalni ZIP treba pripremiti prije provjere poveznice za preuzimanje.
Za polaznički rad
bez punog builda dovoljan je `source("code/starter.R", encoding = "UTF-8")`.

## Materijali

- [Početak](admin/prerequisites.qmd), [raspored](admin/workshop_overview.qmd)
- [Dan 1](slides/day1.qmd), [Dan 2](slides/day2.qmd): čitateljski materijali
- [Prošireni priručnik](booklet/index.qmd): revidirani izvorni tekst u osam
  poglavlja, dva dijela za web i cjelovit PDF u `downloads/EIZ-prirucnik.pdf`
- [Osam vježbi](materials/exercises/index.qmd), [rješenja](materials/solutions.qmd)
- [Rječnik podataka](data/dictionary.qmd), [izvori](materials/sources.qmd)
- [Rubrika](materials/rubric.qmd), [upute za nastavnika](admin/instructor.qmd)
- [Ispravci](admin/corrections.md), [dizajn](DESIGN.md)

Provjere ove revizije zapisane su u [compatibility.md](admin/compatibility.md).
Dodatna provjera s Pythonovom standardnom bibliotekom:
`python scripts/check_release.py` (nakon gradnje). Ona ne zamjenjuje pilot.

Radni ZIP nastaje u downloads/eiz-workshop.zip. Sadrži izvore, podatke,
skripte, upute i novi PDF priručnik; ne sadrži .git, osobne postavke,
staru objavu ili renv biblioteku.
Novi web gradi se isključivo iz eksplicitnog popisa u _quarto.yml.

## Povijesni materijal i sljedeće odluke

Postojeći HTML/PDF izvozi u slides/ i admin/ te stare najave nisu revidirani
izvozi ove grane i nisu dio novog weba ili paketa. Izvorni sadržaj je u
povijesti Gita, početni commit d942375. Koristite _site/ za pregled revizije.

Organizator treba potvrditi datum, kontakt, točnu skupinu i pravila uporabe
AI-ja te provesti pilot s predstavnicima polaznika. Ova revizija ne tvrdi da
je pilot održan. HNB/medijski primjer ostaje izvan jezgre dok nema
dokumentiranog korpusa i postupka. Novi prezentacijski sažeci mogu slijediti
nakon provjere tempa.

Izvorni repozitorij navodi financiranje iz Nacionalnog plana oporavka i
otpornosti 2021.–2026. (NextGenerationEU); taj povijesni podatak nije potvrda
financiranja nove izvedbe. Prava za podatke i pisma: LICENSE-NOTICE.md.
