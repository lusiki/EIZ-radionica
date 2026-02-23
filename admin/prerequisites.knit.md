---
title: "Vodič za instalaciju i postavljanje alata"
subtitle: "Upotreba AI alata u studentskom istraživanju: pregled literature, kodiranje, analiza, pisanje"
author: "Luka Šikić, UNICATH"
date: "Ožujak 2025"
lang: hr
format:
  html:
    theme: 
      light: flatly
      dark: darkly
    toc: true
    toc-depth: 3
    toc-title: "Sadržaj"
    toc-location: left
    number-sections: true
    code-fold: true
    code-tools: true
    highlight-style: github
    fig-align: center
    smooth-scroll: true
    link-external-newwindow: true
execute:
  echo: true
  warning: false
  message: false
---


::: {.cell}
<style type="text/css">
.tool-card {
  border-left: 4px solid #3498db;
  padding: 1rem;
  margin: 1rem 0;
  background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
  border-radius: 0 8px 8px 0;
}

.free-badge {
  background-color: #27ae60;
  color: white;
  padding: 0.2rem 0.6rem;
  border-radius: 4px;
  font-size: 0.85rem;
  font-weight: bold;
}

.paid-badge {
  background-color: #e74c3c;
  color: white;
  padding: 0.2rem 0.6rem;
  border-radius: 4px;
  font-size: 0.85rem;
  font-weight: bold;
}

.student-badge {
  background-color: #9b59b6;
  color: white;
  padding: 0.2rem 0.6rem;
  border-radius: 4px;
  font-size: 0.85rem;
  font-weight: bold;
}
</style>
:::


## Pregled potrebnih alata {.unnumbered}

Ovaj vodič pokriva instalaciju i konfiguraciju svih alata potrebnih za uspješno praćenje radionice. Alati su podijeljeni u tri kategorije prema složenosti postavljanja.

::: {.callout-tip}
## Prije radionice
Molimo vas da sve alate instalirate **prije dolaska na radionicu**. Ako naiđete na probleme, zabilježite ih i javite se na vrijeme kako bismo ih zajedno riješili.
:::

| Kategorija | Alati | Vrijeme instalacije |
|------------|-------|---------------------|
| Web platforme | Perplexity, Gemini, Claude | 15 minuta |
| Razvojno okruženje | R, Positron, Quarto | 30 minuta |
| Integracije | GitHub, Copilot, Git | 20 minuta |
| Napredni alati | Claude Code, Zotero | 15 minuta |

: Pregled alata i procijenjeno vrijeme instalacije {.striped .hover}

---

# Web platforme za AI istraživanje

Ovi alati ne zahtijevaju instalaciju na računalo. Potrebno je samo kreirati korisničke račune i upoznati se s osnovnim sučeljem.

## Perplexity

::: {.tool-card}
**Namjena:** AI pretraživanje s automatskim citiranjem izvora

