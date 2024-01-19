import '../Funktionsbausteine/import.dart';

// SEITE MATCHES --------------------------------------------------  TODO Scrollbar machen und dynamische Liste
class Matches extends StatefulWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
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
      body: Matchliste(),
    );
  }
}

class Matchliste extends StatefulWidget {
  final List<WG> wgliste = WGDaten().wgliste;
  Matchliste({super.key});

  @override
  State<Matchliste> createState() => _MatchlisteState();
}

class _MatchlisteState extends State<Matchliste> {
  late List<WG> matchliste;

  @override
  void initState() {
    super.initState();
    matchliste = widget.wgliste;
    // TODO Nicht implementiert: Matchliste füllen mit den WGs, bei denen nach rechts geswiped bzw. geliked wurde
    // matchliste = widget.wgliste.where((item) => item.isMatch == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true, // TODO Braucht man das?
        body: matchliste.isEmpty
            ? const Center(
                child: Text(
                  'Du hast noch keine Matches!\nBeginne jetzt zu swipen!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(
                    top: 15), //TODO implement padding/formatting
                itemCount: matchliste.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            //Bild der Wohnung
                            width: 390,
                            height: 250,
                            alignment: Alignment.topCenter,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image:
                                    matchliste[index].image, //Verwendetes Bild
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 357,
                            height: 222,
                            child: Stack(
                              children: [
                                Positioned(
                                  // Name bzw. Straße der Wohnung
                                  left: 15,
                                  top: 30,
                                  child: SizedBox(
                                    height: 89,
                                    child: Text(
                                      matchliste[index].location,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 30,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  //Beschreibung der Wohnung
                                  left: 15,
                                  top: 177,
                                  child: SizedBox(
                                    width: 178,
                                    height: 36,
                                    child: Text(
                                      '${matchliste[index].people} Personen, ${matchliste[index].genderString}\n${matchliste[index].distance} km entfernt',
                                      style: const TextStyle(
                                        color: Color(0xFFAEAEAE),
                                        fontSize: 15,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  //Knopf Chat
                                  left: MediaQuery.of(context).size.width - 130,
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
                                            width: 72,
                                            height: 25,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFFFCFCFC),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 2,
                                          top: -6,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Chat()),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            child: const Text(
                                              'Chat',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      // ),
                    ],
                  );
                }));
  }
}
