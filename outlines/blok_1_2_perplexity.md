# Blok 1.2: Pretraživanje literature s Perplexity (45 min)

## Kontekst bloka

Ovo je prvi praktični blok radionice. Studenti su upravo prošli uvodni blok i razumiju osnove LLM-ova i etička pitanja. Sada prelaze na konkretan alat. Perplexity je odabran kao početna točka jer kombinira pretraživanje interneta s AI sintezom i automatskim citiranjem izvora, što ga čini idealnim uvodom u AI-potpomognuto istraživanje. Cilj bloka je da studenti nauče koristiti Perplexity za inicijalnu fazu pregleda literature i da razumiju kako verificirati rezultate.

---

## Sekcija A: Što je Perplexity i zašto ga koristiti (10 min)

### Sadržajni zahtjevi

**Perplexity kao AI pretraživač**
Objasni razliku između klasičnog pretraživanja (Google) i AI pretraživanja (Perplexity). Google daje linkove, Perplexity daje sintetizirane odgovore s izvorima. Ključna prednost: umjesto da otvarate 20 linkova i čitate svaki, dobivate sažetak s referencama na izvorne materijale.

**Kako Perplexity radi**
Korisnik postavlja pitanje u prirodnom jeziku. Perplexity pretražuje internet u realnom vremenu, prikuplja relevantne izvore, generira sažetak koristeći LLM, i citira svaki navod s numeriranim referencama. Model čita stvarne web stranice (za razliku od ChatGPT-a koji radi iz memorije). To znači da su informacije aktualne, ali i dalje treba verificirati.

**Besplatna vs. Pro verzija**
Besplatna verzija: 5 Pro pretraga dnevno, neograničeno Quick pretraga, dovoljna za radionicu. Pro verzija ($20/mj): neograničeno Pro pretraga, upload datoteka, bolji modeli. Za studente je besplatna verzija sasvim dovoljna za početak.

**Usporedba s alternativama**
Google Scholar: najbolji za akademske izvore ali nema sinteze. Semantic Scholar: izvrsna baza ali ograničen AI. Elicit: specijaliziran za akademska pitanja ali manji korpus. Connected Papers: vizualizacija mreže citata, komplementaran alat. Perplexity: najširi zahvat (web + akademski), idealan za eksploratornu fazu.

**Kada koristiti Perplexity, a kada ne**
Koristiti za: početno istraživanje teme, pronalaženje ključnih autora i radova, razumijevanje konteksta, pronalaženje podataka i statistika, provjeru tvrdnji. Ne koristiti za: finalni pregled literature (koristiti Google Scholar/baze), citiranje bez verifikacije, zamjenu za čitanje originalnih radova.

### Format prezentacije
Screenshot Perplexity sučelja s označenim ključnim elementima (search bar, izvori, inline citati). Tablica usporedbe alata za pretraživanje.

---

## Sekcija B: Demo workflow (15 min)

### Sadržajni zahtjevi

Demonstracija uživo korištenja Perplexity na konkretnom ekonomskom istraživačkom pitanju. Koristiti primjer iz radioničkog konteksta.

**Korak 1: Formuliranje pitanja za Perplexity**
Demonstriraj razliku između loših i dobrih upita.

Loš upit: "inflacija Hrvatska"
Rezultat: preopćeniti odgovor, mješavina vijesti i podataka, nejasni izvori.

Bolji upit: "Koji su ključni faktori koji utječu na percepciju inflacije kod kućanstava u europskim zemljama? Navedi akademske studije."
Rezultat: fokusiraniji odgovor, akademski izvori, relevantne studije.

Najbolji upit: "What are the main academic studies on the relationship between media coverage of central bank policy and inflation expectations in European economies? Focus on empirical papers published after 2015 that use text analysis or media indices."
Rezultat: specifični radovi, jasna metodološka kategorija, vremenski okvir. Napomena: engleski jezik daje bolje rezultate za akademsko pretraživanje.

**Korak 2: Analiza rezultata**
Pokaži kako čitati Perplexity odgovor: inline citati (numerirani), panel s izvorima sa strane, mogućnost klikanja na svaki izvor. Objasni kako prepoznati kvalitetu izvora: akademski rad vs. blog post vs. novinarski članak vs. Wikipedia.

**Korak 3: Iterativno pretraživanje**
Demonstriraj follow-up pitanja u istom threadu. Na primjer, nakon prvog odgovora pitaj: "Od navedenih studija, koje koriste panel podatke za europske zemlje? Možeš li navesti točne naslove i autore?" Pokaži kako se odgovor sužava i precizira s iteracijom.

**Korak 4: Provjera izvora**
Ovo je ključni korak. Uzmi 3 izvora iz Perplexity odgovora i pokaži postupak verifikacije.
Izvor 1: akademski rad koji postoji (provjeri na Google Scholar, nađi DOI). Rezultat: potvrđen.
Izvor 2: akademski rad koji postoji ali je krivo citiran (pogrešna godina ili autori). Rezultat: djelomično točan, treba korigirati.
Izvor 3: izvor koji je zapravo blog post a ne akademski rad. Rezultat: neprikladan za akademsko citiranje.

