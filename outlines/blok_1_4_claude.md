# Blok 1.4: Strukturiranje ideja s Claudeom (45 min)

## Kontekst bloka

Ovo je završni praktični blok prvog dana. Studenti su prošli eksplorativno pretraživanje (Perplexity) i dubinsku sintezu (Gemini Deep Research). Sada imaju prikupljene izvore, bilješke, i prvi nacrt pregleda literature. Problem: sav taj materijal je nestrukturiran. Claude je odabran za ovaj blok jer je iznimno dobar u dugom razgovoru, strukturiranju ideja, prompt inženjeringu, i akademskom pisanju. Cilj bloka je naučiti studente koristiti Claudea za transformaciju nestrukturiranih bilješki u organiziran istraživački nacrt.

---

## Sekcija A: Claude kao alat za akademski rad (10 min)

### Sadržajni zahtjevi

**Što izdvaja Claudea**
Dugi kontekstni prozor (200K tokena, što je otprilike 500 stranica teksta). To znači da može pročitati cijeli rad i dati komentare na cjelinu, ne samo na isječke. Snažno rezoniranje i praćenje složenih argumenata. Manje sklon halucinacijama u usporedbi s nekim konkurentima (ali i dalje treba verificirati). Prirodan akademski ton na hrvatskom jeziku. Claude Projects za organizaciju materijala po projektima.

**Besplatni pristup i ograničenja**
claude.ai besplatan račun: pristup Claude 3.5 Sonnet, ograničen broj poruka dnevno (dovoljan za radionicu). Pro račun ($20/mj): Claude 3 Opus, više poruka, Projects, upload datoteka. Za radionicu je dovoljan besplatni pristup.

**Claude vs. ChatGPT za akademski rad**
Direktna usporedba na konkretnom primjeru. Dati isti prompt obojici i pokazati razlike u odgovorima. Claude tipično daje: nijansiraniji odgovor, manje "filler" teksta, bolje razumijevanje složenih akademskih argumenata, bolji hrvatski jezik. ChatGPT tipično daje: širi odgovor, više generalizacija, bolje poznavanje pop-culture referenci (manje relevantno za akademski rad). Naglasiti da se razlike smanjuju i da oba alata brzo napreduju.

**Claude Projects**
Kako kreirati Project za istraživački rad. Upload materijala (PDF radovi, bilješke, podaci). Kontekst koji je uvijek dostupan u razgovoru. Idealno za dugoročne projekte poput diplomskog rada.

### Format prezentacije
Screenshot Claude sučelja. Usporedna tablica Claude vs. ChatGPT za akademske zadatke. Demo Project sučelja.

---

## Sekcija B: Prompt inženjering za akademske zadatke (10 min)

### Sadržajni zahtjevi

Ovo je ključna sekcija cijelog prvog dana. Studenti trebaju naučiti kako pisati prompte koji daju korisne akademske rezultate. Ne generički "prompt engineering 101" nego specifične obrasce za akademski rad.

**Principi dobrog akademskog prompta**

Princip 1: Zadaj ulogu i kontekst.
Loše: "Pomozi mi s radom."
Dobro: "Ti si asistent za pisanje akademskih radova iz makroekonomije. Pomažeš mi strukturirati diplomski rad o utjecaju medijskog praćenja HNB-a na inflacijska očekivanja u Hrvatskoj."

Princip 2: Budi specifičan o formatu i opsegu.
Loše: "Napiši pregled literature."
Dobro: "Na temelju sljedećih 5 izvora, napiši pregled literature od otprilike 1000 riječi. Organiziraj pregled tematski (ne kronološki) u tri potpoglavlja: teorijski okvir, empirijski dokazi, i metodološki pristupi. Za svaki izvor navedi ključni doprinos i ograničenja."

Princip 3: Daj primjer željenog outputa.
"Evo primjera kako želim da izgleda jedan paragraf pregleda literature: [umetni primjer]. Molim te napiši ostatak u istom stilu."

