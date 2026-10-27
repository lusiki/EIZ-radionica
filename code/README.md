# Izvođenje

Sve naredbe pokreću se iz korijena repozitorija.

## Isprobajte početnu skriptu

```r
source("code/starter.R", encoding = "UTF-8")
```

`.Rprofile` ne uključuje renv automatski, pa osnovna skripta radi i bez
paketa. Sačuvajte vlastite izmjene u submissions/.

## Ponovite cijeli referentni postupak

Jednokratno instalirajte renv i obnovite zaključano okruženje.

```r
install.packages("renv", repos = "https://cloud.r-project.org")
renv::restore(prompt = FALSE)
renv::load()
source("code/run_all.R", encoding = "UTF-8")
```

01_prepare.R obnavlja CSV iz zamrznutih JSON izvora. 02_analysis.R stvara
audit, godišnju tablicu, korelacije, graf i tablicu za web. Check.R provjerava
ulazne uvjete i uspoređuje brojke s data/reference/. Nema mrežnog poziva.
Referentne datoteke ne ažuriraju se automatski.

Za izlaze u drugoj mapi postavite EIZ_OUTPUT_DIR. Web koristi zadani results/.
Svaka godišnja vrijednost jest prosjek 12 mjesečnih opažanja. Korelacije
podrazdoblja imaju po 60 opažanja. Nisu testovi uzročnosti.

optional_hac.R izvan je jezgre. Model s konstantom, smjer regresije,
12 pomaka i isključeno prewhitening navedeni su unaprijed. Intervali su
asimptotski i uvjetni na pretpostavke. Primjer ne dokazuje stacionarnost,
egzogenost ili prediktivnu vrijednost.

## Ažuriranje izvornih podataka

```r
# U terminalu: Rscript --vanilla code/fetch_data.R work/new-snapshot
```

Preuzimanje odbija nepraznu odredišnu mapu. Usporedite metapodatke, šifre,
statusne oznake i vrijednosti prije zamjene postojeće snimke. Ažurirajte
manifest, reference, tekst rješenja i testove zajedno. Zabilježite zašto.
MD5 je provjera slučajne promjene datoteke, nije sigurnosni potpis.

flawed_example.R sadrži namjerne pogreške i ne ulazi u run_all.R.
