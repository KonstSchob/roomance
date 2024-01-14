import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Notwendig für Portrait Modus
import 'dart:async'; //NÖTIG?
import 'import.dart';


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
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]) // Wichtig für Portrait
      .then((_) {
    runApp(const Roomance1());
  });
}

class Roomance1 extends StatelessWidget {
  const Roomance1({Key? key});

  @override
  Widget build(BuildContext context) {
    // App-Konfiguration
    return const MaterialApp(
      
      home: Scaffold(body: Startseite1()),
    );
  }
}


//-----------------------------------------Swipe ENDE----------------------------------------------------------//


// TODO Navigationsleiste extrahieren und nur 1x als Code UND Markierung der jeweiligen Seite

// TODO Seiten: Einstellungen/ Matches / Profil

// TODO Mehr dynamische Positionierungen -> Erledigt .ML
