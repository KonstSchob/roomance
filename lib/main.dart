import 'package:flutter/services.dart'; // Notwendig für Portrait Modus
import 'import.dart';

// --- Main, startet die App 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]) // Portrait-Modus festgelegt
      .then((_) {
    runApp(const Roomance());
  });
}
// --- Lädt die erste Seite 
class Roomance extends StatelessWidget {
  const Roomance({super.key});

  @override
  Widget build(BuildContext context) {
    // App-Konfiguration
    return const MaterialApp(
      home: Startseite1(),
    );
  }
}