**Web stranica:** [perplexity.ai](https://perplexity.ai)
:::

### Zašto Perplexity?

Perplexity kombinira moć velikih jezičnih modela s pretraživanjem weba u realnom vremenu. Za razliku od tradicionalnih pretraživača, Perplexity sintetizira informacije iz više izvora i automatski navodi reference.

**Funkcije za istraživače:**

- Svaki odgovor uključuje linkove na izvorne materijale
- Fokus na akademske i pouzdane izvore
- Mogućnost postavljanja složenih istraživačkih pitanja prirodnim jezikom
- Vizualizacija povezanosti između izvora

### Usporedba verzija

| Značajka | Besplatna verzija | Pro verzija (20 USD mjesečno) |
|----------|-------------------|-------------------------------|
| Broj upita dnevno | Neograničeno (osnovni) | Neograničeno (svi modeli) |
| Pro Search | 5 dnevno | 600+ mjesečno |
| Izbor modela | Zadani model | GPT-4, Claude, Sonar |
| Upload datoteka | Ne | Da |
| API pristup | Ne | Da |

: Usporedba Perplexity verzija {.striped}

::: {.callout-note}
## Za radionicu
Besplatna verzija je **potpuno dovoljna** za sve vježbe na radionici. Pro verzija donosi prednosti za intenzivnije korištenje u budućnosti.
:::

### Postavljanje računa

1. Otvorite [perplexity.ai](https://perplexity.ai)
2. Kliknite **Sign Up** u gornjem desnom kutu
3. Odaberite način prijave (Google, Apple, ili email)
4. Potvrdite email adresu ako ste se registrirali putem emaila
5. Dovršite kratki uvodni vodič

::: {.callout-tip}
## Savjet
Preporučujemo prijavu putem Google računa jer omogućuje bržu autentifikaciju i integraciju s drugim alatima.
:::

---

## Google Gemini

::: {.tool-card}
**Namjena:** Generiranje dubinskih istraživačkih izvještaja

**Web stranica:** [gemini.google.com](https://gemini.google.com)
:::

### Zašto Gemini?

Gemini je Googleov najnapredniji AI model s iznimnom sposobnošću razumijevanja i generiranja dugačkih tekstova. Značajka **Deep Research** automatski istražuje temu kroz više iteracija i proizvodi sveobuhvatne izvještaje.

**Funkcije za istraživače:**

- Deep Research značajka automatski istražuje temu u više koraka
- Izvrsna integracija s Google ekosustavom (Docs, Drive, Scholar)
- Sposobnost analize uploadanih dokumenata
- Multimodalni unos (tekst, slike, dokumenti)

### Usporedba verzija

| Značajka | Besplatna verzija | Advanced (18.99 EUR mjesečno) |
|----------|-------------------|-------------------------------|
| Gemini model | Gemini 1.5 Flash | Gemini 1.5 Pro |
| Deep Research | Ograničeno | Potpuno |
| Kontekstni prozor | 32K tokena | 1M tokena |
| Google integracija | Osnovna | Napredna |
| Prioritetni pristup | Ne | Da |

: Usporedba Gemini verzija {.striped}

::: {.callout-important}
## Deep Research značajka
Deep Research je najvažnija Gemini značajka za ovu radionicu. U besplatnoj verziji imate ograničen broj dubinskih pretraga mjesečno, ali dovoljno za vježbe.
:::

### Postavljanje računa

1. Potreban vam je **Google račun** (Gmail)
2. Otvorite [gemini.google.com](https://gemini.google.com)
3. Prijavite se s Google računom
4. Prihvatite uvjete korištenja
5. Istražite sučelje i pronađite opciju **Deep Research** u izborniku

---

## Claude

::: {.tool-card}
**Namjena:** Razmišljanje, strukturiranje ideja, pisanje i kodiranje

**Web stranica:** [claude.ai](https://claude.ai)
:::

### Zašto Claude?

Claude (razvijen od strane Anthropica) izuzetno je sposoban u zadacima koji zahtijevaju nijansirano razmišljanje, strukturiranje kompleksnih ideja i generiranje kvalitetnog koda. Posebno je koristan za akademsko pisanje zbog pažnje prema detaljima i sposobnosti rada s dugačkim tekstovima.

**Funkcije za istraživače:**

- Iznimna sposobnost slijeđenja kompleksnih uputa
- Velik kontekstni prozor (može obraditi cijele radove)
- Kvalitetno generiranje i objašnjavanje koda
- Pažljiv pristup činjenicama i izvorima
- Sposobnost rada na strukturiranju istraživačkih pitanja

### Usporedba verzija

| Značajka | Besplatna verzija | Pro verzija (20 USD mjesečno) |
|----------|-------------------|-------------------------------|
| Model | Claude 3.5 Sonnet | Claude 3.5 Sonnet + Opus |
| Broj poruka | ~30 poruka / 5 sati | 5x više poruka |
| Prioritet | Standardni | Visoki |
| Pristup novim značajkama | Kasniji | Rani |
| Projects značajka | Osnovna | Napredna |
| Veličina uploada | 10 datoteka | 50 datoteka |

: Usporedba Claude verzija {.striped}

::: {.callout-note}
## Za radionicu
Besplatna verzija omogućuje sve vježbe predviđene radionicom. Ograničenje od ~30 poruka svakih 5 sati rijetko predstavlja problem u normalnom korištenju.
:::

### Postavljanje računa

1. Otvorite [claude.ai](https://claude.ai)
2. Kliknite **Sign Up**
3. Unesite email adresu
4. Potvrdite email putem linka koji ćete primiti
5. Unesite broj telefona za verifikaciju (obavezno)
6. Dovršite registraciju

::: {.callout-warning}
## Verifikacija telefonom
Claude zahtijeva verifikaciju telefonskim brojem. Ovo je sigurnosna mjera koju nije moguće zaobići.
:::

---

# Razvojno okruženje

Ovi alati zahtijevaju instalaciju na vaše računalo. Pratite upute za svoj operativni sustav.

## R

::: {.tool-card}
**Namjena:** Statistička analiza i programiranje

**Web stranica:** [r-project.org](https://www.r-project.org/)

[Besplatno]{.free-badge} [Open Source]{.free-badge}
:::

### Zašto R?

R je vodeći programski jezik za statističku analizu u ekonomiji i društvenim znanostima. Besplatan je, ima ogromnu zajednicu korisnika i tisuće paketa specijaliziranih za ekonometrijsku analizu.

**Ključne prednosti:**

- Industrijski standard u akademskoj ekonomiji
- Bogat ekosustav paketa (tidyverse, fixest, modelsummary)
- Izvrsna podrška za vizualizaciju podataka
- Reproducibilna istraživanja kroz Quarto/RMarkdown
- Aktivna zajednica i obilje resursa za učenje

### Instalacija

::: {.panel-tabset}

#### Windows

1. Posjetite [cloud.r-project.org](https://cloud.r-project.org/)
2. Kliknite **Download R for Windows**
3. Kliknite **base**
4. Preuzmite najnoviju verziju (R-4.x.x-win.exe)
5. Pokrenite instalacijsku datoteku
6. Pratite čarobnjak za instalaciju (zadane postavke su odgovarajuće)

#### macOS

1. Posjetite [cloud.r-project.org](https://cloud.r-project.org/)
2. Kliknite **Download R for macOS**
3. Odaberite verziju prema vašem procesoru:
   - **Apple Silicon (M1/M2/M3):** R-4.x.x-arm64.pkg
   - **Intel:** R-4.x.x-x86_64.pkg
4. Otvorite preuzetu .pkg datoteku
5. Pratite upute za instalaciju

#### Linux (Ubuntu/Debian)


::: {.cell}

```{.bash .cell-code}
# Dodajte CRAN repozitorij
sudo apt update
sudo apt install software-properties-common dirmngr
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# Za Ubuntu 22.04
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/"

# Instalirajte R
sudo apt update
sudo apt install r-base r-base-dev
```
:::


:::

### Provjera instalacije

Nakon instalacije, otvorite terminal (Command Prompt na Windowsima) i upišite:


::: {.cell}

```{.bash .cell-code}
R --version
```
:::


Trebali biste vidjeti informacije o verziji R-a.

---

## Positron

::: {.tool-card}
**Namjena:** Moderno integrirano razvojno okruženje za R i Python

**Web stranica:** [positron.posit.co](https://positron.posit.co/)

[Besplatno]{.free-badge} [Open Source]{.free-badge} [Beta]{.student-badge}
:::

### Zašto Positron?

Positron je nova generacija IDE-a od tvoraca RStudia. Kombinira najbolje značajke RStudia s modernom VS Code arhitekturom, omogućujući bolju integraciju s AI alatima poput GitHub Copilota.

**Ključne prednosti:**

- Moderna arhitektura temeljena na VS Code
- Izvrsna integracija s GitHub Copilotom
- Podrška za R i Python u istom okruženju
- Ugrađeni preglednik za podatke i vizualizacije
- Brža i responzivnija od RStudia

::: {.callout-note}
## Zašto ne RStudio?
RStudio je odličan alat koji možete nastaviti koristiti. Positron odabiremo za radionicu jer ima bolju integraciju s GitHub Copilotom, što je ključno za vježbe AI potpomognutog kodiranja.
:::

### Instalacija

::: {.panel-tabset}

#### Windows

1. Posjetite [positron.posit.co](https://positron.posit.co/)
2. Kliknite **Download Positron**
3. Odaberite Windows verziju (.exe)
4. Pokrenite instalacijsku datoteku
5. Pratite čarobnjak za instalaciju

#### macOS

1. Posjetite [positron.posit.co](https://positron.posit.co/)
2. Kliknite **Download Positron**
3. Odaberite macOS verziju (.dmg)
4. Otvorite .dmg datoteku
5. Povucite Positron u Applications mapu

#### Linux

1. Posjetite [positron.posit.co](https://positron.posit.co/)
2. Preuzmite .deb (Debian/Ubuntu) ili .rpm (Fedora) paket
3. Instalirajte paket:


::: {.cell}

```{.bash .cell-code}
# Za Debian/Ubuntu
sudo dpkg -i positron_*.deb
sudo apt install -f

# Za Fedora
sudo rpm -i positron_*.rpm
```
:::


:::

### Početna konfiguracija

1. Pokrenite Positron
2. Pri prvom pokretanju, Positron će detektirati vašu R instalaciju
3. Ako R nije automatski pronađen, idite na **Settings > R > R Path** i unesite putanju

---

## Quarto

::: {.tool-card}
**Namjena:** Kreiranje reproducibilnih dokumenata, prezentacija i web stranica

**Web stranica:** [quarto.org](https://quarto.org/)

[Besplatno]{.free-badge} [Open Source]{.free-badge}
:::

### Zašto Quarto?

Quarto je sustav otvorenog koda za kreiranje znanstvenih i tehničkih dokumenata. Omogućuje kombiniranje teksta, koda i rezultata u jednom dokumentu koji se može izvesti u različite formate (HTML, PDF, Word, prezentacije).

**Ključne prednosti:**

- Jedan izvorni dokument, više izlaznih formata
- Izvršavanje R, Python, Julia i Observable koda
- Podrška za akademske publikacije (citati, reference)
- Moderne HTML prezentacije (reveal.js)
- Jednostavno kreiranje web stranica i blogova

### Instalacija

::: {.panel-tabset}

#### Windows

1. Posjetite [quarto.org/docs/get-started](https://quarto.org/docs/get-started/)
2. Kliknite **Download Quarto CLI**
3. Odaberite Windows verziju
4. Pokrenite instalacijsku datoteku (.msi)
5. Pratite čarobnjak za instalaciju

#### macOS

1. Posjetite [quarto.org/docs/get-started](https://quarto.org/docs/get-started/)
2. Kliknite **Download Quarto CLI**
3. Odaberite macOS verziju
4. Otvorite .pkg datoteku i pratite upute

Alternativno, ako koristite Homebrew:


::: {.cell}

```{.bash .cell-code}
brew install quarto
```
:::


#### Linux


::: {.cell}

```{.bash .cell-code}
# Preuzmite najnoviju verziju
wget https://github.com/quarto-dev/quarto-cli/releases/latest/download/quarto-linux-amd64.deb

# Instalirajte
sudo dpkg -i quarto-linux-amd64.deb
```
:::


:::

### Provjera instalacije


::: {.cell}

```{.bash .cell-code}
quarto --version
```
:::


---

# GitHub i integracije

Ova sekcija pokriva postavljanje GitHub računa i AI asistenta za kodiranje.

## GitHub račun

::: {.tool-card}
**Namjena:** Verzioniranje koda, suradnja i pristup studentskim pogodnostima

**Web stranica:** [github.com](https://github.com/)

[Besplatno]{.free-badge} [Studentske pogodnosti]{.student-badge}
:::

### Zašto GitHub?

GitHub je platforma za verzioniranje i dijeljenje koda. Kao studenti imate pristup **GitHub Education** paketu koji uključuje besplatan GitHub Copilot i druge profesionalne alate.

**Ključne prednosti:**

- Besplatan GitHub Copilot za studente
- Verzioniranje istraživačkog koda
- Suradnja s kolegama na projektima
- Portfolio za buduće poslodavce
- Integracija s Positronom i drugim alatima

### Kreiranje računa

1. Posjetite [github.com](https://github.com/)
2. Kliknite **Sign up**
3. Unesite email, kreirajte lozinku i korisničko ime
4. Potvrdite email adresu
5. Dovršite personalizaciju računa (možete preskočiti)

### Prijava za studentske pogodnosti

::: {.callout-important}
## Obavezno za besplatni Copilot
Bez studentske verifikacije GitHub Copilot košta 10 USD mjesečno. S verifikacijom je **potpuno besplatan** dok ste student.
:::

1. Posjetite [education.github.com/benefits](https://education.github.com/benefits)
2. Kliknite **Get Student Benefits**
3. Prijavite se s GitHub računom
4. Odaberite **Student**
5. Unesite informacije o obrazovnoj instituciji
6. Uploadajte dokaz studentskog statusa:
   - Studentska iskaznica s datumom valjanosti
   - Potvrda o upisu
   - Screenshot studomata
7. Pričekajte odobrenje (obično 1-7 dana)

---

## GitHub Copilot

::: {.tool-card}
**Namjena:** AI asistent za pisanje koda unutar IDE-a

**Web stranica:** [github.com/features/copilot](https://github.com/features/copilot)

[Besplatno za studente]{.student-badge} [10 USD mjesečno inače]{.paid-badge}
:::

### Zašto GitHub Copilot?

Copilot je AI asistent koji predlaže kod dok pišete. Integriran direktno u Positron, omogućuje vam da opišete što želite postići i dobijete funkcionalni kod.

**Ključne prednosti:**

- Autocomplete za cijele funkcije i blokove koda
- Objašnjenje postojećeg koda
- Prijedlozi temeljeni na kontekstu vašeg projekta
- Podrška za R, Python i mnoge druge jezike
- Chat sučelje za kompleksnija pitanja

### Usporedba verzija

| Značajka | Free (studenti) | Individual (10 USD) | Business (19 USD) |
|----------|-----------------|---------------------|-------------------|
| Code completion | Da | Da | Da |
| Chat u IDE-u | Da | Da | Da |
| CLI asistent | Da | Da | Da |
| Privatnost koda | Ne | Ne | Da |
| Organizacijske politike | Ne | Ne | Da |

: Usporedba Copilot verzija {.striped}

### Aktivacija i instalacija

**Korak 1: Aktivacija Copilota na GitHubu**

1. Provjerite da imate odobrene studentske pogodnosti
2. Posjetite [github.com/settings/copilot](https://github.com/settings/copilot)
3. Kliknite **Enable GitHub Copilot**
4. Prihvatite uvjete korištenja

**Korak 2: Instalacija u Positronu**

1. Otvorite Positron
2. Kliknite na **Extensions** ikonu (četiri kvadrata) u lijevoj traci
3. Pretražite **GitHub Copilot**
4. Instalirajte ekstenziju **GitHub Copilot** (službenu od GitHuba)
5. Instalirajte i **GitHub Copilot Chat** ekstenziju
6. Ponovno pokrenite Positron

**Korak 3: Prijava**

1. Nakon restarta, pojavit će se obavijest za prijavu
2. Kliknite **Sign in to GitHub**
3. Autorizirajte pristup u pregledniku
4. Vratite se u Positron

### Provjera rada

Otvorite novu R datoteku i počnite pisati:


::: {.cell}

```{.r .cell-code}
# Funkcija za izračun srednje vrijednosti
```
:::


Copilot bi trebao automatski predložiti nastavak koda u sivoj boji. Pritisnite **Tab** za prihvaćanje prijedloga.

---

## Git

::: {.tool-card}
**Namjena:** Verzioniranje koda na lokalnom računalu

**Web stranica:** [git-scm.com](https://git-scm.com/)

[Besplatno]{.free-badge} [Open Source]{.free-badge}
:::

### Zašto Git?

Git prati sve promjene u vašem kodu i omogućuje vam da se vratite na bilo koju prethodnu verziju. Esencijalan je alat za reproducibilno istraživanje.

**Ključne prednosti:**

- Povijest svih promjena u projektu
- Mogućnost eksperimentiranja bez straha od gubitka
- Sinkronizacija s GitHubom
- Standard u industriji i akademiji

### Instalacija

::: {.panel-tabset}

#### Windows

1. Posjetite [git-scm.com](https://git-scm.com/)
2. Kliknite **Download for Windows**
3. Pokrenite instalacijsku datoteku
4. Pratite čarobnjak (zadane postavke su odgovarajuće)
5. Važno: Na koraku **Adjusting your PATH** odaberite **Git from the command line and also from 3rd-party software**

#### macOS

Git je vjerojatno već instaliran. Provjerite:


::: {.cell}

```{.bash .cell-code}
git --version
```
:::


Ako nije instaliran, instalirajte putem Homebrew:


::: {.cell}

```{.bash .cell-code}
brew install git
```
:::


#### Linux


::: {.cell}

```{.bash .cell-code}
# Debian/Ubuntu
sudo apt install git

# Fedora
sudo dnf install git
```
:::


:::

### Početna konfiguracija

Nakon instalacije, konfigurirajte svoje ime i email:


::: {.cell}

```{.bash .cell-code}
git config --global user.name "Vaše Ime"
git config --global user.email "vas.email@example.com"
```
:::


Koristite istu email adresu kao na GitHubu.

---

# Napredni alati

Ovi alati nisu obavezni za radionicu, ali proširuju mogućnosti vašeg istraživačkog workflowa.

## Claude Code

::: {.tool-card}
**Namjena:** Agentsko kodiranje putem terminala

**Dokumentacija:** [docs.anthropic.com](https://docs.anthropic.com/)

[Plaćanje po korištenju]{.paid-badge}
:::

### Zašto Claude Code?

Claude Code je alat za napredne korisnike koji omogućuje Claudeu da samostalno izvršava zadatke kodiranja u vašem terminalu. Može čitati datoteke, pisati kod, pokretati skripte i iterativno rješavati probleme.

**Ključne prednosti:**

- Autonomno rješavanje kompleksnih programerskih zadataka
- Pristup vašem file sustavu i terminalu
- Mogućnost iterativnog poboljšavanja koda
- Idealan za veće refaktoring projekte

::: {.callout-warning}
## Troškovi
Claude Code zahtijeva Anthropic API ključ i naplaćuje se po korištenju. Cijena ovisi o količini teksta (tokena) koju model obradi. Tipična sesija može koštati 0.50 do 5 USD.
:::

### Instalacija


::: {.cell}

```{.bash .cell-code}
# Zahtijeva Node.js 18+
npm install -g @anthropic-ai/claude-code
```
:::


### Konfiguracija

1. Kreirajte račun na [console.anthropic.com](https://console.anthropic.com/)
2. Generirajte API ključ
3. Postavite environment varijablu:


::: {.cell}

```{.bash .cell-code}
# Linux/macOS (dodajte u .bashrc ili .zshrc)
export ANTHROPIC_API_KEY="sk-ant-..."

# Windows (PowerShell)
$env:ANTHROPIC_API_KEY="sk-ant-..."
```
:::


::: {.callout-note}
## Za radionicu
Claude Code će demonstrirati voditelj radionice. Od sudionika se ne očekuje da ga koriste samostalno, ali zainteresirani mogu isprobati.
:::

---

## Zotero

::: {.tool-card}
**Namjena:** Upravljanje referencama i bibliografijom

**Web stranica:** [zotero.org](https://www.zotero.org/)

[Besplatno]{.free-badge} [Open Source]{.free-badge}
:::

### Zašto Zotero?

Zotero je besplatni alat za prikupljanje, organiziranje i citiranje istraživačkih izvora. Integrira se s Word dokumentima, Google Docsom i Quarto dokumentima.

**Ključne prednosti:**

- Automatsko prikupljanje bibliografskih podataka s weba
- Sinkronizacija između uređaja
- Generiranje citata u stotinama stilova (APA, Chicago, Harvard...)
- Integracija s Word i Quarto
- Dijeljenje biblioteka s kolegama

### Instalacija

1. Posjetite [zotero.org/download](https://www.zotero.org/download/)
2. Preuzmite verziju za vaš operativni sustav
3. Instalirajte aplikaciju
4. Instalirajte **Zotero Connector** za vaš preglednik

### Povezivanje s Quartom

Za korištenje Zotera u Quarto dokumentima, dodajte u YAML zaglavlje:

```yaml
bibliography: references.bib
csl: apa.csl
```

---

# Provjera instalacija

Prije radionice provjerite da su svi alati ispravno instalirani.

## Brza provjera

Otvorite terminal (Command Prompt/PowerShell na Windowsima, Terminal na macOS/Linux) i izvršite:


::: {.cell}

```{.bash .cell-code}
# R
R --version

# Quarto
quarto --version

# Git
git --version
```
:::


## Provjera u Positronu

1. Pokrenite Positron
2. Kreirajte novu R datoteku (File > New File > R Script)
3. Upišite i izvršite:


::: {.cell}

```{.r .cell-code}
# Trebalo bi ispisati verziju R-a
R.version.string

# Testirajte Copilot - počnite pisati komentar:
# Funkcija koja računa
```
:::


Ako Copilot radi, trebali biste vidjeti prijedloge koda u sivoj boji.

## Lista provjere

- [ ] Perplexity račun kreiran
- [ ] Gemini dostupan (Google prijava)
- [ ] Claude račun kreiran i verificiran
- [ ] R instaliran (verzija 4.x)
- [ ] Positron instaliran i pokreće se
- [ ] Quarto instaliran
- [ ] GitHub račun kreiran
- [ ] GitHub studentske pogodnosti zatražene/odobrene
- [ ] GitHub Copilot aktiviran
- [ ] Copilot ekstenzija instalirana u Positronu
- [ ] Git instaliran i konfiguriran

---

# Pomoć i podrška

## Česti problemi

::: {.callout-tip collapse="true"}
## Copilot ne radi u Positronu

1. Provjerite da ste prijavljeni (ikona u donjem lijevom kutu)
2. Provjerite da imate aktiviran Copilot na GitHubu
3. Ponovno pokrenite Positron
4. Provjerite internetsku vezu
:::

::: {.callout-tip collapse="true"}
## Positron ne pronalazi R

1. Otvorite Settings (Ctrl+,)
2. Pretražite "R Path"
3. Unesite putanju do R instalacije:
   - Windows: `C:\Program Files\R\R-4.x.x\bin\x64\R.exe`
   - macOS: `/Library/Frameworks/R.framework/Resources/bin/R`
:::

::: {.callout-tip collapse="true"}
## Git traži lozinku pri svakom pushu

Konfigurirajte credential helper:


::: {.cell}

```{.bash .cell-code}
# Windows
git config --global credential.helper wincred

# macOS
git config --global credential.helper osxkeychain

# Linux
git config --global credential.helper store
```
:::

:::

## Kontakt

Ako naiđete na probleme koje ne možete riješiti, javite se na:

**Email:** luka.sikic@unicat.hr

Molimo u poruci navedite:

- Operativni sustav i verziju
- Alat s kojim imate problem
- Poruku greške (screenshot ili tekst)
- Korake koje ste već pokušali

---

::: {.callout-tip}
## Vidimo se na radionici!
Hvala na strpljenju pri instalaciji alata. Dobro pripremljeni sudionici omogućuju nam da se fokusiramo na učenje, a ne na tehničke probleme.
:::

