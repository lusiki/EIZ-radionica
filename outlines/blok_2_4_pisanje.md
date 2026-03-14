# Blok 2.4: Pisanje i uređivanje akademskog teksta s AI (45 min)

## Kontekst bloka

Završni praktični blok radionice. Studenti su kroz dva dana prošli cijeli istraživački ciklus: pretraživanje literature (Perplexity), sinteza (Gemini), strukturiranje (Claude), kodiranje (Claude Code, Copilot, LLM Notebooks). Sada dolazi posljednja faza: pisanje i uređivanje akademskog teksta. Cilj bloka je naučiti studente koristiti AI za poboljšanje vlastitog akademskog pisanja, a ne za generiranje teksta od nule. Ključna razlika: AI je editor i kritičar, ne autor.

---

## Sekcija A: AI u akademskom pisanju (10 min)

### Sadržajni zahtjevi

**Principi korištenja AI za pisanje**
AI ne piše umjesto vas. Vi pišete prvi nacrt, AI pomaže poboljšati. Ovo je fundamentalna razlika od "daj AI da napiše rad." Analogija: AI je lektor i recenzent, ne ghostwriter.

Razine asistencije:
Razina 1 (gramatika i stil): ispravka pogrešaka, poboljšanje rečenica, akademski ton. Potpuno prihvatljivo i etički neupitno.
Razina 2 (struktura i argumentacija): reorganizacija paragrafa, pojačanje tranzicija, logička konzistencija. Prihvatljivo uz transparentnost.
Razina 3 (generiranje sadržaja): pisanje novih paragrafa, generiranje argumenata. Mora biti opsežno prerađeno i označeno. Upitno ako se predaje kao vlastiti rad bez prerade.
Razina 4 (generiranje cijelog teksta): potpuno AI generiran tekst. Nedopušteno u akademskom kontekstu.

Cilj radionice je naučiti Razinu 1 i 2, s razumijevanjem granica.

**Koje AI alate koristiti za pisanje**
Claude: najbolji za duboku analizu teksta, reorganizaciju argumenata, i hrvatski jezik. Dugi kontekstni prozor omogućuje analizu cjelovitog rada.
ChatGPT: dobar za brze ispravke, generiranje alternativnih formulacija.
Grammarly: specijaliziran za englesku gramatiku i stil, ne za hrvatski. Koristan ako studenti pišu na engleskom.
DeepL Write: dobar za prijevod i stilsko poboljšanje, podržava hrvatski.
LanguageTool: open source alat za gramatiku na više jezika uključujući hrvatski.

**Specifičnosti akademskog pisanja na hrvatskom**
AI alati su općenito slabiji za hrvatski nego za engleski. Claude relativno dobro piše akademski hrvatski ali može napraviti stilske pogreške (anglicizme, neprirodni red riječi). Specifični izazovi: deklinacije, dugi složeni rečenice tipične za akademski stil, terminologija koja nema ustaljeni hrvatski ekvivalent. Preporuka: koristiti AI na engleskom za generiranje ideja i strukture, ali pisati finalni tekst na hrvatskom uz AI asistenciju za provjeru.

### Format prezentacije
Dijagram razina asistencije (1-4) s oznakom zeleno/žuto/crveno. Tablica AI alata za pisanje s prednostima i ograničenjima.

---

## Sekcija B: Prompt obrasci za akademsko pisanje (10 min)

### Sadržajni zahtjevi

Konkretni prompt obrasci koje studenti mogu odmah koristiti. Za svaki obrazac dati primjer inputa i outputa.

**Obrazac 1: Poboljšanje akademskog stila**
Prompt: "Evo paragrafa iz mog seminarskog rada: [paragraf]. Poboljšaj akademski stil: (a) zamijeni kolokvijalne izraze formalnijim, (b) pojačaj hedging gdje je potrebno (umjesto tvrdnji koristi formulacije poput 'rezultati sugeriraju' ili 'podaci upućuju na'), (c) poboljšaj koherentnost između rečenica. Objasni svaku promjenu."

Primjer input: "Inflacija je bila jako velika u 2022. i svima je bilo teško. HNB je puno toga napravio ali ljudi to nisu znali jer mediji nisu pisali o tome."
Primjer output: "Inflacijski pritisci zabilježeni u 2022. godini značajno su utjecali na kupovnu moć kućanstava. Premda je Hrvatska narodna banka poduzela niz mjera monetarne politike, ograničena medijska pokrivenost tih intervencija mogla je doprinijeti asimetričnoj informiranosti javnosti."

