import 'package:flutter/services.dart'; // Notwendig für Portrait Modus
import 'import.dart';

// -------------------------------MAIN

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]) // Portrait-Modus festgelegt
      .then((_) {
    runApp(const Roomance());
  });
}

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