# Istraživanje uz AI

Pregled materijala, 27. listopada 2026.

## Zajednički način rada

Jedan CSV sa 120 mjesečnih opažanja za Hrvatsku od 2015. do 2024.
dodaje se jednom u AI razgovor s podrškom za izvršavanje analize.
Pitanje, plan, kod, tablice, grafovi i zaključak ostaju u tom razgovoru.
Stranice dana sadrže sve upite i pregled svih mjeseci. Ako sesija istekne,
ponovno se dodaje ista datoteka. Pripremljeni rezultati dostupni su na stranici.

Svaka tema ima razgovor, jedan pokazani primjer i vlastiti pokušaj.
Završni rezultat je graf i oko 150 riječi tumačenja vlastitog pitanja.

| Tema | Aktivnost |
|---|---|
| 1.1 Postavite istraživačko pitanje | Odabrati pitanje koje dvije mjere i 120 mjeseci mogu istražiti. |
| 1.2 Pronađite i provjerite izvore | Objasniti saldo očekivanja uz službenu metodologiju. |
| 1.3 Provjerite i uredite sažetak | Preraditi uvjerljiv odlomak s pogrešnim tumačenjima. |
| 1.4 Pripremite plan analize | Odabrati prikaz i usporedbu za svoje pitanje. |
| 2.1 Upoznajte i provjerite podatke | Provjeriti mjesece, praznine i jedinice cijelog skupa. |
| 2.2 Dopunite i objasnite kod | Izraditi grafove i godišnje sažetke te prilagoditi prikaz. |
| 2.3 Ponovite analizu od početka | Provjeriti izračun i usporediti povezanost u dva razdoblja. |
| 2.4 Napišite i uredite zaključak | Objasniti svoj nalaz u odlomku uz graf i provjerene brojke. |

## Metode i provjere

Koristimo već izračunanu godišnju stopu HICP-a u postocima i anketni saldo
u bodovima. Provjeravamo jedinstvenost i potpunost mjeseci te praznine
u dvjema brojčanim serijama. Prazne oznake statusa čitamo prema rječniku.
Prikazujemo dva odvojena vremenska grafa, godišnje prosjeke i broj mjeseci.
HICP sažetak je prosjek 12 mjesečnih godišnjih stopa.

Korelacije uspoređuju vrijednosti iz istog mjeseca. Za podrazdoblja
2015.–2019. i 2020.–2024. koristimo po 60 mjeseci. Rezultate tumačimo
opisno. Statistička razlika, prognoza i uzročni učinak traže zasebnu analizu.

## Materijali i daljnji rad

materials/activities/ sadrži zajedničke aktivnosti za stranice dana
i sve primjere. Priručnik prati iste naslove i aktivnosti. R projekt,
agenti, bilježnice, predlošci i OLS/HAC ostaju mogućnosti za nastavak.
Privatni vodič čuva se izvan repozitorija, javnog weba i ZIP-a.

Quarto gradi web, a PDF koristi iste tekstove poglavlja kao web priručnik.
Upute za gradnju, cijeli R postupak i objavu nalaze se u README.md.
