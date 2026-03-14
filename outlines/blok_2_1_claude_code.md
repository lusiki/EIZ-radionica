# Blok 2.1: Agentsko kodiranje s Claude Code (45 min)

## Kontekst bloka

Drugi dan radionice fokusira se na kodiranje i pisanje. Studenti dolaze s istraživačkim pitanjem, verificiranim izvorima, i nacrtom rada iz prvog dana. Sada trebaju naučiti kako koristiti AI za generiranje, razumijevanje, i debugiranje koda za analizu podataka. Claude Code je odabran kao prvi alat jer demonstrira najsnažniji pristup AI kodiranju: agentsko kodiranje iz terminala, gdje AI čita datoteke, piše kod, izvršava ga, vidi greške, i iterativno popravlja. Cilj bloka je demistificirati proces kodiranja za studente koji nisu programeri i pokazati kako AI omogućuje analizu podataka čak i bez formalnog programerskog znanja.

---

## Sekcija A: Uvod u agentsko kodiranje (10 min)

### Sadržajni zahtjevi

**Što je agentsko kodiranje**
Razlika između tri generacije AI kodiranja.
Generacija 1: Autocomplete (GitHub Copilot, Tabnine). AI predviđa sljedeći red koda dok pišete. Vi i dalje pišete većinu koda.
Generacija 2: Chat-based coding (ChatGPT, Claude chat). Opišete što želite, AI generira blok koda koji kopirate u svoj editor. Ali AI ne vidi vaš projekt, ne može izvršiti kod, ne može vidjeti greške.
Generacija 3: Agentsko kodiranje (Claude Code, Cursor Agent, Windsurf). AI agent ima pristup vašem cijelom projektu. Može čitati datoteke, pisati kod, izvršavati ga, vidjeti output i greške, i iterativno popravljati. To je kao da imate programera koji sjedi pokraj vas.

**Kako Claude Code radi**
Terminal-based alat. Pokreće se u terminalu (command line). Nema grafičko sučelje, samo tekstualni razgovor. Ali to mu daje pristup cijelom file sistemu i mogućnost izvršavanja naredbi.

Demonstriraj osnovni workflow:
(a) Otvorite terminal u direktoriju s vašim projektom.
(b) Pokrenete claude (ili claude code naredbu).
(c) Opišete što želite na prirodnom jeziku: "Učitaj CSV datoteku s makroekonomskim podacima za Hrvatsku, napravi deskriptivnu statistiku, i plotaj vremensku seriju BDP-a."
(d) Claude Code čita datoteke u direktoriju, piše R ili Python skriptu, izvršava je, i pokazuje rezultat.
(e) Ako postoji greška, automatski je detektira i pokušava popraviti.

**Pristup i instalacija**
Claude Code zahtijeva API pristup (Anthropic API key). Nije besplatan ali postoji ograničen kredit za demo. Za radionicu: demonstracija uživo, studenti gledaju i uče pristup, a praktični rad rade u sljedećim blokovima s Copilot/Positron. Alternativno, ako postoji mogućnost privremenog pristupa za studente, organizirati hands-on.

**Za koga je Claude Code**
Istraživači koji trebaju generirati kod ali nisu profesionalni programeri. Studenti koji pišu diplomski rad i trebaju analizu podataka. Ekonomisti koji znaju statistiku ali ne znaju sintaksu R-a ili Pythona. Ključna poruka: ne trebate znati programirati da koristite Claude Code, ali trebate znati što želite analizirati i kako interpretirati rezultate.

### Format prezentacije
Screenshot Claude Code terminala. Dijagram usporedbe tri generacije AI kodiranja. Kratki video ili GIF Claude Code sesije.

---

## Sekcija B: Demo workflow na referentnom istraživanju (20 min)

### Sadržajni zahtjevi

Ovo je središnji dio bloka. Demonstracija cjelovitog analitičkog pipelinea korištenjem Claude Code na primjeru iz referentnog istraživanja. Podijeliti u korake koji odgovaraju tipičnim fazama ekonometrijske analize.

