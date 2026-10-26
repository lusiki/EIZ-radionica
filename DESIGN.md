# Zvono / prilagodba za EIZ radionicu

Preuzeto iz korisnikova sustava Zvono u projektu network-release, revizija
26. listopada 2026. Izvorni dizajn definira boje, Jost/Literata/JetBrains Mono,
mjeru 66 znakova, kupolu, disk, os i osnovicu. Ova prilagodba koristi iste
tokene, bez knjiških poglavlja, mreže pojmova ili autorskih profila.

- `design-tokens.yml`: izvor vrijednosti; izvorni identitet knjige u metapodacima
  označuje podrijetlo, a ne naslov radionice.
- `styles/_tokens.scss`: preslikavanje vrijednosti i Bootstrap varijable.
- `styles/custom.scss`: radionica, navigacija, naslovnica i nastavni okviri.
- `styles/fonts.css`: lokalne datoteke pisama; iznimka za deklaracije font-face.
- `code/theme.R`: čita YAML za grafove; ne duplicira paletu.
- `styles/statistika.theme`: izvorna Pandoc tema sintakse (zasebne hex vrijednosti
  zahtijeva Pandoc).
- `styles/fonts/OFL-*.txt`: licence isporučenih pisama.

Naslovna zona koristi velika brand polja i geometriju. U čitateljskoj zoni
modra označuje pojam, crvena grešku, oker poveznice i odabir. Grafovi koriste
data-1/data-2 i različite vrste linija. Brojke na grafovima i u tablicama su
monospace. Tekst je ograničen na 66ch. Fokus ima punu crtu u boji tinte;
kontrole imaju najmanje 44 px. Tamna tema zasad nije uključena: isporučena
je jedna provjerena svijetla tema i ispis iz preglednika.

Provjera: `Rscript scripts/check_design.R`, zatim vizualni pregled naslovnice,
čitateljskog teksta, vježbi, grafa i mobilne navigacije. Knjiga nije ovisnost
za izgradnju ovog projekta. Nema vanjskog učitavanja pisama.
