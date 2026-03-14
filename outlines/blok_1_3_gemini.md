# Blok 1.3: Dubinsko istraživanje s Gemini Deep Research (45 min)

## Kontekst bloka

Studenti su u prethodnom bloku koristili Perplexity za inicijalnu eksploraciju teme i pronalaženje izvora. Sada prelaze na Gemini Deep Research koji omogućuje generiranje dugih, strukturiranih istraživačkih izvješća. Ključna razlika: Perplexity daje kratke odgovore s izvorima, Gemini Deep Research generira cjelovite višestraničke izvještaje s organiziranim poglavljima. Ovaj blok uči studente kako koristiti Deep Research za generiranje prve verzije pregleda literature ili istraživačkog izvješća, i kako kritički evaluirati takav output.

---

## Sekcija A: Što je Gemini Deep Research (10 min)

### Sadržajni zahtjevi

**Gemini ekosustav**
Kratki pregled Gemini modela: Gemini 1.5 Pro (dugi kontekst do 1M tokena), Gemini 2.0 Flash (brz i efikasan), Gemini Advanced (pristup Deep Research). Deep Research je značajka dostupna unutar Gemini Advanced (dolazi s Google One AI Premium, $20/mj, ali postoji besplatni probni period).

**Kako Deep Research funkcionira**
Za razliku od standardnog chatbota koji daje jedan odgovor, Deep Research provodi višekoračni istraživački proces.
Korak 1: Korisnik zadaje istraživačko pitanje ili temu.
Korak 2: Gemini kreira istraživački plan (predloženu strukturu izvješća).
Korak 3: Korisnik može modificirati plan prije pokretanja.
Korak 4: Gemini pretražuje desetke do stotine web izvora.
Korak 5: Generira strukturirano izvješće s poglavljima, potpoglavljima, i inline citatima.
Korak 6: Izvješće se sprema u Google Docs za daljnje uređivanje.

Proces traje 5-15 minuta (za razliku od instant odgovora). To je feature, ne bug, jer model zaista pretražuje i sintetizira mnoge izvore.

**Što Deep Research dobro radi**
Generiranje strukturiranih pregleda literature. Sintetiziranje informacija iz mnoštva izvora u koherentan tekst. Identificiranje ključnih debata i kontroverzi u polju. Davanje konteksta za temu s kojom student nije upoznat. Generiranje prvog nacrta koji se može koristiti kao polazna točka.

**Ograničenja Deep Research**
Ne pretražuje akademske baze (samo web). To znači da primarno koristi: novinke, blog postove, enciklopedijske izvore, javno dostupne radove (open access), i stranice poput NBER, SSRN, ResearchGate, ali ne Scopus, WoS, ili zaključane časopise. Može generirati tekst koji zvuči autoritativno ali je površan. Ne razumije metodološke nijanse (ne može evaluirati kvalitetu RCT vs. observacijske studije). Može previdjeti ključne radove koji nisu open access.

**Kada koristiti Deep Research**
Početna faza istraživanja kada trebate brzi pregled terena. Upoznavanje s novom temom. Generiranje strukture pregleda literature koju ćete zatim popuniti kvalitetnim izvorima. Usporedba različitih perspektiva na istu temu. Ne koristiti kao finalni pregled literature bez značajne prerade.

### Format prezentacije
Dijagram višekoračnog procesa Deep Research. Tablica prednosti i ograničenja. Screenshot Gemini sučelja s Deep Research opcijom.

---

## Sekcija B: Demo workflow (15 min)

### Sadržajni zahtjevi

Live demonstracija korištenja Deep Research na ekonomskoj temi. Budući da proces traje 5-15 minuta, pripremiti unaprijed generirano izvješće za demonstraciju, ali pokrenuti novi Deep Research na početku sekcije i pokazati plan koji Gemini predlaže.

**Korak 1: Formuliranje zadatka za Deep Research**
Demonstriraj kako napisati dobar prompt za Deep Research. Ključno je dati dovoljno konteksta i specifičnosti.

