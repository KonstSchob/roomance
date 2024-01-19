# Achtung: Dies ist keine voll-funktionsfähige App
Es kann je nach Gerät zu Layout-Problemen kommen. Getestet wurde die App auf einem Samsung S20 und A90.

# Installation
Dieses Repository kann mit Git geklont werden und mit flutter run in VS Code lokal ausgeführt werden. Eine Anleitung dafür befindet sich [hier](https://docs.flutter.dev/get-started/install).

Stattdessen kann die beigefügt .apk auch direkt installiert werden. Eventuell muss hierfür die Installation aus Unbekannten Quellen erlaubt werden. Der Play Protect Dialog kann ignoriert werden, er tritt auf, da diese App nicht aus dem Playstore kommt und verifiziert wurde.

# Erklärung zu den Custom Dependencies:
Da manche der verwendeten Packages verändert werden mussten, 
sind die lokalen Versionen im Ordner lib/customdependencies gespeichert. 
Die Profilseite basiert auf [diesem Projekt](https://github.com/ilagazo/Flutter_UserProfile). Sie wurde von uns aber stark angepasst, um dem roomance-Design gerecht zu werden. Die verwendeten Dateien sind im Ordner lib/Seiten/Profilseite zu finden.

# Todo (Weitere Verbesserungen oder Ideen):
- Logo und dessen Implementierungen verbessern
- Darstellung dynamischer ausrichten, mehr Responsive Design
- Swipen: Aktueller Stand des Swipens speichern, wenn Seite gewechselt wird
- Spezielle Funktionen: 
    - Matches implementieren
    - Chat Funktion vervollständigen
    - Maps Implementierung in Sucheinstellungen geplant