params [ ["_unit",objNull,[objNull]] ];

_unit createDiaryRecord ["Diary",["Feinde spawnen","
<font size=20 color='#0094FF'>Funktionsweise</font><br/>
Einheiten werden gespawned (Anzahl und Art je nach Spieleranzahl) und patrouillieren mit FUPS. Das Spawnen ist eine einfache Variante, sodass Einheiten im Meer spawnen oder in kleinen Staedten die patrouillierenden Einheiten von den Fahrzeugen ueberfahren werden koennen. Gegebenfalls im Zeus eine Stadt am Meer ueberpruefen oder eine neue geben (und das alte OBJ aufraeumen) lassen.<br/>
<font size=20 color='#0094FF'>Wie spawnen?</font><br/>
Laptop <marker name='marker_laptop'>*klick-mich*</marker> -> Naechstes OBJ<br/>
Auf der Karte wird eine Stadt markiert (und Einheiten erstellt)<br/>
<font size=20 color='#0094FF'>Was wenn OBJ genommen?</font><br/>
Laptop -> Clean Up OBJ<br/>
Alle erstellten Einheiten werden beim OBJ geloescht<br/>
<font size=20 color='#0094FF'>Einstellungsmoeglichkeiten</font><br/>
Laptop -> Settings FUPS<br/>
- gegnerische Fraktion waehlbar<br/>
- auch eine zusaetzliche Feindstaerke (Infanterie, halb-harte und harte Fahrzeuge) auswaehlbar -> dies mit Vorsicht benutzen (etwa bei Verfuegung von CAS bei wenigen Leuten 1-2 harte Ziele ergaenzen)
"]];

_unit createDiaryRecord ["Diary",["Heli-Script","
<font size=20 color='#0094FF'>Wie rufen?</font><br/>
Bussard und Weiss koennen ueber die ACE-Interaktion gerufen werden (und die KI fliegt zu euch).<br/>
<font size=20 color='#0094FF'>Wer kann rufen?</font><br/>
TF und Funker koennen Weiss rufen und diese fliegen dann zur Position des Rufenden (die TFs dies bitte nur nutzen, wenn der Funker bewusstlos ist).<br/>
Der Funker kann Bussard rufen, muss hierzu aber die LZ erst bewegen bzw. platzieren (ACE Interaktion auswaehlen und auf der Karte linksklicken).<br/>
<font size=20 color='#0094FF'>Was beachten?</font><br/>
Nicht direkt unter dem Landepunkt stehen, da sonst die KI nicht landet (die neue LZ muss dann einige Meter von der Alten entfernt sein) - der Rufende sollte aber nach dem Landen schnell zum Heli laufen, damit dieser nicht abhebt.<br/>
Fuer die Helis werden ein Haufen Hints ausgegeben - Lesen ist von Vorteil.<br/>
<font size=20 color='#0094FF'>Sonstiges</font><br/>
Der Funker besitzt einen Zeus, falls etwas schief laeuft (etwa die KI einen Heli versemmelt - diesen dann per Zeus reparieren). Alternativ ueber den Laptop einen Neuen anfordern.<br/>
ueber die Loadout-Kiste (NATO-Kiste) koennen auch die ACE-Interaktionen fuer die Heli-Scripts (und Nachschubkiste) aktiviert bzw. deaktiviert werden.
"]];

_unit createDiaryRecord ["Diary",["Loadout-Kiste","
Die Loadout-Kiste ist die NATO-Kiste neben dem OPL-Bunker <marker name='marker_loadoutbox'>*klick-mich*</marker><br/>
<font size=20 color='#0094FF'>Loadouts waehlen</font><br/>
Loadout-Kiste bzw. NATO-Kiste -> Fraktion waehlen -> Benutze Slot oder Slot dementsprechend waehlen<br/>
<font size=20 color='#0094FF'>Sonstige Funktionen</font><br/>
M4/M4A1/M16A4-Varianten sind ueber die Loadout-Kiste waehlbar (M4_VARIANTS). Dies nur nutzen, wenn die Zugfuehrung eine andere Gattung vorschreibt - nicht selbstaendig mischen.<br/>
Zusaetzliche AT-Waffen ueber die Loadout-Kiste nutzbar (ADD_CARGO). Diese werden in die Kiste hineingelegt. Die Kiste selbst kann auch wieder geleert werden (Leere Box).<br/>
Ueber die Loadout-Kiste (NATO-Kiste) koennen auch die ACE-Interaktionen fuer die Heli-Scripts (und Nachschubkiste) aktiviert bzw. deaktiviert werden.
"]];

_unit createDiaryRecord ["Diary",["Briefing","
<font size=20 color='#0094FF'>Lage</font><br/>
Die idyllische Insel Altis war bis 2009 ein beliebtes Ziel bei Touristen aus aller Welt. Jedoch wurde ab 2010 die griechische Staatsschuldenkrise fuer die Weltoeffentlichkeit praesent. ueber die Jahre kippte aufgrund der Verschuldung und Sparmaßnahmen die Stimmung der Bevoelkerung. Durch Verlust jeglichen Vertrauens griff die Bevoelkerung zur Waffe - jedoch jeder Ort zu einer Verschiedenen!<br/>
Mittlerweile sind unterschiedliche militaerische Parteien auf Altis taetig um unter dem Vorwand der Bevoelkerung zu helfen Krieg zu spielen.<br/>
Das primaere Ziel der Parteien sind Staedte, in der Sie patrouillieren koennen bis eine gegnerische Partei aufkreuzt. Hierbei nutzen alle Parteien auch schweres militaerisches Material.<br/>
<font size=20 color='#0094FF'>Auftrag</font><br/>
Ihr Auftrag ist kurz und schmerzlos: Nehmen Sie die Staedte ein, bei denen sich eine gegnerische Partei befindet.<br/>
Beachten Sie, dass der Feind halb-hart und hart gepanzerte Fahrzeuge besitzt. Gehen Sie mit bedacht vor.<br/>
<font size=20 color='#0094FF'>Durchfuehrung</font><br/>
Entscheiden Sie sich vor Unterrichtung ihrer Truppen welcher Fraktion wir unsere Dienste zur Verfuegung stellen.<br/>
Fuehren Sie anschließend aus welche Feinde praeferiert angegriffen werden.<br/>
Dieses muss auch ueber den Laptop an unsere Zentrale in Panama uebermittelt werden. (Laptop -> Settings FUPS -> gegnerische Fraktion waehlen)<br/>
Sobald das gegnerische Dorf auf der Karte markiert ist (Laptop -> Naechstes OBJ) und der Plan steht, kann Bussard Sie zu einer gewaehlten LZ verlegen. Falls Sie einen MedEvac benoetigen steht Ihnen Weiß zur Verfuegung.<br/>
Gegebenenfalls befinden sich unter Ihrem Truppen Soldaten, die eine Flugzeug oder schwer gepanzertes Fahrzeug bedienen koennen. Beruecksichtigen dies rechtzeitig in ihrer Planung.<br/>
Nach erfolgreichen Nehmen einer Stadt nicht vergessen zeitnah unser Hauptquartier ueber den Laptop zu informieren, damit Praemien fuer die einzelnen Soldaten ausgezahlt werden koennen. (Laptop -> Clean Up OBJ)<br/>
<font size=20 color='#0094FF'>Zusaetzliche Informationen</font><br/>
- ACE-Medical Lifetime: 900 Sekunden / 15 Minuten.<br/>
- Technischer Teleport an folgenden Objekten: NATO-Flagge (neben dem OPL-Bunker).<br/>
- Loadouts ueber die NATO-Kiste neben der NATO-Flagge waehlbar.<br/>
"]];