Loš prompt: "Napiši pregled literature o inflaciji."
Problem: preopćenito, rezultat će biti udžbenički pregled bez fokusa.

Dobar prompt: "Napravi detaljan pregled akademske literature o utjecaju medijskog izvještavanja o monetarnoj politici na inflacijska očekivanja kućanstava. Fokusiraj se na empirijske studije objavljene nakon 2010. godine. Obuhvati sljedeće teme: (1) teorijski okvir rational inattention i sticky information modeli, (2) mjerenje medijske pažnje prema centralnim bankama (media attention indices), (3) empirijski dokazi o vezi medijskog praćenja i inflacijskih očekivanja, (4) metodološki pristupi (text mining, sentiment analysis, panel modeli). Za svaku studiju navedi autore, godinu, metodu, glavne nalaze i ograničenja."

Objasni zašto je drugi prompt bolji: specifična tema, vremenski okvir, metodološki fokus, jasna struktura, zahtjev za detaljima o svakoj studiji.

**Korak 2: Evaluacija istraživačkog plana**
Gemini će predložiti strukturu izvješća. Pokaži kako evaluirati i modificirati predloženi plan. Na primjer, ako Gemini predloži sekciju "History of Central Banking" koja je irelevantna, ukloniti je. Ako nedostaje sekcija o metodologiji, dodati je. Ovo je ključna vještina jer studenti trebaju aktivno oblikovati AI output.

**Korak 3: Analiza generiranog izvješća**
Koristi unaprijed pripremljeno izvješće za detaljnu analizu. Prođi kroz svaku sekciju i pokaži.

Što je dobro: koherentna struktura, identificirani ključni autori, pregled empirijskih metoda, jasna organizacija po temama.

Što je problematično: površan tretman metodologije (navodi "OLS regresiju" bez detalja o specifikaciji), nedostaju ključni radovi koji nisu open access, neki citati su web stranice a ne akademski radovi, generalizacije bez nuance ("studies show that..." bez specifičnih brojki).

Što nedostaje: najnoviji radovi (koji su iza paywalla), radovi na jezicima osim engleskog (npr. relevantna hrvatska ili njemačka literatura), kritička evaluacija kvalitete studija, identifikacija istraživačkih praznina.

**Korak 4: Pretvaranje Deep Research outputa u korisni materijal**
Pokaži konkretne korake što napraviti s izvješćem.
(a) Ekstrahirati listu izvora i verificirati svaki na Google Scholar.
(b) Koristiti identificirane ključne riječi za ciljano pretraživanje akademskih baza.
(c) Koristiti strukturu izvješća kao polaznu točku za vlastiti pregled literature, ali zamijeniti nepouzdane izvore akademskim radovima.
(d) Identificirati praznine u Deep Research izvješću kao smjer za vlastito istraživanje.

### Format prezentacije
Side-by-side: prompt i Gemini plan. Anotiran screenshot izvješća s komentarima "dobro / problematično / nedostaje". Workflow dijagram: Deep Research output > verifikacija > dopuna > vlastiti pregled.

---

## Sekcija C: Usporedba Perplexity i Gemini Deep Research (5 min)

### Sadržajni zahtjevi

Direktna usporedba dva alata na istom istraživačkom pitanju.

**Dimenzije usporedbe**

Brzina: Perplexity (instant), Gemini Deep Research (5-15 min)
Dubina: Perplexity (površinsko pretraživanje, kratki odgovori), Gemini (duboka sinteza, dugo izvješće)
Izvori: Perplexity (svaki navod ima inline citat), Gemini (citati u tekstu ali manje konzistentno)
Interaktivnost: Perplexity (iterativni follow-up), Gemini (jedan dugi output)
Format: Perplexity (chat), Gemini (strukturirano izvješće u Google Docs)
Cijena: Perplexity (besplatno za osnovno), Gemini Deep Research (zahtijeva Gemini Advanced)

