import 'Funktionsbausteine/import.dart';

// --- Startseite 2 mit Anmeldung ---

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
        // Farbverlauf des Hintergrunds
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
          ),
          shape: RoundedRectangleBorder(),
        ),

        child: Stack(
          children: [
            // roomance Text + Logo
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height *
                        0.60), // Position im oberen Teil des Bildschirms
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        bottom: 11,
                      ),
                      child: Image.asset(
                        'assets/images/logo1.png',
                        fit: BoxFit.contain,
                        height: 48,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'roomance',
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'Gudea',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -4,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Login UI unten
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height *
                        0.7), // Position im unteren Teil des Bildschirms
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Login Disclaimer
                    const SizedBox(
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
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // Login-Button Google
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        width: 304,
                        height: 53,
                        child: ElevatedButton(
                          onPressed: () {
                            // Weiterleitung zur nächsten Seite
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNavBar()), // zur Navigationsleiste auf Swipeseite
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
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Text "Weitere Optionen"
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Weitere Optionen',
                        style: TextStyle(
                          color: Color(0xFF4C4C4C),
                          fontSize: 14,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w500,
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
