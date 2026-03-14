# Blok 2.2: IDE integracija s GitHub Copilot i Positron (45 min)

## Kontekst bloka

U prethodnom bloku studenti su vidjeli agentsko kodiranje s Claude Code. Sada prelaze na integraciju AI u svakodnevni razvojni workflow. Copilot + Positron predstavljaju pristupačniji model AI kodiranja: umjesto terminala, AI je integriran u IDE (Integrated Development Environment) koji studenti koriste za pisanje i izvršavanje koda. Ključna prednost: studenti mogu besplatno dobiti Copilot kroz GitHub Student Developer Pack, a Positron je besplatan IDE za R i Python. Cilj bloka je praktičan hands-on rad s kodom u IDE okruženju.

---

## Sekcija A: Positron i zašto novi IDE (10 min)

### Sadržajni zahtjevi

**Što je Positron**
Positron je novi IDE za R i Python koji razvija Posit (bivši RStudio). Izgrađen na VS Code arhitekturi, ali dizajniran specifično za data science. Kombinira poznato R okruženje (konzola, Environment pane, Viewer) s modernim editor značajkama (extensions, terminal, Git integracija). Beta verzija, besplatan.

**Zašto Positron umjesto RStudio**
RStudio je odličan alat ali nema nativnu AI integraciju. Positron podržava VS Code extension ekosustav, što znači da GitHub Copilot, Codeium, i drugi AI alati rade nativno. Poznat layout za RStudio korisnike (Environment, Console, Plots paneli su na istim mjestima). Moderan editor s boljim autocomplete, višestrukim kursorima, i integriranim terminalom.

**Kratki tour sučelja**
Demonstriraj ključne elemente: editor panel, R konzola, Environment pane, Files pane, Terminal, Extensions. Pokaži kako otvoriti .R ili .qmd datoteku, izvršiti kod (Ctrl+Enter), i vidjeti rezultate u Plots panelu. Usporediti s RStudio layoutom da studenti vide sličnosti.

**Instalacija i setup**
Preuzimanje s positron.posit.co. Dostupan za Windows, Mac, Linux. R treba biti instaliran zasebno (ali studenti to već imaju iz preduvjeta). Demonstrirati osnovno podešavanje: izbor R interpretera, instalacija paketa.

### Format prezentacije
Screenshot Positron sučelja s označenim panelima. Side-by-side usporedba Positron i RStudio layouta.

---

## Sekcija B: GitHub Copilot za studente (10 min)

### Sadržajni zahtjevi

**Što je GitHub Copilot**
AI autocomplete alat koji predviđa i predlaže kod dok pišete. Integriran direktno u editor (Positron/VS Code). Tri moda: inline suggestions (predviđa sljedeći red), Copilot Chat (razgovor o kodu u sidebar panelu), i Copilot Edits (predlaže izmjene postojećeg koda).

**Besplatan pristup za studente**
GitHub Student Developer Pack uključuje besplatni Copilot pristup. Potreban je .edu email ili verifikacija studentskog statusa. Proces prijave: github.com/education > Student Developer Pack > verificiraj studentski status > aktiviraj Copilot. Napomena: proces verifikacije može trajati nekoliko dana, pa studenti to trebaju napraviti unaprijed (pokriveno u Prerequisites).

**Kako Copilot radi u praksi**
Inline suggestions: dok pišete kod, Copilot predlaže nastavak u sivom tekstu. Tab za prihvaćanje, Esc za odbijanje. Primjer: počnete pisati "library(gg" i Copilot predlaže "library(ggplot2)". Počnete pisati komentar "# Scatter plot of GDP vs inflation" i Copilot generira cijeli ggplot2 blok koda.

Copilot Chat: otvorite chat panel i opišete što želite. Razlika od Claude Code: Copilot Chat vidi vaš trenutni file i projekt, ali ne izvršava kod automatski. Vi morate kopirati generirani kod u editor i pokrenuti ga.

**Ograničenja Copilota**
Predviđa na temelju konteksta, ali nema duboko razumijevanje vaše analize. Može predložiti netočan kod koji izgleda ispravno. Ne razumije statističku teoriju: može predložiti OLS kada trebate IV estimator. Uvijek trebate razumjeti i verificirati kod koji Copilot predlaže.

### Format prezentacije
GIF ili video inline suggestion. Screenshot Copilot Chat panela. Korak-po-korak proces aktivacije za studente.

---

## Sekcija C: Demo workflow u Positron s Copilotom (10 min)

### Sadržajni zahtjevi

Praktična demonstracija pisanja R skripte uz pomoć Copilota. Koristiti pojednostavljenu verziju analize iz referentnog istraživanja.

**Setup demo**
Otvoriti Positron s pripremljenim projektom. U direktoriju: CSV s makroekonomskim podacima (GDP, inflacija, nezaposlenost, media attention index za Hrvatsku, 2010-2023). Kreirati novu .R datoteku.

**Korak 1: Učitavanje podataka uz Copilot**
Napisati komentar: "# Učitaj podatke o medijskom praćenju i inflaciji u Hrvatskoj"
Copilot predlaže: library(readr) i read_csv() poziv.
Prihvatiti prijedlog, dodati head() za pregled.
Demonstrirati kako Copilot koristi naziv datoteke iz direktorija.

