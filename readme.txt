Beste meneer Cornelis (Koen dus) en meneer Vlummens,
Welkom in mijn code! Ik licht nog even wat dingen toe:

Eerst en vooral: Vergeet NIET de bijgevoegde databank "AwkwardQuestions.sql" te runnen in jullie favoriete manager.
Jullie vinden deze databank op gewoon in mijn mapje op hetzelfde niveau als "index.html". Bovenaan creëer ik een databank van mijn twee tabellen en hopelijk werkt dit bij jullie
even goed zoals bij mij.

Indien je mijn applicatie runt, en de databank is NIET goed ingeladen, krijg je sowieso volgende error:
"Uncaught (in promise) SyntaxError: Unexpected token S in JSON at position 0."
Je zal in deze situatie ook meteen doorgestuurd worden naar een "Game-over" pagina. (Ik zou bij uitbreiding van de app hier natuurlijk een gepaste foutmelding voor voorzien).

Ik overloop even met jullie mijn applicatie en de aandachtspuntjes:
- Als je mijn applicatie op in de niet-mobiele versie bekijkt, zie je een mooi parallax effect op de foto van mijn beste vriendinnen en ik.
(Merk de gsm, die ik vastheb, op ;-))

- Ja, er staat tweemaal "speel het spel": hierdoor wordt de gebruiker extra getriggerd en moet deze niet enkel in de nav zoeken.

- Mijn applicatie is ZONDER het gridsystem van Bootstrap of eender welke partij gemaakt. Je merkt dus in mijn css dat ik dingen aanpas naargelang de devicegrootte.

- Configuratie:
  1. Op de mobiele versie zijn de radiobuttons met opzet veel groter gemaakt zodat deze makkelijk te selecteren zijn.
  2. Wanneer je "spel modus" aanklikt, verschijnt er dynamisch een aantal extra instellingen (aantal spelers en namen van de spelers). Deze gegevens zijn bij de "casual modus" niet nodig (zie speluitleg op site).
  3. Het aantal spelers maakt niet uit. Wil je met 100 spelen, dan speel je met 100. Wil je met twee spelen, dan speel je met twee. Minimum is natuurlijk twee spelers.
  4. Inputvelden van de spelersnamen worden dynamisch ingeladen naargelang het aantal spelers.
  5. Als er geen modus of categorie gekozen is, geeft dit een foutmelding bij het klikken op de "submit".
    Als er voor "spel modus" gekozen is, moeten ook alle naamvelden ingevuld zijn.
  6. Er wordt niet gecontroleerd op leestekens of cijfers: spelers mogen van mij best een "laraatje1996" kiezen. Beveiligingsgewijs maakt dit ook niet uit, want dit komt maar in de LocalStorage terecht dus dit heeft NIETS te maken met mijn databank.
  7. Bij het klikken op de submitknop worden de spelers met hun scores (default 0) in de localstorage gestoken (een array van objecten)

- Spel modus:
  1. Titel wordt dynamisch ingeladen (adhv welke spelmodus er gekozen werd).
  2A. Er zijn random twee spelers uit de localstorage gehaald, speler A en speler B. Speler A moet een vraag OVER speler B beantwoorden.
  2B. Speler A kan tweemaal na elkaar dezelfde speler zijn. In een echt spel kan je soms ook meerdere keren aan de beurt zijn. De randomfunctie is wel zo ingesteld dat het geen tien keer dezelfde speler A kan zijn.
  3. Je moet eerst klikken op "klik hier om te beginnen", puntenknoppen zijn disabled tot je hierop geklikt hebt.
  4. Als speler A juist geantwoord heeft over speler B, krijgt speler A twee punten. Deze twee punten worden opgeteld bij de huidige score van speler A en dit wordt aangepast in het localstorage-object van speler A.
  5A. Men krijgt een pushnotificatie bij het krijgen van nieuwe punten: je krijgt dan je net verkregen en je totaal aantal punten te zien.
  5B. De speler kan NIET bestookt worden met pushNotificaties, want een concept als het mijne speel je ook niet snel. Nadenken over de vraag, vraag beantwoorden, discussiëren over het antwoord en de punten... Tegen dan is de pushNotificatie time-out van 3 seconden al lang voorbij!
  6. Game-over:
    Als je dit scherm snel wilt bekomen, kies je ofwel voor de categorie "controversieel", want hier zitten er "niet veel" vragen in. (En als alle vragen "op" zijn, dan is het spel gedaan.)
    Ofwel klik je gewoon op "Stop het spel" (ik had er nog een "ben je dit zeker"-alert) willen insteken, maar ben hier niet toe geraakt.
    Op dit scherm krijg je de eindstand te zien: beste speler staat bovenaan, dus score is gerangschikt van hoog naar laag.
  7. De knop "Opnieuw spelen" leidt je terug naar de homepagina.

- Casual modus:
  1. Titel wordt dynamisch ingeladen (adhv welke spelmodus er gekozen werd).
  2. Rest spreekt voor zich.

- Op de mobiele versie kan de nav bereikt worden door op de 3 horizontale streepjes te klikken. Eigenlijk geen nav nodig omdat het een kleine site is, but you never know what the customer may think!

NOTA BENE: Mijn site staat online, maar ik heb nog niet gevonden hoe ik de db correct moet koppelen. Maar jullie kunnen al een kijkje nemen op "https://awkwardmoment.000webhostapp.com". Beoordeel deze site NIET, niet helemaal up-to-date. Maar ik zal dit zeker fixen in de vakantie als ik eraan verder werk ;-).
NOTA BENE 2: Ik gebruik een API voor mijn pushNotificaties, maar deze moet niet geinstalleerd worden. (Vergeet meldingen niet toe te staan.)
