# 📑 Disseny i Arquitectura: Observatori Barça

En aquest document especifiquem les fases i estructures que formen el cor tècnic de la plataforma. Ha sigut programat a consciència i des de zero evitant sobrecàrregues innecessàries, centrant-lo estrictament en els patrons indicats per l'institut.

## 1. Patró Arquitectònic
Ens trobem davant una web pràctica d'estil **Single-Page Application (SPA)** de cap a peus. L'HTML es descarrega una única vegada, i el propi Javascript natiu es l'encarregat d'ocultar i desocultar les seccions modificant el valor de les classes (`display: block` als `.active` vs el `display: none` genèric de la fulla d'estil global).

## 2. Mapa d'Estat (Dades)
A diferència de projectes "dummy" on the tota la informació està fixada de manera "Hardcoded" a les carpetes d'etiquetes `<p>` i `<div>` de HTML, nosaltres emprarem un Model Dinàmic basat en un magatzem JSON local asíncron cridat `players.json`.

```javascript
// La variable base de tota la SPA
let playersData = [];

// Es carrega usant modernitat (ES6+)
async function loadData() {
    const response = await fetch('players.json');
    playersData = await response.json();
    renderPlantilla(); // Es criden els repintats del DOM.
}
```

Aquest procés simula idènticament l'arquitectura del que seria tractar amb una EndPoint o API de segon curs (p.e: Mòdul de NodeJS amb Servidor).

## 3. Estètica Corporal (CSS)
Inspirant-mos en les normatives de claredat, s'han emprat colors extremadament plans a fons clars per reforçar l'experiència d'Usuari en relació amb la temàtica (Blaus al Botó o accents, etc). 

Per resoldre l'estructura visual adaptada en graella ("Cartes" dels jugadors) evitem utilitzar pre-processadors no exigits (veure cas Bootstrap o TailwindCSS per manca de necessitat) i ataquem amb:

```css
.grid-jugadors {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 2rem;
}
```
Aquesta fòrmula resol qualsevol problema de resolució (*Responsive design*) amb l'afegit que al baixar a mides de telèfon s'escala automàticament a llistat d'1 sola columna de carta independent sense forçar els `Media Queries` a pic i pala.

## 4. Tractament de les relacions d'SQL
El document SQL redactat apart demostra la capacitat conceptual on visualitzem que a diferència del Model de Dades Local d'Objectes JavaScript actual, a Base de dades requeriria taules creuades (Infermeria pertany a un Jugador (FK) per garantir la solidesa del registre esportiu).
