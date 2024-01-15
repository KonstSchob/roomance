import 'package:flutter/services.dart'; // Notwendig für Portrait Modus
import 'import.dart';

//Logo updaten
// Noch alles in einem Code ca. ~1.800 Zeilen momentan
// Navigationsleiste wird noch ausgegliedert, Code vereinfacht
// Darstellung wird Dynamisch ausgerichtet, damit diese auf jedem Gerät funktioniert
// Spezielle Funktionen: Swipe Funktion, Chat Funktion (Maps Implementierung in Sucheinstellungen geplant)
// Portrait Modus festgelegt
// 4 Seiten fertig/ 2 in Arbeit/ 2 Seiten stehen noch aus
// Probleme: Scrollbarer Screen, Button implementierung in Swipe Funktionen,

//TODO screens/dateien ordentlich benennen

// -------------------------------MAIN

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]) // Wichtig für Portrait
      .then((_) {
    runApp(const Roomance());
  });
}

class Roomance extends StatelessWidget {
  const Roomance({Key? key});

  @override
  Widget build(BuildContext context) {
    // App-Konfiguration
    return const MaterialApp(
      home: Startseite1(), //SOLLTE HOMESCREEN (Entdecken) SEIN
    );
  }
}

//-----------------------------------------Swipe ENDE----------------------------------------------------------//

// TODO Navigationsleiste extrahieren und nur 1x als Code UND Markierung der jeweiligen Seite

// TODO Seiten: Einstellungen/ Matches / Profil

// TODO Mehr dynamische Positionierungen -> Erledigt .ML -> nicht erledigt .K
