# Max & Minou — Roadmap

Letztes Update: Juni 2026

---

## Status-Legende
- `[ ]` offen
- `[~]` in Arbeit
- `[x]` erledigt

---

## 1. Rezepte

### Testküche → Live bringen
Die vier Rezepte erscheinen aktuell in der Pipeline-Sektion auf der Startseite, haben aber noch keine echten Seiten.

- [ ] **Blumenkohl-Tacos** — `rezepte/tacos.html` existiert, aber Inhalt ist Platzhalter → befüllen
- [ ] **Buddha Bowl mit Süßkartoffel** — `rezepte/buddha-bowl.html` → befüllen
- [ ] **Pasta Primavera** — `rezepte/primavera.html` → befüllen
- [ ] **Knuspriger Kartoffelsalat** — `rezepte/kartoffelsalat.html` → befüllen

Für jede Seite: Zutaten, Zubereitung in zwei Spalten (Max / Minou), Foto sobald vorhanden.

### Neue Rezepte — Ideen
- [ ] Linsen-Bolognese mit Pasta
- [ ] Gerösteter Blumenkohl mit Tahini & Granatapfel
- [ ] Süßkartoffel-Curry mit Kokosmilch
- [ ] Ramen mit Miso-Brühe & Tofu
- [ ] Flammkuchen (Max-Version: mit Ziegenkäse 🧀)
- [ ] Focaccia mit Tomaten & Oliven

---

## 2. Was kochen wir? (Tinder)

### Problem
Supabase Free Plan pausiert nach 7 Tagen Inaktivität → Seite kaputt.
Login-Overhead für ein privates 2-Personen-Tool ist zu viel.

### Optionen

#### Option A — Gleicher Gerät, kein Backend (0 €/Monat)
- Alles im `localStorage` des Browsers
- Kein Login, kein Account
- Beide swipen auf demselben Gerät
- **Aufwand:** 1 Tag | **Kosten:** 0 €
- **Nachteil:** Kein Sync zwischen Geräten

#### Option B — Firebase Realtime Database (0 €/Monat)
- Google-Produkt, großzügiger Free Tier (1 GB Daten, 10 GB Transfer)
- Echtzeit-Sync, kein Login nötig — nur ein geteilter Room-Code
- Kein Server nötig, läuft direkt im Browser-JS
- **Aufwand:** 1–2 Tage | **Kosten:** 0 €
- **Nachteil:** Google-Abhängigkeit

#### Option C — PocketBase auf Hetzner VPS (4 €/Monat) ← Empfehlung wenn ihr 2 Geräte nutzt
- PocketBase = selbst gehostetes Backend (einzelne Binary, SQLite, Auth, REST, Echtzeit)
- Hetzner CX11 (2 GB RAM, 20 GB SSD) = 4 €/Monat, Server in Deutschland
- Kein Vendor-Lock-in, volle Kontrolle, DSGVO-freundlich (EU-Server)
- **Aufwand:** 1–2 Tage Setup | **Kosten:** 4 €/Monat

#### Option D — Supabase behalten, Problem fixen
- Supabase-Projekt auf "Pro" upgraden → pausiert nicht mehr (25 $/Monat)
- Oder: Weekly Cron-Job der einen Dummy-Request schickt → Pause verhindern (Hack)
- **Aufwand:** 2h | **Kosten:** 0 € (Hack) oder 25 $/Monat

### Entscheidung
- [ ] Klären: nutzen wir Tinder auf 1 Gerät oder 2?
- [ ] Option wählen und umsetzen

---

## 3. Rechtliches

- [x] Impressum erstellt (`impressum.html`)
- [x] Datenschutzerklärung erstellt (`datenschutz.html`)
- [ ] Beide Seiten live prüfen: Links im Footer, Layout, Inhalt korrekt?
- [ ] Plausible Analytics einbauen (Datenschutz erwähnt es bereits — Snippet fehlt noch)

---

## 4. Über uns

Aktuelle Seite hat Platzhalter-Inhalt (falsche Zeitangaben, keine echte Geschichte).

### Was stimmt nicht:
- „zehn Jahre zusammen kochen" → falsch, sind erst 2 Jahre zusammen
- „drei Jahre rein pflanzlich" → falsch
- Keine echte Geschichte

### Die echte Geschichte:
- **2024, Nizza** — erstes Date. Max will Minou ausführen, merkt schnell: vegan in Frankreich nicht so einfach. Ergebnis des Abends: die Blumenkohl-Tacos (erstes Rezept auf der Seite).
- **2024–2025** — viel gemeinsam gekocht, zurück in Deutschland mit mehr veganen Möglichkeiten. Erkenntnis: immer ist einer Chef, einer assistiert. Das nervt beide.
- **2025** — Rezepte anfangen zweispaltig zu schreiben.
- **2026** — Blog geht online.
- **Max** — schummelt gelegentlich Käse rein (Leidenschaft, die er noch nicht aufgeben konnte 🧀).
- **Minou** — rein pflanzlich.

### To-do:
- [ ] Manifesto-Text neu schreiben mit echter Geschichte
- [ ] Bio-Texte in den Portrait-Karten anpassen
- [ ] Zahlen in der Facts-Sektion korrigieren (Zeitangaben)
- [ ] Timeline anpassen (Nizza 2024, Blog 2026)

---

## 5. Bilder

- [x] Carbonara — `assets/images/carbonara.jpg`
- [ ] Tacos — Foto machen/einfügen
- [ ] Buddha Bowl — Foto machen/einfügen
- [ ] Pasta Primavera — Foto machen/einfügen
- [ ] Kartoffelsalat — Foto machen/einfügen
- [ ] Portrait-Fotos für Über-uns-Seite

---

## 6. Technische Schulden

- [ ] `ueber-uns.html` hat noch kein Favicon + OG-Tags
- [ ] Rezept-Unterseiten haben noch kein Favicon + OG-Tags
- [ ] Mobile Nav auf Tinder-Seite: „Anmelden"-Link führt nirgendwo hin
- [ ] 11ty / Static Site Generator evaluieren (wenn Rezepte >10 werden)

---

## Ideen-Parkplatz

- Newsletter-Integration (Buttondown oder Beehiiv — beide DSGVO-freundlich)
- Saison-Seiten (Frühling, Sommer etc. als eigene Landing Pages)
- Druckansicht für Rezepte
- Einkaufsliste-Funktion