**Korak 2: Deskriptivna statistika s Copilot Chat**
Otvoriti Copilot Chat. Prompt: "Napravi deskriptivnu statistiku za sve varijable u datasetu df. Koristi gt paket za tablicu."
Copilot generira kod. Kopirati u editor. Pokrenuti.
Pokazati iteraciju: "Dodaj grupirano po godini."

**Korak 3: Vizualizacija s inline suggestions**
Početi pisati: "# Time series plot of media attention and inflation"
Copilot predlaže ggplot2 kod za vremensku seriju.
Pokazati kako prihvatiti djelomično, modificirati, ili odbiti prijedlog.
Iteracija: dodati naslove, promijeniti temu, dodati drugu y-os.

**Korak 4: Regresija s Copilot Chat**
Prompt u Chat: "Procijeni OLS regresiju: inflation_expectations ~ log(media_attention) + unemployment + gdp_growth. Dodaj Newey-West HAC standardne greške. Prikaži rezultate u stargazer tablici."
Demonstrirati kako Copilot Chat generira kompleksniji kod s ispravnim paketima (sandwich, lmtest).
Kopirati kod, izvršiti, vidjeti rezultat.

**Korak 5: Iterativno poboljšanje**
Selektirati blok koda, otvoriti Copilot Chat, pitati: "Dodaj specifikaciju s kvadratnim članom media_attention i prikaži oba modela side-by-side."
Demonstrirati workflow: selektirati > pitati > dobiti > zalijepiti > izvršiti > evaluirati.

### Format prezentacije
Live demo u Positron. Svaki korak na screenu s vidljivim Copilot prijedlozima. Pausirati na ključnim momentima i objasniti što se događa.

---

## Sekcija D: Praktična vježba (15 min)

### Sadržajni zahtjevi

Ovo je prvi pravi hands-on coding blok za studente.

**Priprema**
Osigurati da svi studenti imaju: Positron instaliran, Copilot aktiviran (ili barem besplatan Codeium kao backup), pristup demo datasetu (distribuiran preko USB ili linka).

**Dataset za vježbu**
Pripremljeni CSV s makroekonomskim podacima. Varijable: country, year, gdp_growth, inflation, unemployment, interest_rate, media_attention_index. 27 EU zemalja, 2010-2023. Jednostavan dataset koji omogućuje razne analize.

**Zadatak (3 razine složenosti)**

Razina 1 (studenti bez programerskog iskustva):
1. Otvorite .R datoteku u Positronu (1 min)
2. Napišite komentar koji opisuje što želite: "# Učitaj podatke i prikaži prvih 10 redova" (1 min)
3. Prihvatite Copilot prijedlog ili koristite Chat za generiranje koda (3 min)
4. Napravite histogram jedne varijable po izboru (3 min)
5. Napravite scatter plot dvije varijable po izboru (3 min)
6. Pokrenite summary() na datasetu (2 min)

Razina 2 (studenti s osnovnim R znanjem):
1. Učitajte podatke i filtrirajte za Hrvatsku (2 min)
2. Napravite vremensku seriju inflacije i nezaposlenosti na istom grafu (4 min)
3. Izračunajte korelacijsku matricu i vizualizirajte je (4 min)
4. Procijenite jednostavnu regresiju: inflation ~ gdp_growth + unemployment (3 min)
5. Interpretirajte rezultate u komentarima (2 min)

Razina 3 (studenti s naprednim R znanjem):
1. Panel analiza: procijenite fixed effects model za sve EU zemlje (3 min)
2. Dodajte Newey-West HAC standardne greške (3 min)
3. Specification curve: procijenite 10 specifikacija s različitim kontrolama (5 min)
4. Vizualizirajte specification curve (4 min)

**Debriefing (2 min)**
Što je radilo dobro? Gdje je Copilot pogriješio? Jeste li razumjeli generirani kod?

### Format prezentacije
Zadatak na slajdu s tri razine jasno označene. Dataset link ili USB distribucija. Očekivani outputi za svaku razinu (screenshots).

---

## Poveznica s referentnim istraživanjem

Koristiti pojednostavljenu verziju pipeline-a iz referentnog istraživanja. Demonstrirati kako su ključni koraci iz 01_data_retrieval.qmd i 03_econometric_estimation.qmd mogli biti generirani uz AI.

Na primjer, pokazati kako je Copilot u stanju generirati: ilike_block() funkciju za DuckDB pretraživanje kada mu date kontekst o hrvatskim deklinacijama, ggplot2 vizualizaciju IAG indeksa, i OLS s Newey-West korekcijom koristeći sandwich paket. Naglasiti da je AI ubrzao proces ali da je istraživač morao znati što želi (Newey-West, a ne obične standardne greške) i verificirati ispravnost.

---

## Tehničke napomene

Preduvjeti: Positron instaliran, R instaliran, Copilot aktiviran (ili Codeium kao besplatna alternativa bez verifikacije).
Backup za Copilot: Codeium extension (potpuno besplatan, ne zahtijeva studentsku verifikaciju) ili čak samo Positron IntelliSense bez AI.
Dataset: distribuirati unaprijed (email ili USB) da ne ovisi o internetu.
Timing: vježba je najduži dio (15 min), pustiti studente da rade bez previše prekidanja.
Asistencija: obilaziti studente tijekom vježbe i pomagati s tehničkim problemima (instalacija paketa, aktivacija Copilota).
