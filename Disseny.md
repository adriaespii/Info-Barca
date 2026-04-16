# 📑 Disseny i Planificació del Desenvolupament

En aquesta secció es documenta el cicle de desenvolupament seguit que respecta el coneixement d'un estudiant de primer any.

## 1. Mètode de Treball
S'ha utilitzat una metodologia iterativa o descendent per poder avaluar el projecte segons les assignatures clau:
1. **Fase Llenguatge de Marques:** Tot l'esquelet web muntat prèviament de forma estàtica.
2. **Fase Estilització:** Addició del disseny visual mitjançant CSS puro (`style.css` incrustat segons l'arxiu HTML)
3. **Fase Scripting:** Implantació de tota la "màgia" reactiva en Javascript per iterar els arrays de jugadors del mercat, pressupost, etc.
4. **Fase Final:** Creació de l'squema de bases de dades documentat apart com el projecte de continuïtat de Bases de Dades.

Els passos s'han controlat fent servir la metodologia Kanban (To-Do, Doing, Done).

## 2. Mapa d'Estats (JavaScript)
Per fer funcionar tota la complexitat sense bases de dades reals que ho llastrin, l'estat global es controla emprant el següent objecte persistent en RAM i que sincronitza constantment amb un fitxer local `localStorage` de l'usuari:

```javascript
let state = {
    budget: 250000000,
    players: [],
    stats: { matches: 0, wins: 0, draws: 0, losses: 0 }
};
```

Qualsevol decisió (com fer clic a un jugador o "contractar-ne" un des del mercat) simplement obre l'Array de jugadors, busca pel seu camp `id`, altera el permís per mostrar el botó com a no disponible o fitxat, actualitza els diners, i es processa un mètode anomenat `updateAll()` que re-renderitza el HTML amb un mètode `.map()` i els *Template Strings* de Javascript Modern.

## 3. Disseny de la Base de Dades (Mòdul BD)
S'ha preparat un document DDL `.sql` (`database_schema.sql`) dissenyat a mida amb taules minimalistes i relacions consistents tipus *un a molts*, emprant Primary i Foreign Keys. S'ha omès expressament poblacions hiper-massives i només es testegen amb usuaris base en llenguatge SQL d'estructura clàssica ensenyada al mòdul teòric.

## 4. UI/UX (Llenguatge de Marques)
S'ha buscat una impressió d'estil "Manager de Consola".
L'ús intensiu del `Grid` combinat amb variables `root` per colors ajuda enormement a obtenir aquest aire exclusiu de "eSports" fosc i dinàmic garantint que en telèfon mòbil funcioni tot mitjançant els *Media Queries* inserit al document CSS. S'ha prioritzat l'experiència tàctil creant la mecànica experimental del `HTML5 Drag and Drop API` perquè la configuració central de l'alineació se senti totalment professional, aconseguint esprémer a fons la capacitat bàsica de l'assignatura de programació.