**Obrazac 2: Kritička analiza vlastitog argumenta**
Prompt: "Pročitaj sljedeći odlomak iz mog rada i identificiraj: (a) logičke slabosti u argumentaciji, (b) tvrdnje koje nisu potkrijepljene dokazima, (c) mjesta gdje trebam dodati citat ili referencu, (d) pretpostavke koje nisam eksplicitno naveo. Budi strog kao recenzent za akademski časopis."

**Obrazac 3: Generiranje tranzicija**
Prompt: "Evo dva uzastopna paragrafa iz mog rada: [paragraf 1] i [paragraf 2]. Predloži 3 varijante tranzicijske rečenice koja prirodno povezuje ove paragrafe i naglašava logičku vezu između argumenata."

**Obrazac 4: Sažimanje i parafraziranje**
Prompt: "Evo citata iz rada [autor, godina]: [citat]. Pararaziraj ovaj navod za moj pregled literature tako da: (a) zadrži ključnu ideju, (b) koristi moj stil pisanja [navesti primjer svog stila], (c) uklopi se u kontekst prethodnog paragrafa [navesti prethodni paragraf]. Dodaj in-text citat u APA formatu."

**Obrazac 5: Provjera konzistencije**
Prompt: "Evo uvoda i zaključka mog rada: [uvod] [zaključak]. Provjeri konzistenciju: (a) Odgovara li zaključak na istraživačko pitanje postavljeno u uvodu? (b) Jesu li svi nalazi navedeni u zaključku pokriveni u radu? (c) Ima li neslaganja u terminologiji ili tvrdnjama između uvoda i zaključka?"

**Obrazac 6: Generiranje prvog nacrta sekcije**
Prompt: "Na temelju sljedećeg nacrta, napiši prvi nacrt sekcije 'Teorijski okvir' (500-700 riječi). Struktura: (a) opći okvir [navesti teoriju], (b) primjena na moju temu [navesti], (c) ključne hipoteze koje proizlaze iz teorije. Koristi akademski stil, uključi hedging, i označi mjesta gdje trebam dodati reference s [REF]. Ovo je prvi nacrt koji ću značajno prerađivati."

### Format prezentacije
Svaki obrazac na zasebnom slajdu s inputom i outputom. Studenti mogu fotografirati slajdove kao referenca za budući rad.

---

## Sekcija C: Demo workflow za uređivanje teksta (10 min)

### Sadržajni zahtjevi

Demonstracija cjelovitog procesa uređivanja jedne sekcije seminarskog rada.

**Početno stanje**
Pripremiti "loš" prvi nacrt paragrafa iz teorijskog okvira referentnog istraživanja. Tekst treba sadržavati tipične studentske greške: kolokvijalan ton, nedostatak hedginga, loše tranzicije, tvrdnje bez referenci, previše dugi rečenice.

**Korak 1: Opća evaluacija**
Prompt: "Evaluiraj ovaj paragraf po kriterijima akademskog pisanja: stil (1-5), argumentacija (1-5), koherentnost (1-5), citiranje (1-5). Za svaku ocjenu navedi obrazloženje i konkretan prijedlog za poboljšanje."

Pokaži kako Claude daje strukturiranu evaluaciju s konkretnim, primjenjivim savjetima. Ne samo "poboljšaj stil" nego "u trećoj rečenici zamijenite 'jako puno' s 'značajno' ili 'u znatnoj mjeri'."

**Korak 2: Iterativno poboljšavanje**
Primijeniti savjete iz Koraka 1. Zamijeniti kolokvijalne izraze, dodati hedging, poboljšati tranzicije.
Poslati poboljšanu verziju natrag Claudeu: "Evo poboljšane verzije. Što je sad bolje i što još treba popraviti?"
Pokaži kako Claude prepoznaje poboljšanja i identificira preostale slabosti.

**Korak 3: Dodavanje dubine**
Prompt: "Ovaj paragraf je sada stilski bolji, ali mu nedostaje dubina. Predloži: (a) koji argument trebam dodati, (b) koju referencu bi trebalo citirati, (c) kako povezati ovaj paragraf s prethodnom sekcijom o [tema]."

**Korak 4: Finalna provjera**
Prompt: "Evo finalne verzije sekcije. Provjeri: (a) gramatiku i pravopis na hrvatskom, (b) konzistentnost terminologije, (c) je li svaka tvrdnja potkrijepljena ili označena s [REF]."