Princip 4: Zahtijevaj kritičko mišljenje, ne samo sažimanje.
"Ne samo sažmi izvore, nego identificiraj: (a) točke slaganja među autorima, (b) ključna neslaganja i kontroverze, (c) istraživačke praznine koje moj rad može popuniti."

Princip 5: Iterativno poboljšavanje.
Demonstriraj ciklus: prvi prompt > evaluacija odgovora > follow-up prompt koji korigira i produbljuje > ponovljena evaluacija. Pokaži da je 3-4 iteracije normalno za kvalitetan output.

**Gotovi prompt obrasci za studente**

Obrazac za strukturiranje rada:
"Imam sljedeće istraživačko pitanje: [pitanje]. Na temelju pregleda literature identificirao/la sam sljedeće ključne teme: [teme]. Predloži strukturu akademskog rada (seminarski rad, 15-20 stranica) s naslovima poglavlja i potpoglavlja. Za svako poglavlje navedi: sadržaj koji treba pokriti, očekivanu duljinu, i 2-3 ključna pitanja na koja poglavlje treba odgovoriti."

Obrazac za formuliranje hipoteza:
"Na temelju sljedećeg teorijskog okvira: [okvir] i sljedećih empirijskih nalaza iz literature: [nalazi], formuliraj 3 testirane hipoteze za moje istraživanje o [tema]. Za svaku hipotezu navedi: (a) jasnu formulaciju, (b) teorijsko obrazloženje, (c) kako bi se empirijski testirala."

Obrazac za kritičku analizu izvora:
"Pročitaj sljedeći sažetak rada: [sažetak]. Kritički evaluiraj: (a) je li istraživačko pitanje jasno formulirano, (b) je li metodologija prikladna za odgovoriti na pitanje, (c) jesu li zaključci potkrijepljeni rezultatima, (d) koja su ključna ograničenja koja autori ne navode."

Obrazac za poboljšanje teksta:
"Evo paragrafa iz mog rada: [paragraf]. Poboljšaj ga tako da: (a) pojačaš akademski ton, (b) dodaš jasne tranzicije između rečenica, (c) uklanjaš nepotrebne riječi, (d) pojačaš argumentativnu strukturu. Objasni svaku promjenu."

### Format prezentacije
Svaki obrazac na zasebnom slajdu s primjerom korištenja. Before/after prikaz: loš prompt > dobar prompt > razlika u odgovoru.

---

## Sekcija C: Demo workflow sa Claudeom (10 min)

### Sadržajni zahtjevi

Demonstracija cjelovitog workflowa transformacije nestrukturiranih bilješki u organiziran nacrt rada.

**Početno stanje**
Pokaži "nestrukturirane bilješke" koje simuliraju ono što student ima nakon Perplexity i Gemini blokova: lista od 8-10 izvora s kratkim opisima, nekoliko ključnih pojmova, nejasno formulirano istraživačko pitanje, fragment iz Deep Research izvješća.

**Korak 1: Upload materijala u Claude**
Kopiraj bilješke u Claude chat ili kreiraj Project. Daj kontekst: "Ovo su moje bilješke za seminarski rad iz makroekonomije. Tema je utjecaj medijskog praćenja monetarne politike na inflacijska očekivanja."

**Korak 2: Zatraži analizu i identifikaciju praznina**
Prompt: "Na temelju ovih bilješki, identificiraj: (1) što već imam dovoljno pokriveno, (2) što trebam dodatno istražiti, (3) koja pitanja su otvorena i zahtijevaju dalje istraživanje."

Pokaži kako Claude identificira praznine (npr. "Nemate empirijske studije za Hrvatsku specifično" ili "Metodološka sekcija je preslaba, trebate odlučiti između panel pristupa i vremenskih serija").

**Korak 3: Strukturiranje nacrta**
Prompt: "Na temelju svega navedenog, predloži detaljan nacrt rada s naslovima poglavlja, potpoglavljima, i za svako potpoglavlje naznači koje izvore koristiti i koji argument graditi."

Pokaži Claude output: organiziran nacrt s logičnim tokom od uvoda kroz teoriju do empirije i zaključka.

