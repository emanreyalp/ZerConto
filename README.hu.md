# ZerContro

### Specifikáció
Készíts egy alap Ruby on Rails alkalmazást, amiben felhasználókat és a hozzájuk tartozó jogosultságokat és címeket menedzselni.

Legyen 3 jogosultság :
guest
manager
developer

A jogosultságokat a migrációban töltsük fel.

Legyen egy felhasználó lista oldal és egy felhasználó felvitel/szerkesztés oldal. A felhasználó formban lehessen kiválasztani a felhasználó felettesét. Egy felhasználónak csak egy felettese lehet de egy felettes akárhány felhasználónak lehet a felettese. Felettes csak olyan felhasználó lehet akinek van manager joga. Saját maga felettese ne lehessen és ne lehessen a felettese felettese.
A formban fel lehessen tölteni a felhasználó saját adatain kívül a címeit is. Maximum 5 címet adhat meg. A címben az ország, irányítószám, város és az utca szerepeljen.

A lista oldalon legyen egy kapcsoló, amivel ki tudjuk listázni:
- az összes usert
- mindenkit aki nem felettese senkinek
