# Projecte Intermodular (1r DAW): Observatori Blaugrana

Aquest repositori consolida de forma pràctica els coneixements dels 4 mòduls claus del 1r any del cicle formatiu de Desenvolupament d'Aplicacions Web (DAW).

## 🎯 Objectiu del Projecte 

L'objectiu ha estat desenvolupar una **Single Page Application (SPA)** acadèmica dissenyada per proporcionar informació estructurada de la plantilla del FC Barcelona. La interfície inclou un menú de pestanyes net per a consultar jugadors, l'estat crític de la infermeria (lesions) i rànquings estadístics, sense necessitat de recarregar la pàgina.

---

## 🏗️ Justificació de Mòduls

Aquest projecte acompleix amb precisió les rúbriques establertes a la guia `PI-1DAW`:

### 1. Llenguatges de Marques
- **HTML Semàntic**: Us d'etiquetes `<header>`, `<main>`, `<section>` per a maquetar la navegació.
- **Aspecte (CSS3)**: Adopció d'un disseny corporatiu clar ("lluminós"), descartant CSS innecessari o llibreries bootstrap externes. L'esquelet s'ha construït purament emmagatzemant variables a `:root` i estructurant les targetes amb **CSS Grid** (`grid-template-columns: repeat(...)`) i **Flexbox** per alineacions.
- **JSON**: Base de Dades no-relacional formatant els jugadors com a objectes per a la lectura del frontend via protocol HTTP.

### 2. Programació
S'apliquen els coneixements angulars de JS Client-Side:
- **Asincronia**: Implementació de funcions `async / await` i l'API `fetch()` per capturar asíncronament el fitxer `players.json`.
- **Manipulació Lògica d'Arrays**:
  - Utilització intensiva de mètodes d'Alt Nivell com `.filter()` per cercar jugadors lesionats o filtrar posicions, `.map()` per a renderitzar HTML concatenat, i `.sort()` per deduir els màxims golejadors.
- **Persistència Web**: Mitjançant la rúbrica exigida, s'implementa l'API de `localStorage` al clic del botó "Marcar favorit", demostrant així que podem mantenir estats per a usuaris malgrat recarregar la sessió.

### 3. Bases de Dades
Al no poder incorporar de manera total un Backend clàssic, la capa de BDD s'ha aportat mitjançant el document extern independent `database_schema.sql`.
- Disposa del Disseny Normalitzat complert i estandarditzat, trencant la taula abstracta de "jugadors" en conjunts relacionals de finances, informes mèdics per l'hospital, i estadístiques numèriques amb `FOREIGN KEY` i `ON DELETE CASCADE`.

### 4. Entorns de Desenvolupament
Utilització clau de metodologies pràctiques per l'ambient de treball:
- Elaboració completa de la documentació utilitzant codificació `Markdown`, respectant l'estructura dels fitxers *Readme*.
- Control actiu de versions mitjançant repositori `Git` publicat a la núvol a on queden emmagatzemats els nostres *Commits*.

---

## 🏆 Conclusions
El projecte resol intel·ligentment tots els requeriments bàsics mitjançant una arquitectura fàcil i sòlida, apta per a esdevenir la primera pedra estructural d’una posterior web backend completa el dia de demà.