**Before/After prikaz**
Staviti početnu i finalnu verziju side-by-side. Pokaži transformaciju: od nečitljivog prvog nacrta do poliranog akademskog teksta. Naglasiti: student je radio cijelo vrijeme, AI je samo pomagao identificirati probleme i predlagati rješenja.

### Format prezentacije
Before/after na jednom slajdu. Kodirane promjene (crveno obrisano, zeleno dodano). Svaki korak kao zasebna iteracija.

---

## Sekcija D: Praktična vježba (15 min)

### Sadržajni zahtjevi

**Zadatak za studente**
Studenti koriste vlastiti tekst (nacrt iz Dana 1, ili tekst koji su donijeli) za vježbu uređivanja s AI.

Koraci vježbe:
1. Odabrati jedan paragraf iz svog nacrta (ili koristiti zadani primjer) (1 min)
2. Koristiti Obrazac 1 (poboljšanje stila) na svom paragrafu (4 min)
3. Koristiti Obrazac 2 (kritička analiza) na poboljšanoj verziji (4 min)
4. Primijeniti sugestije i napisati finalnu verziju (4 min)
5. Usporediti početnu i finalnu verziju: što se promijenilo i zašto? (2 min)

**Zadani tekst za studente bez vlastitog materijala**
Pripremiti 3 kratka paragrafa (svaki 5-6 rečenica) na hrvatskom, svaki s tipičnim studentskim greškama. Teme: utjecaj monetarne politike na tržište rada, digitalizacija i produktivnost, nejednakost dohotka u EU.

**Debriefing i Final Wrap-up (pridružen s Day 2 Wrap-up, 15 min ukupno)**

Rekapitulacija cijele radionice: workflow od ideje do gotovog teksta.
Vizualizacija kompletnog pipelinea:
Nejasna ideja > Perplexity (eksploracija) > Gemini (sinteza) > Claude (struktura) > Claude Code (analiza) > Copilot (kod) > LLM Notebooks (eksploracija) > Claude (pisanje) > Gotov rad.

Ključne poruke za kući:
1. AI alati su snažni ali nisu zamjena za razumijevanje i kritičko mišljenje.
2. Svaki alat ima svoju nišu, naučite koristiti pravi alat za pravi zadatak.
3. Verificirajte sve, nikad ne vjerujte AI outputu bez provjere.
4. Budite transparentni o korištenju AI.
5. Eksperimentirajte i gradite vlastiti workflow.

Resursi za nastavak učenja:
Lista svih alata korištenih na radionici s linkovima.
Svi prompt obrasci u jednom dokumentu (cheatsheet).
Preporučeni YouTube kanali i blogovi za praćenje AI razvoja.
Link na repozitorij radionice s materijalima.

Q&A i feedback.
Link na feedback formu.
Kontakt za pitanja nakon radionice.

### Format prezentacije
Zadatak s koracima. Zadani tekstovi za studente. Finalni slide s kompletnim workflow dijagramom. Slide s resursima i kontaktom.

---

## Poveznica s referentnim istraživanjem

Koristiti odlomak iz referentnog istraživanja (sekcija "Rezultati" iz 04_rezultati.qmd) kao primjer akademskog teksta za demonstraciju. Pokazati kako bi student koristio AI za: poboljšanje interpretacije regresijskih koeficijenata, dodavanje hedginga ("rezultati sugeriraju" umjesto "rezultati pokazuju"), povezivanje empirijskih nalaza s teorijskim okvirom (Phillips krivulja s pažnjom), i kritičku evaluaciju vlastitih zaključaka (je li IAG koeficijent kauzalan ili samo korelacija).

Posebno demonstrirati na primjeru: student piše "Medijsko praćenje HNB-a povećava inflacijska očekivanja" a AI sugerira "Rezultati panel analize upućuju na pozitivnu povezanost između intenziteta medijskog praćenja monetarne politike i inflacijskih očekivanja kućanstava, premda identifikacijska strategija ne isključuje moguće endogene mehanizme."

---

## Tehničke napomene

Pristup: besplatni Claude ili ChatGPT račun dovoljan za sve vježbe u ovom bloku.
Hrvatski: ovaj blok se u potpunosti radi na hrvatskom jer se uređuje hrvatski akademski tekst. AI može raditi pogreške s hrvatskim, demonstrirati i to kao dio učenja.
Timing: vježba 15 min + wrap-up 15 min = 30 min za kraj. Osigurati dovoljno vremena za wrap-up jer je to zadnji utisak.
Materijali za podijeliti: pripremiti PDF/dokument s prompt obrascima za sve studente.
