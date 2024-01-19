import 'Funktionsbausteine/import.dart';

// --- Startseite1 mit Logo ---
class Startseite1 extends StatelessWidget {
  const Startseite1({super.key});

  @override
  Widget build(BuildContext context) {
    // Funktion für die Verzögerung und Navigation zur nächsten Seite

    // ignore: no_leading_underscores_for_local_identifiers
    void _navigateToNextPage() {
      Future.delayed(const Duration(seconds: 2),
          () // Sekunden für Verzögerung von Seite 1 zu 2 werden hier festgelegt

          {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const SecondScreen()), // Nächstes Fenster wir hier festgelegt
        );
      });
    }

    // Start der Verzögerung und Navigation beim Aufbau des Widgets
    _navigateToNextPage();

    return Scaffold(
      body: Container(
        // Container für das Hintergrunddesign
        width: MediaQuery.of(context).size.width, // Füllt den ganzen Screen
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00), // Werte für Farbverlauf
            end: Alignment(0, 1),
            colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)], // Farbverlauf
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Row(
          //Logo und Schrift werden in der Mitte des Bildschirms angezeigt
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 83.50, // Wichtiger Wert für MediaQuery
                height: 48,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/logo1.png"), // LoGo in der Mitte
                  ),
                ),
              ),
            ),
            // Positionierter Schriftzug
            const Text(
              'roomance', // Schriftzug Mitte unter Logo
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontFamily: 'Gudea',
                fontWeight: FontWeight.w400,
                letterSpacing:
                    -4, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
