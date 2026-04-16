# Projecte Intermodular 1r DAW: Simulador FC Barcelona

Aquest projecte integra els coneixements adquirits en el primer any del cicle formatiu de Desenvolupament d'Aplicacions Web (DAW), centrant-se exclusivament en les tecnologies de programació de client i estructuració de la informació.

## 🎯 Objectiu del Projecte (MVP)

Desenvolupar el front-end i la lògica de negoci al client (Minimal Viable Product) d'un simulador esportiu. L'usuari assoleix el rol de President del FC Barcelona per a realitzar tres accions principals:
1. Navegar i visualitzar la plantilla i el mercat de jugadors.
2. Comprar i vendre jugadors gestionant un pressupost finit.
3. Crear una alineació tàctica interactiva mitjançant Drag & Drop.
4. Simular jornades d'una lliga "Mini" on només s'enfronten el FC Barcelona i el Real Madrid en un bucle per provar l'algoritme de resolució aleatòria.

---

## 🏗️ Relació amb els Mòduls Professionals

Aquest projecte justifica les rúbriques establertes a la guia `PI-1DAW`:

### 1. Llenguatges de Marques i Sistemes de Gestió d'Informació
- **HTML5:** Ús complet d'etiquetes semàntiques (`<header>`, `<main>`, `<section>`, `<nav>`, `<aside>`) per a millorar l'accessibilitat i l'estructura del codi.
- **CSS3 Vanilla:** Disseny responsive modern sense dependre de frameworks com Bootstrap. S'han fet servir tècniques CSS Grid i Flexbox de manera intensiva, aplicació de variables CSS per a la gestió de la paleta de colors (Blaugrana).
- **JSON:** Format triat per a l'emmagatzematge dels llistats de jugadors i el trasvàs de dades asíncrones.

### 2. Programació
- Lògica resolta enterament en **JavaScript (Vanila JS ES6)**.
- **Manipulació del DOM:** Creació dinàmica d'elements HTML per renderitzar cada pestanya del dashboard i els diferents grid de jugadors basats en arrays d'informació.
- **Persistència:** S'empra `localStorage` per guardar la partida de forma local i simular una sessió persistent.
- **Algorisme MVP:** Implementació de mètodes d'ordenació (`sort`), filtres (`filter`), iteradors (`map`) i càlcul de nombres pseudoaleatoris per resoldre l'algorisme simulador de resultats de partits.

### 3. Bases de Dades
Al fer ús de JSON i LocalStorage per complir els requisits del Mínim Producte Viable (front-end), s'inclou **al repositori l'arxiu `database_schema.sql`**. Aquest arxiu representa el que seria el disseny Entitat-Relació físic i el codi SQL amb `CREATE TABLE` tipificat preparat per escalar el projecte a un entorn *backend* real al segon curs de DAW.

### 4. Entorns de Desenvolupament
- **Llenguatge Markdown:** Creació sistemàtica de documentació (`README.md`, `Disseny.md` i `Proyecte_intermodular.md`).
- **Control de Versions:** Utilització de **Git** de manera exclusivament local, seguint un flux de treball estructurat mitjançant commits descriptius, i finalment un trasllat a repositori remot GitHub.
- L'ús exclusiu de l'IDE VS Code com epicentre del desenvolupament i control sintàctic formatant codi de manera neta.

---

## 🏆 Conclusions
Aquest projecte demostra l'adquisició pràctica i transversal dels resultats d'aprenentatge del primer any. La simplicitat de l'arquitectura, on totes les funcions d'estat es controlen mitjançant Localstorage en comptes d'API potents alienes a 1r de DAW, assegura un projecte assequible i 100% integrat als coneixements escolars actuals.
