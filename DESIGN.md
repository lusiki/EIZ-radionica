# Zvono / prilagodba za EIZ radionicu

Preuzeto iz korisnikova sustava Zvono u projektu network-release, revizija
26. listopada 2026. Izvorni dizajn definira boje, Jost/Literata/JetBrains Mono,
mjeru 66 znakova, kupolu, disk, os i osnovicu. Nova paleta Mint & Slate (27. listopada 2026.) čuva strukturu tokena, bez knjiških poglavlja, mreže pojmova ili autorskih profila.

- `design-tokens.yml`: jedini izvor palete Mint & Slate za radionicu.
- `styles/_tokens.scss`: preslikavanje vrijednosti i Bootstrap varijable.
- `styles/custom.scss`: radionica, navigacija, naslovnica i nastavni okviri.
- `styles/fonts.css`: lokalne datoteke pisama; iznimka za deklaracije font-face.
- `code/theme.R`: čita YAML za grafove; ne duplicira paletu.
- `styles/statistika.theme`: izvorna Pandoc tema sintakse (zasebne hex vrijednosti
  zahtijeva Pandoc).
- `styles/fonts/OFL-*.txt`: licence isporučenih pisama.

Naslovna zona koristi velika brand polja i geometriju. U čitateljskoj zoni
prigušena plava označuje pojam, koraljna grešku, a tamnozelena poveznice.
Svijetla menta nosi naslovnicu i odabir, hladna bijela pozadinu. Grafovi koriste
data-1/data-2 i različite vrste linija. Brojke na grafovima i u tablicama su
monospace. Tekst je ograničen na 66ch. Fokus ima punu crtu u boji tinte;
kontrole imaju najmanje 44 px. Tamna tema zasad nije uključena: isporučena
je jedna provjerena svijetla tema i ispis iz preglednika.

Provjera: `Rscript scripts/check_design.R`, zatim vizualni pregled naslovnice,
čitateljskog teksta, vježbi, grafa i mobilne navigacije. Knjiga nije ovisnost
za izgradnju ovog projekta. Nema vanjskog učitavanja pisama.

PDF builder također čita boje iz YAML-a. Nazivi brand-mustard i brand-navy
ostaju kompatibilni ključevi, ali sada nose mentu i prigušenu plavu.
Paleta teksta provjerena je na kontrast; svijetle boje služe površinama.
