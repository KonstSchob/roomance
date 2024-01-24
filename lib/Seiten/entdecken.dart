import '../Funktionsbausteine/import.dart';

//TODO LAYOUT FIXEN und alles als CARD implementieren
//--- Screen Entdecken ---

class Entdecken extends StatelessWidget {
  const Entdecken({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Image.asset(
                'assets/images/logo2.png',
                fit: BoxFit.contain,
                height: 48,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFF24C3D),
                      Color(0xFFFECB2D)
                    ], // Farbverlauf
                  ).createShader(bounds);
                },
                child: const Text(
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
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Weiterleitung zum Swipen
          Stack(
            children: [
              // --- Inhalt ---
              Container(
                //Bild der Wohnung
                padding: const EdgeInsets.all(15),
                // alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: const Image(
                    image: AssetImage(
                        "assets/images/entdecken_room.png") //Verwendetes Bild
                    ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Du suchst nach einem Zimmer?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 37,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Suche jetzt in deiner Stadt!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    //TODO Suchen button
                  ],
                ),
              ),

              const Positioned(
                left: 6,
                top: 410,
                child: SizedBox(
                  width: 164,
                  child: Text(
                    'Mehr Möglichkeiten',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5F5555),
                      fontSize: 17,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                //Bild "Du suchst nach einem Zimmer"
                left: MediaQuery.of(context).size.width / 2 - 195,
                top: 20,
                child: Positioned(
                  left:
                      MediaQuery.of(context).size.width - 130, // Position Suche
                  top: 195,
                  child: SizedBox(
                    width: 72,
                    height: 25,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            // Hintergrund für Suche
                            width: 72,
                            height: 25,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFCFCFC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -3,
                          top: -6,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const Swipen()),
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ), // Hintergrundfarbe transparent
                            ),
                            child: const Text(
                              'SUCHE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15, // Vorher 18
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                                height: 0.06,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Text 'du wohnst schon in WG'

          // Lade andere ein UI Card
          // Unternehme etwas UI card

          // TODO ALT entfernen
          Positioned(
            // Ausrichtung Bild Party
            left: MediaQuery.of(context).size.width / 3 - 128,
            top: 447,
            child: Container(
              // Bild Lade ein
              width: 194,
              height: 295,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/entdecken2.png"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Eckenrundung
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 3 -
                118, // Dynamische Ausrichtung Schrift Bild "Party"
            top: 440,
            child: const SizedBox(
              width: 246,
              height: 270,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 143,
                    child: SizedBox(
                      width: 241.04,
                      height: 100,
                      child: Text(
                        'Lade\nandere ein', // Hier Umbruch mit \n
                        style: TextStyle(
                          color: Color(0xFFFCFCFC),
                          fontSize: 30,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            // Ausrichtung Bild "Unternehme etwas"
            left: MediaQuery.of(context).size.width / 2,
            top: 447,
            child: Container(
              width: 194,
              height: 295,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/entdecken3.png"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ),

          const Positioned(
            // Achtung hier werden Veranstalte, Unternehme etwas.. und Triff dich positioniert TODO Eventuell ändern
            left: 5,
            top: 447,
            child: SizedBox(
              width: 638,
              height: 364,
              child: Stack(
                children: [
                  Positioned(
                    left: 15,
                    top: 228,
                    child: Text(
                      'Veranstalte eine\nWG Party',
                      style: TextStyle(
                        color: Color(0xFFAEAEAE),
                        fontSize: 15,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 210,
                    top: 135,
                    child: SizedBox(
                      width: 459,
                      height: 344,
                      child: Text(
                        'Unternehme\netwas',
                        style: TextStyle(
                          color: Color(0xFFFCFCFC),
                          fontSize: 30,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 210,
                    top: 227,
                    child: Text(
                      'Triff dich mit\nanderen Roomance Nutzern',
                      style: TextStyle(
                        color: Color(0xFFAEAEAE),
                        fontSize: 15,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Positioned(
            left: -17,
            top: 390,
            child: SizedBox(
              width: 318,
              height: 31,
              child: Text(
                'Du wohnst schon in einer WG?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButton(
      {required String label,
      required String imagePath,
      double scale = 1.0,
      Function()? onPressed}) {
    return IconButton(
      onPressed: onPressed, // Nötig für Verlinkung des Buttons
      icon: Transform.scale(
        scale: scale,
        child: Image.asset(imagePath),
      ),
    );
  }
}
