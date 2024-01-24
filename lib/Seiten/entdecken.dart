import '../Funktionsbausteine/import.dart';

//--- Screen Entdecken ---

class Entdecken extends StatelessWidget {
  const Entdecken({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                bottom: 10,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // UI Card "Du suchst eine Wohnung... "
            GestureDetector(
              // Weiterleitung zum Swipen
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavBar()),
                );
              },
              child: AspectRatio(
                aspectRatio: 1.6,
                child: Card(
                  surfaceTintColor: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  elevation: 10,
                  shadowColor: Colors.black,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      // Bild der Wohnung, verdunkelt durch Gradienten
                      Container(
                        constraints: const BoxConstraints.expand(),
                        child: ShaderMask(
                          shaderCallback: (rect) => const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                          ).createShader(rect),
                          blendMode: BlendMode.darken,
                          child: const Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/room_original.png") //Verwendetes Bild
                              ),
                        ),
                      ),
                      // Text im Bild
                      Container(
                        padding: const EdgeInsets.only(left: 15, bottom: 15),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Du suchst nach einem Zimmer?',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            AutoSizeText(
                              'Suche jetzt in deiner Stadt!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xFFAEAEAE),
                                fontSize: 18,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Text "Du wohnst schon..."
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Du wohnst schon in einer WG?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Mehr Möglichkeiten:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF5F5555),
                      fontSize: 17,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Mittlere Reihe UI Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // UI Card Party
                  SizedBox(
                    height: (MediaQuery.of(context).size.width - 30) /
                        1.6, // Umgekehrte AspectRatio 1.6
                    width: (MediaQuery.of(context).size.width - 30) /
                        2, //Nimmt die Hälfte des Platzes im Vergleich zu der ersten UI Card ein
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          // Bild, durch Gradient verdunkelt
                          Container(
                            constraints: const BoxConstraints.expand(),
                            child: ShaderMask(
                              shaderCallback: (rect) => const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                ],
                              ).createShader(rect),
                              blendMode: BlendMode.darken,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/party.png") //Verwendetes Bild
                                  ),
                            ),
                          ),
                          // Text im Bild
                          Container(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                            child: const AutoSizeText(
                              'Lade andere ein!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // UI Card Unternimm was
                  SizedBox(
                    height: (MediaQuery.of(context).size.width - 30) /
                        1.6, // Umgekehrte AspectRatio 1.6
                    width: (MediaQuery.of(context).size.width - 30) /
                        2, //Nimmt die Hälfte des Platzes im Vergleich zu der ersten UI Card ein
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          // Bild, durch Gradient verdunkelt
                          Container(
                            constraints: const BoxConstraints.expand(),
                            child: ShaderMask(
                              shaderCallback: (rect) => const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                ],
                              ).createShader(rect),
                              blendMode: BlendMode.darken,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/unternehme.png") //Verwendetes Bild
                                  ),
                            ),
                          ),
                          // Text im Bild
                          Container(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                            child: const AutoSizeText(
                              'Triff dich mit anderen!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                                height: 0,
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
            // Untere Reihe UI Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // UI Card Festivals
                  SizedBox(
                    height: (MediaQuery.of(context).size.width - 30) /
                        1.6, // Umgekehrte AspectRatio 1.6
                    width: (MediaQuery.of(context).size.width - 30) /
                        2, //Nimmt die Hälfte des Platzes im Vergleich zu der ersten UI Card ein
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          // Bild, durch Gradient verdunkelt
                          Container(
                            constraints: const BoxConstraints.expand(),
                            child: ShaderMask(
                              shaderCallback: (rect) => const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                ],
                              ).createShader(rect),
                              blendMode: BlendMode.darken,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/festivals.png") //Verwendetes Bild
                                  ),
                            ),
                          ),
                          // Text im Bild
                          Container(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                            child: const AutoSizeText(
                              'Finde Festivals in deiner Nähe',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // UI Card Geburtstage
                  SizedBox(
                    height: (MediaQuery.of(context).size.width - 30) /
                        1.6, // Umgekehrte AspectRatio 1.6
                    width: (MediaQuery.of(context).size.width - 30) /
                        2, //Nimmt die Hälfte des Platzes im Vergleich zu der ersten UI Card ein
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          // Bild, durch Gradient verdunkelt
                          Container(
                            constraints: const BoxConstraints.expand(),
                            child: ShaderMask(
                              shaderCallback: (rect) => const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                ],
                              ).createShader(rect),
                              blendMode: BlendMode.darken,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/geburtstag.png") //Verwendetes Bild
                                  ),
                            ),
                          ),
                          // Text im Bild
                          Container(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                            child: const AutoSizeText(
                              'Feier deinen Geburtstag!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