**Korak 1: Učitavanje i eksploracija podataka**
Prompt: "U direktoriju imam CSV datoteku s podacima o medijskom praćenju HNB-a. Učitaj podatke, pokaži mi prvih 10 redova, dimenzije dataseta, tipove varijabli, i deskriptivnu statistiku za sve numeričke varijable."

Pokaži kako Claude Code:
Čita CSV koristeći data.table ili readr.
Generira summary statistiku.
Identificira missing values.
Predlaže vizualizacije za bolje razumijevanje podataka.

Objasni studentima da je ključno opisati ŠTO želite (eksplorirati podatke) a ne KAKO (koju funkciju koristiti). AI bira optimalan pristup.

**Korak 2: Čišćenje i priprema podataka**
Prompt: "Očisti podatke: ukloni duplikate, zamijeni missing values medijanom za numeričke varijable, kreiraj novu varijablu log_attention koja je logaritam varijable media_attention, i filtriraj podatke za period 2015-2023."

Pokaži kako Claude Code generira pipeline za čišćenje, izvršava ga, i prikazuje rezultat. Pokaži kako se nositi s greškama: ako varijabla ne postoji, Claude Code detektira grešku i traži pojašnjenje.

**Korak 3: Vizualizacija**
Prompt: "Napravi tri vizualizacije: (1) vremensku seriju media_attention i inflation_expectations na istom grafu s dvije y-osi, (2) scatter plot s regression line između log_attention i inflation_expectations, (3) heatmapu korelacijske matrice svih numeričkih varijabli. Koristi ggplot2 s čistim akademskim temom."

Demonstriraj kako Claude Code generira ggplot2 kod, izvršava ga, i prikazuje grafove. Pokaži iteraciju: "Promijeni boje u crno-bijelo, dodaj naslove na hrvatskom, povećaj font na osima."

**Korak 4: Ekonometrijska analiza**
Prompt: "Procijeni OLS model gdje je zavisna varijabla inflation_expectations a nezavisne varijable su log_attention, unemployment, gdp_growth, i ecb_rate. Koristi Newey-West HAC standardne greške s automatskim odabirom bandwidtha. Prikaži rezultate u urednoj tablici."

Pokaži kako Claude Code:
Koristi lm() za procjenu.
Primjenjuje sandwich/lmtest pakete za HAC standardne greške.
Generira gt ili stargazer tablicu.
Interpretira koeficijente.

**Korak 5: Robustnost**
Prompt: "Napravi robustness check: (1) dodaj kontrolne varijable jednu po jednu i pokaži kako se mijenja koeficijent na log_attention, (2) procijeni model za različite podperiode (2015-2018, 2019-2023), (3) napravi specification curve plot."

Pokaži kako Claude Code gradi kompleksniji analitički pipeline koji automatizira višestruke specifikacije.

### Format prezentacije
Live demo u terminalu (ili pripremljeni screenshots/video). Svaki korak na zasebnom slajdu s promptom, generiranim kodom, i outputom. Naglasiti kako je svaki prompt na prirodnom jeziku, ne u kodu.

---

## Sekcija C: Kako opisati što želite kada ne znate programirati (10 min)

### Sadržajni zahtjevi

Ovo je praktična sekcija za studente koji nemaju programersko iskustvo. Cilj je dati im framework za komunikaciju s AI o analizi podataka.

**Vocabulary za opisivanje analize podataka**
Studenti ne moraju znati R funkcije, ali moraju znati opisati što žele na konceptualnoj razini. Tablica ključnih pojmova.

Što želite: "Želim vidjeti koliko opservacija imam" > Tehički: nrow(), dim() > Kako reći AI: "Pokaži mi dimenzije dataseta i broj opservacija po varijabli."

Što želite: "Želim vidjeti distribuciju" > Tehnički: histogram, density plot > Kako reći AI: "Napravi histogram varijable X i navedi mean, median, sd."

Što želite: "Želim vidjeti vezu između X i Y" > Tehnički: scatter plot, korelacija, regresija > Kako reći AI: "Prikaži odnos između X i Y na scatter plotu, dodaj regression line, i izračunaj Pearsonovu korelaciju."

Što želite: "Želim kontrolirati za Z" > Tehnički: multivarijatna regresija > Kako reći AI: "Procijeni regresiju Y na X kontrolirajući za Z1, Z2, Z3."

