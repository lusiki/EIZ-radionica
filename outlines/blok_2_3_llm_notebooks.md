# Blok 2.3: LLM Notebooks (45 min)

## Kontekst bloka

Studenti su u prethodna dva bloka upoznali agentsko kodiranje (Claude Code) i IDE integraciju (Copilot + Positron). Sada upoznaju treći paradigm: LLM Notebooks, okruženja gdje se razgovor s AI i izvršavanje koda odvijaju u istom dokumentu. Ovo je najintuitivniji pristup za studente bez programerskog iskustva jer kombinira chat sučelje s mogućnošću izvršavanja koda. Primjeri: Claude Artifacts, ChatGPT Code Interpreter, Google Colab AI, Jupyter AI. Cilj bloka je pokazati kako koristiti konverzacijski pristup za eksploratornu analizu podataka.

---

## Sekcija A: Što su LLM Notebooks i zašto su korisni (10 min)

### Sadržajni zahtjevi

**Koncept LLM Notebooka**
Klasični notebook (Jupyter, Quarto): ćelije s kodom i tekstom, izvršavate ručno, rezultati ispod ćelije. LLM Notebook: isto ali s AI asistentom koji generira kod, objašnjava rezultate, predlaže sljedeće korake. Razgovor i analiza se prepliću u jednom dokumentu.

**Pregled dostupnih LLM Notebook platformi**

ChatGPT Code Interpreter (Advanced Data Analysis):
Upload CSV datoteku, opišite analizu na prirodnom jeziku, ChatGPT piše i izvršava Python kod u sandboxu, prikazuje grafove i tablice. Besplatno (s ograničenjima) na ChatGPT Plus. Prednost: izuzetno jednostavno za korištenje. Ograničenje: samo Python, ograničena veličina datasetova, ne možete instalirati proizvoljne pakete.

Claude Artifacts:
Claude generira interaktivne vizualizacije, aplikacije, ili dokumente direktno u chatu. Može generirati React komponente s grafovima. Manje fokusirano na analizu podataka nego Code Interpreter.

Google Colab AI:
Jupyter notebook u oblaku s Gemini AI integracijom. Besplatan, podržava Python i R. AI može generirati kod, objasniti kod, ili debugirati greške. Najbliži tradicionalnom data science workflowu.

Positron + Quarto + Copilot Chat:
Ono što su studenti koristili u prethodnom bloku je zapravo vrsta LLM notebooka: Quarto dokument u Positronu s Copilot Chat pomoći.

**Kada koristiti LLM Notebooks**
Eksploratorna analiza podataka (EDA): kada ne znate unaprijed što tražite, nego iterativno istražujete. Brza prototipizacija: testiranje ideja prije pisanja finalnog koda. Učenje: kada želite razumjeti statistički koncept kroz primjer. Prezentacija: generiranje vizualizacija za seminarski rad.

### Format prezentacije
Screenshot svake platforme. Tablica usporedbe: platforma, jezik, pristup, prednosti, ograničenja. Dijagram pozicioniranja LLM Notebookova u odnosu na Claude Code i Copilot.

---

## Sekcija B: Demo workflow s ChatGPT Code Interpreter (15 min)

### Sadržajni zahtjevi

Demonstracija eksploratorne analize podataka korištenjem ChatGPT Code Interpreter (ili Google Colab AI kao alternativa). Odabran je Code Interpreter jer je najjednostavniji za studente bez tehničkog iskustva.

**Korak 1: Upload podataka**
Upload CSV datoteke s makroekonomskim podacima (isti dataset kao u prethodnom bloku). Prompt: "Ovdje su podaci o makroekonomskim indikatorima za EU zemlje od 2010 do 2023. Pregledaj podatke i daj mi osnovni pregled: koliko zemalja, koliko godina, koje varijable, missing values."

Pokaži kako Code Interpreter automatski čita CSV, generira Python kod (pandas), i prikazuje rezultat u čitljivom formatu. Studenti ne trebaju znati pandas; AI to radi za njih.

**Korak 2: Eksploratorna vizualizacija**
Prompt: "Napravi vizualni pregled svih varijabli. Za numeričke varijable pokaži distribucije, za kategorijske (zemlja) pokaži frekvencije. Koristi subplot grid."

Demonstriraj kako Code Interpreter generira matplotlib/seaborn grid s histogramima i bar chartovima. Rezultat je odmah vidljiv u chatu bez potrebe za lokalnom instalacijom.

**Korak 3: Istraživačko pitanje vođeno podacima**
Prompt: "Na temelju ovih podataka, koji su najzanimljiviji uzorci ili korelacije? Identificiraj 3 potencijalno istraživačka pitanja koja proizlaze iz podataka."

Pokaži kako AI ne samo analizira podatke nego i predlaže istraživačke smjerove. Na primjer: "Primjećujem jaku negativnu korelaciju između GDP rasta i nezaposlenosti (Okunov zakon), ali s značajnom heterogenošću među zemljama. Ovo sugerira istraživačko pitanje o strukturalnim faktorima koji moderiraju Okunov odnos u EU."

Diskutiraj kvalitetu prijedloga: AI može identificirati uzorke u podacima ali ne razumije ekonomski kontekst jednako dobro kao ekonomist. Student mora evaluirati jesu li prijedlozi teorijski smisleni.

**Korak 4: Ciljana analiza**
Prompt: "Fokusiraj se na vezu između media_attention_index i inflation_expectations. Prikaži scatter plot, izračunaj korelaciju po zemljama, i napravi jednostavnu panel regresiju s fixed effects za zemlju."