**Korak 5: Organizacija pronađenih izvora**
Pokaži kako rezultate iz Perplexity prenijeti u strukturirani format: copy/paste u Zotero, kreiranje bilješki u markdown formatu, kategorizacija izvora prema relevantnosti.

### Format prezentacije
Live demo (ili simulirani screenshots ako nema interneta). Serija 3-4 promptova s jasno označenim rezultatima. Side-by-side prikaz Perplexity rezultata i Google Scholar verifikacije.

---

## Sekcija C: Napredne tehnike pretraživanja (5 min)

### Sadržajni zahtjevi

**Focus mode**
Perplexity nudi različite moduse pretraživanja: All (opći web), Academic (samo akademski izvori), Writing (pomoć pri pisanju), Math (matematički problemi), Video (video sadržaj). Za akademsko istraživanje, Academic mode je ključan jer filtrira rezultate na peer-reviewed izvore.

**Collections i organizacija**
Kako koristiti Perplexity Collections za organizaciju istraživanja. Kreiranje kolekcije za svaku temu. Dijeljenje kolekcija s kolegama. Ovo je korisno za grupne projekte.

**Prompt obrasci za akademsko pretraživanje**
Navedi 5-6 gotovih prompt obrazaca koje studenti mogu koristiti.

Obrazac za pregled literature: "What are the key academic papers on [topic] published between [year] and [year]? Focus on [methodology/approach]. List authors, titles, journals, and main findings."

Obrazac za metodološki pregled: "What empirical methods have been used to study [topic]? Compare OLS, IV, DiD, and RDD approaches used in recent studies."

Obrazac za teorijski okvir: "What are the main theoretical frameworks used to explain [phenomenon]? Describe each theory, its key assumptions, and empirical predictions."

Obrazac za pregled podataka: "What datasets are commonly used to study [topic] in [country/region]? Include data source, time period, and key variables."

Obrazac za provjeru tvrdnje: "Is it true that [specific claim]? What does the academic evidence say? Cite specific studies."

### Format prezentacije
Tablica prompt obrazaca s primjerima. Screenshot Academic mode sučelja.

---

## Sekcija D: Praktična vježba (15 min)

### Sadržajni zahtjevi

**Zadatak za studente**
Studenti rade individualno na vlastitoj temi (ili koriste zadanu temu ako nemaju svoju).

Koraci vježbe:
1. Formulirati istraživačko pitanje iz svoje teme (2 min)
2. Napisati 3 Perplexity upita s rastućom specifičnošću (5 min)
3. Iz najboljih rezultata identificirati 5 potencijalno relevantnih izvora (3 min)
4. Verificirati barem 2 izvora na Google Scholar (3 min)
5. Zapisati kratku bilješku o tome što je pronađeno i što treba dalje istražiti (2 min)

**Zadane teme za studente bez vlastite teme**
Tema 1: Utjecaj monetarne politike ECB na tržišta rada u perifernim članicama eurozone
Tema 2: Digitalizacija i produktivnost u malim i srednjim poduzećima u jugoistočnoj Europi
Tema 3: Utjecaj inflacije na nejednakost dohotka u zemljama EU
Tema 4: Efektivnost fiskalnih poticaja za zelenu tranziciju u europskom kontekstu

**Očekivani ishod vježbe**
Svaki student treba imati: (1) jedno formulirano istraživačko pitanje, (2) barem 3 verificirana izvora, (3) razumijevanje kako koristiti Perplexity za daljnje istraživanje. Ovi rezultati se koriste u sljedećim blokovima (Gemini i Claude).

**Debriefing (2 min)**
Kratka rasprava: Što ste pronašli? Je li nešto bilo halucirano? Kako se ovaj alat razlikuje od klasičnog Google pretraživanja?

### Format prezentacije
Zadatak na slajdu s jasnim koracima i vremenskim okvirima. Lista zadanih tema na zasebnom slajdu.

---

## Poveznica s referentnim istraživanjem

Kroz blok koristiti primjer iz referentnog istraživanja (HNB medijska analiza):

Demonstriraj kako bi student koristio Perplexity za početno istraživanje teme "medijsko praćenje centralne banke i inflacijska očekivanja". Pokaži kako Perplexity može pronaći ključne pojmove (rational inattention, media gatekeeping, IAG indeks), relevantne autore (Sims 2003, Carroll 2003, Lamla & Lein 2014), i empirijske pristupe (text mining novinskih članaka, construction of attention indices).

---

## Tehničke napomene

Jezik: hrvatski (promptovi mogu biti na engleskom za bolje rezultate, objasniti zašto)
Pristup: besplatna verzija Perplexity, ne pretpostavljati Pro pristup
Backup plan: ako internet ne radi, imati pripremljene screenshots demo pretraga
Timing: strogo poštivati 15 min za vježbu, studenti trebaju praktično iskustvo
