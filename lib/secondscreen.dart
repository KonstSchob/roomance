import 'Funktionsbausteine/import.dart';

//--------------------------------- Start Seite 2 mit Anmeldung --------------------------------//

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context)
            .size
            .width, // Dynamische Anpassung an bildschirm
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00), // Farbverlauf
            end: Alignment(0, 1),
            colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
          ),
          shape: RoundedRectangleBorder(),
        ),

        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width / 2 -
                  152, // Dyn. Ausrichtung Anmeldung
              top: 690,
              child: SizedBox(
                width: 304,
                height: 53,
                child: ElevatedButton(
                  onPressed: () {
                    // Button Funktion zur nächsten Seite
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavBar()), // LOG IN zur nächsten Seite -> Navigationsseite
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEAEAEA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google.png", // Google LOGO
                        width: 33,
                        height: 33,
                      ),
                      const SizedBox(width: 8), // Abstand Logo Text
                      const Text(
                        'LOG IN WITH GOOGLE', // ---- Kursive Schrift
                        style: TextStyle(
                          color: Color(0xFF483F3F),
                          fontSize: 13.70,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 -
                  56, // Ermöglicht die dynamische Positionierung in der Mitte
              top: 755,
              child: const SizedBox(
                width: 112,
                height: 25,
                child: Text(
                  'Weitere Optionen',
                  style: TextStyle(
                    color: Color(0xFF4C4C4C),
                    fontSize: 13.26,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 -
                  161.5, // Dynamische Positionierung
              top: 630,
              child: const SizedBox(
                width: 323,
                height: 55,
                child: Center(
                  child: Text(
                    'By clicking “Log in”, you agree with our '
                    'Terms. Learn how we process your data in our ' // Standard Text für Google Funktion
                    'Privacy Policy and Cookies Policy.',
                    style: TextStyle(
                      color: Color(0xFF4C4C4C),
                      fontSize: 12,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 -
                  112.5, // Dynamische Anpassung an Bildschirm
              top: 134,
              child: SizedBox(
                width: 225,
                height: 46,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 39.19,
                      height: 46,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo1.png"), // TODO einheitlich ordner machen
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 184,
                      height: 49,
                      child: Text(
                        'roomance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontFamily: 'Gudea',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