Pokaži kako Code Interpreter gradi kompleksniju analizu. Pokaži i ograničenja: na primjer, Code Interpreter koristi linearmodels ili statsmodels za panel regresiju, ne R pakete poput plm. Rezultat je korektan ali format može biti drugačiji nego što studenti očekuju iz R okruženja.

**Korak 5: Export rezultata**
Prompt: "Spremi sve grafove u PDF i rezultate regresije u tablicu koja se može kopirati u Word."
Demonstriraj kako Code Interpreter generira downloadable datoteke.

### Format prezentacije
Live demo u ChatGPT ili pripremljeni screenshots. Svaki korak: prompt > generirani kod (kratko pokazati) > vizualni output. Naglasiti konverzacijski tok: analiza se gradi kroz razgovor.

---

## Sekcija C: Usporedba pristupa kodiranju (5 min)

### Sadržajni zahtjevi

Sinteza sva tri pristupa AI kodiranju koje su studenti vidjeli u Dan 2.

**Matrica usporedbe**

Claude Code (agentsko):
Najbolje za: kompleksne projekte s mnogo datoteka, automatizaciju, reproduciblni pipeline.
Ograničenje: zahtijeva API pristup, terminalno okruženje.
Razina kontrole: visoka (AI radi autonomno ali vi definirate zadatke).
Krivulja učenja: srednja.

Copilot + Positron (IDE integrirano):
Najbolje za: svakodnevno pisanje koda, iterativno poboljšavanje, rad u poznatom IDE okruženju.
Ograničenje: trebate razumjeti osnove R/Python da biste evaluirali prijedloge.
Razina kontrole: visoka (vi pišete, AI predlaže).
Krivulja učenja: niska za korisnike IDE-a.

LLM Notebooks (konverzacijsko):
Najbolje za: eksploratornu analizu, brzu prototipizaciju, učenje novih tehnika, prezentacije.
Ograničenje: manje kontrole nad kodom, ovisnost o cloud platformi, teže za reproduktibilnost.
Razina kontrole: niska (AI piše i izvršava, vi usmjeravate).
Krivulja učenja: najniža.

**Preporuka za studente**
Počnite s LLM Notebooks za eksploraciju. Prebacite se na Copilot + Positron za pisanje finalnog koda. Koristite Claude Code za kompleksne projekte ili kada trebate automatizirati pipeline. Ovi alati nisu zamjena jedan za drugog nego se nadopunjuju u različitim fazama rada.

### Format prezentacije
Matrica 3x5 tablica. Dijagram pozicioniranja (x-os: razina kontrole, y-os: složenost projekta) s tri alata u različitim kvadrantima.

---

## Sekcija D: Praktična vježba (15 min)

### Sadržajni zahtjevi

Hands-on eksploratorna analiza u LLM Notebook okruženju.

**Priprema**
Studenti koriste ChatGPT (besplatni pristup s Code Interpreter) ili Google Colab AI. Dataset: isti makroekonomski CSV iz prethodnog bloka.

**Zadatak: Eksploratorna analiza u 5 pitanja**
Studenti trebaju voditi konverzaciju s AI kroz 5 pitanja koja postupno produbljuju analizu. Cilj je doći do jednog zanimljivog nalaza koji mogu prezentirati.

Pitanje 1: "Pregledaj dataset i pokaži mi osnovnu statistiku." (2 min)
Pitanje 2: "Koji su najzanimljiviji uzorci u podacima? Vizualiziraj ih." (3 min)
Pitanje 3: Studenti formuliraju vlastito pitanje na temelju nalaza iz koraka 2. (3 min)
Pitanje 4: "Testiraj [specifičnu hipotezu] statistički. Objasni rezultat." (3 min)
Pitanje 5: "Napravi jedan finalni graf koji sažima najvažniji nalaz." (2 min)

**Debriefing i mini-prezentacije (2 min)**
2-3 studenta ukratko pokazuju svoj najzanimljiviji nalaz. Diskusija: Kako je AI vodio analizu? Jeste li otkrili nešto neočekivano? Jeste li verificirali rezultat?

### Format prezentacije
Zadatak na slajdu s 5 pitanja. Primjer vođene konverzacije. Template za mini-prezentaciju nalaza.

---

## Poveznica s referentnim istraživanjem

Demonstriraj kako bi eksploratorna faza referentnog istraživanja mogla izgledati u LLM Notebook okruženju. Upload dataseta s IAG indeksom i inflacijskim očekivanjima. Pokaži konverzaciju: "Istražuj vezu između media attention i inflation expectations. Što primjećuješ?" AI identificira pozitivnu korelaciju, sezonske uzorke, i outliere. Student zatim usmjerava: "Kontroliraj za GDP i unemployment. Je li efekt robustan?" Ovo demonstrira kako eksploratorna analiza može voditi prema formalnoj ekonometrijskoj specifikaciji.

---

## Tehničke napomene

Pristup: ChatGPT besplatni račun s Code Interpreter (ograničen broj korištenja dnevno). Google Colab AI kao alternativa (besplatan, neograničen). Osigurati da studenti imaju račun na barem jednoj platformi.
Python vs. R: Code Interpreter koristi Python. Naglasiti da su koncepti isti (regresija je regresija), samo se sintaksa razlikuje. Za studente koji preferiraju R, Google Colab AI podržava R kernele.
Internet: obavezan za cloud platforme. Nema offline alternative.
Timing: 15 min za vježbu je minimum. Biti spreman produžiti ako studenti zaostaju.