**Komplementarnost alata**
Optimalni workflow: Perplexity za brzu eksploraciju i provjeru > Gemini za dubinsku sintezu > Google Scholar za akademsku verifikaciju. Ova tri alata pokrivaju različite potrebe istraživačkog procesa i najbolje rade zajedno.

**Odlučivanje: koji alat kada**
Tablica odlučivanja s konkretnim scenarijima:
"Trebam brzo provjeriti jednu činjenicu" > Perplexity
"Trebam razumjeti novo polje za 30 minuta" > Gemini Deep Research
"Trebam pronaći specifičan akademski rad" > Google Scholar
"Trebam sintezu 20+ izvora u koherentan tekst" > Gemini Deep Research
"Trebam verificirati izvor" > Perplexity + Google Scholar

### Format prezentacije
Usporedna tablica s vizualnim indikatorima (zvjezdice ili stupci). Dijagram odlučivanja (decision tree).

---

## Sekcija D: Praktična vježba (15 min)

### Sadržajni zahtjevi

**Zadatak za studente**
Studenti koriste istraživačko pitanje i izvore iz prethodnog bloka (Perplexity vježba) i sada ih produbljuju s Gemini.

Koraci vježbe:
1. Formulirati Deep Research prompt na temelju svog istraživačkog pitanja iz prethodnog bloka (3 min). Koristiti obrazac: tema + vremenski okvir + metodološki fokus + zahtjev za strukturom.
2. Pokrenuti Deep Research i dok čekaju rezultat (5-10 min), pregledati plan koji Gemini predlaže i po potrebi ga modificirati.
3. Dok čekaju, zadatak: napisati kratku bilješku (5 rečenica) o tome što su naučili iz Perplexity pretraživanja i što očekuju od Deep Research izvješća. Identificirati 3 pitanja na koja još nemaju odgovor.
4. Kada izvješće stigne, brzo pregledati strukturu i identificirati: (a) najkorisniju sekciju, (b) sekciju koja im se čini nepouzdanom, (c) što nedostaje.

**Alternativni zadatak (ako Deep Research nije dostupan besplatno)**
Koristiti standardni Gemini chat s dugim promptom koji simulira Deep Research pristup. Na primjer, poslati prompt koji zahtijeva strukturirano izvješće s podnaslovima i izvorima. Rezultat neće biti jednako dobar, ali demonstrira princip.

**Debriefing**
Kratka diskusija: Kakva je bila kvaliteta izvješća? Što je bilo korisno, a što ne? Kako biste koristili ovaj output u svom radu?

### Format prezentacije
Zadatak s jasnim koracima i vremenskim okvirima. Primjer dobrog Deep Research prompta na slajdu. Checklist za evaluaciju izvješća.

---

## Poveznica s referentnim istraživanjem

Demonstriraj kako bi Deep Research generirao izvješće o temi referentnog istraživanja. Na primjer, prompt: "Napravi pregled literature o mjerenju medijske pažnje prema centralnim bankama u europskim zemljama, s fokusom na konstrukciju media attention indeksa iz novinskih članaka, te na empirijsku vezu između medijskog praćenja i inflacijskih očekivanja."

Pokaži kako bi ovakvo izvješće moglo identificirati ključne koncepte iz referentnog istraživanja (Phillips krivulja s modifikacijom pažnje, IAG indeks, Newey-West korekcija) ali i propustiti specifične hrvatske izvore i DuckDB metodologiju koja je specifična za to istraživanje.

---

## Tehničke napomene

Pristup: potreban je Gemini Advanced za Deep Research (besplatni probni period postoji). Pripremiti alternative za studente bez pristupa.
Timing: Deep Research traje 5-15 min, pa vježbu organizirati tako da studenti rade na bilješkama dok čekaju.
Backup: imati unaprijed generirano izvješće spremno za demo u slučaju tehničkih problema.
Internet: obavezan za ovaj blok, nema offline alternativu.
