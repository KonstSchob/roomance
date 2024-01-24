import '../Funktionsbausteine/import.dart';

// --- Seite Matches ---
class Matches extends StatefulWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
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
        backgroundColor: Colors.white,
        extendBody: true,
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
                itemCount: matchliste.length,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 1.6,
                    child: Card(
                      surfaceTintColor: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      elevation: 10,
                      shadowColor: Colors.black,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            constraints: const BoxConstraints.expand(),
                            // Bild der WG, durch Gradient verdunkelt
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
                              child: Image(
                                fit: BoxFit.cover,
                                image: matchliste[index].image,
                              ),
                            ),
                          ),

                          // Beschreibung der WG
                          Container(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  matchliste[index].location,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 37,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                AutoSizeText(
                                  '${matchliste[index].people} Personen, ${matchliste[index].genderString}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                AutoSizeText(
                                  '${matchliste[index].distance} km entfernt',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