**Korak 4: Iterativno poboljšanje**
Zatraži modifikacije: "Uvod je previše opći, dodaj hook koji polazi od konkretnog primjera medijskog izvještavanja o inflaciji u Hrvatskoj 2022." Pokaži kako Claude adaptira nacrt na temelju feedbacka.

**Korak 5: Generiranje prvog nacrta jedne sekcije**
Odaberi jednu sekciju (npr. teorijski okvir) i zatraži od Claudea da napiše prvi nacrt. Pokaži output, evaluiraj kvalitetu, i demonstriraj kako dalje poboljšavati.

### Format prezentacije
Live demo ili simulacija. Screenshot sekvenca: bilješke > prompt > Claude nacrt > iteracija > poboljšan nacrt.

---

## Sekcija D: Praktična vježba (15 min)

### Sadržajni zahtjevi

**Zadatak za studente**
Studenti koriste materijale prikupljene u blokovima 1.2 (Perplexity) i 1.3 (Gemini) za strukturiranje vlastitog istraživačkog nacrta s Claudeom.

Koraci vježbe:
1. Kompajlirati sve bilješke iz prethodnih vježbi u jedan tekst (2 min)
2. Uploadati ili kopirati bilješke u Claude chat (1 min)
3. Koristiti prompt za analizu praznina iz Sekcije B (3 min)
4. Koristiti prompt za strukturiranje rada iz Sekcije B (4 min)
5. Napisati jedan follow-up prompt koji poboljšava najslabiji dio nacrta (3 min)
6. Zapisati finalni nacrt i listu preostalih zadataka (2 min)

**Očekivani ishod**
Svaki student treba imati: (1) strukturiran nacrt rada s naslovima poglavlja, (2) identificirane praznine za daljnje istraživanje, (3) iskustvo s iterativnim prompt poboljšavanjem. Ovo je deliverable prvog dana.

**Debriefing i Q&A (5 min, uklapa se u Day 1 Wrap-up)**
Rekapitulacija cijelog dana: od nejasne ideje (Blok 1.1) > eksploracija s Perplexity (1.2) > dubinska sinteza s Gemini (1.3) > strukturirani nacrt s Claudeom (1.4). Pokaži kako se ovi blokovi nadovezuju u cjelovit workflow. Zadatak za drugi dan: donijeti istraživačko pitanje, 3 verificirana izvora, i nacrt rada.

### Format prezentacije
Zadatak s jasnim koracima. Primjeri prompt obrazaca na slajdu kao referenca. Vizualni sažetak cjelodnevnog workflowa (flowchart od Bloka 1.1 do 1.4).

---

## Poveznica s referentnim istraživanjem

Demonstriraj kako bi Claude mogao strukturirati nacrt za referentno istraživanje (HNB medijska analiza). Na primjer, dati Claudeu sažetak istraživanja i zamoliti ga za nacrt rada. Pokaži kako Claude organizira: uvod s motivacijom (rast inflacije 2021-2023, medijska pažnja), teorijski okvir (NK Phillips s pažnjom, Sims 2003), pregled literature (central bank communication, media gatekeeping, rational inattention), podatke i metode (31,536 članaka, DuckDB, OLS s Newey-West), rezultate (IAG pozitivno utječe na inflacijska očekivanja), robustnost (specification curve, HANFA falsifikacija). Pokaži kako ovaj nacrt odgovara stvarnoj strukturi rada i diskutiraj kvalitetu Claude prijedloga.

---

## Tehničke napomene

Pristup: besplatni Claude račun dovoljan, ali ograničen broj poruka. Preporučiti studentima da unaprijed pripreme bilješke i ne troše poruke na trivijalne upite.
Hrvatski jezik: Claude dobro piše na hrvatskom, ali za kompleksne akademske prompte engleski može dati bolje rezultate. Demonstrirati oba pristupa.
Timing: osigurati najmanje 15 min za praktičnu vježbu, to je ključni deliverable prvog dana.
Backup: imati pripremljene Claude odgovore u slučaju tehničkih problema ili ograničenja besplatnog pristupa.