Što želite: "Želim vidjeti je li rezultat robustan" > Tehnički: robustness checks > Kako reći AI: "Ponovi analizu s različitim specifikacijama: bez kontrolnih varijabli, s osnovnim kontrolama, i s punim setom kontrola."

**Tri pravila za komunikaciju s AI o kodu**
Pravilo 1: Opisuj cilj, ne metodu. Umjesto "koristi lm() s sandwich paketom" reci "procijeni regresiju s robusnim standardnim greškama".
Pravilo 2: Opisuj podatke. Uvijek reci AI kakvi su tvoji podaci: "imam panel podatke za 27 EU zemalja u periodu 2010-2023, varijable su X, Y, Z".
Pravilo 3: Pitaj za objašnjenje. Nakon što AI generira kod, pitaj: "Objasni mi što svaki dio koda radi, korak po korak."

**Kako čitati kod koji AI generira**
Ne morate razumjeti svaki red, ali morate razumjeti strukturu. Demonstriraj na primjeru R skripte: učitavanje paketa > učitavanje podataka > čišćenje > analiza > vizualizacija > spremanje rezultata. Svaki blok ima jasnu funkciju.

### Format prezentacije
Tablica vokabulara s tri kolone (što želite / tehnički / kako reći AI). Anotiran kod s komentarima na svakom bloku.

---

## Sekcija D: Praktična vježba (5 min, kratka zbog prirode alata)

### Sadržajni zahtjevi

Budući da Claude Code zahtijeva API pristup koji većina studenata neće imati, vježba je konceptualna.

**Zadatak**
Studenti rade u parovima. Za svoj istraživački projekt iz Dana 1, napišu 5 promptova koji opisuju analitički pipeline.
Prompt 1: Učitavanje i eksploracija podataka (koji dataset, koje varijable).
Prompt 2: Čišćenje podataka (što treba popraviti, transformirati, filtrirati).
Prompt 3: Vizualizacija (koji grafovi su informatini za vašu analizu).
Prompt 4: Statistička analiza (koji model, koje varijable, koji test).
Prompt 5: Robustnost (kako provjeriti osjetljivost rezultata).

**Debriefing**
Par studenata čita svoje prompte. Grupa diskutira: Je li prompt dovoljno specifičan? Što nedostaje? Kako bi ga poboljšali? Ovo priprema studente za sljedeći blok gdje će zaista pisati i izvršavati kod.

### Format prezentacije
Zadatak na slajdu. Primjer 5 promptova za referentno istraživanje kao model.

---

## Poveznica s referentnim istraživanjem

Cijeli demo workflow temelji se na referentnom istraživanju (HNB medijska analiza). Pokaži kako je cjelokupni pipeline od 4 .qmd datoteke (01_data_retrieval, 02_data_adjustment, 03_econometric_estimation, 04_rezultati) kreiran uz pomoć AI alata. Specifično naglasi:

DuckDB upiti s 7 hrvatskih deklinacija za pretraživanje institucionalnih naziva: demonstrira kako AI može razumjeti jezične specifičnosti.
Jaccard deduplication s day-clustering: demonstrira kako AI može implementirati napredne algoritme koje student ne bi sam napisao.
Newey-West HAC s automatskim bandwidth selectionom: demonstrira kako AI poznaje ekonometrijsku teoriju i može primijeniti odgovarajuće metode.
Specification curve s 50+ specifikacija: demonstrira kako AI može automatizirati robustness checkove koji bi ručno trajali satima.

---

## Tehničke napomene

Pristup: Claude Code zahtijeva API pristup. Organizirati demo uživo, studenti gledaju. Praktični hands-on u sljedećem bloku s Copilot koji je besplatan za studente.
R fokus: demo koristi R jer je to primarni jezik za ekonometrijsku analizu na hrvatskim fakultetima. Napomenuti da Claude Code jednako dobro radi s Pythonom.
Backup: pripremiti video snimku demo-a u slučaju tehničkih problema.
Timing: demo je najduži dio (20 min), osigurati da je dobro pripremljen i bez tehničkih zastoja.
