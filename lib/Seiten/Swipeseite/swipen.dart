import '../../Funktionsbausteine/import.dart';

//Usage:
/*
SwipeCards(
            matchEngine: <MatchEngine>,f
            itemBuilder: (BuildContext context, int index) {},
            onStackFinished: () {},
            itemChanged: (SwipeItem item, int index) {},
            upSwipeAllowed: <bool>,
            fillSpace: <bool>,
);
*/

class Swipen extends StatefulWidget {
  const Swipen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<Swipen> createState() => _SwipenState();
}

class _SwipenState extends State<Swipen> {
  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<WG> wgliste = WGDaten().wgliste;

  // Popup von icon, nachdem geswiped wurde
  void _showIconOverlay(String imagePath,
      {bool isNope = false, bool isLike = false}) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        top: 300,
        left: isNope ? 50 : null, // Set left for Nope
        right: isLike ? 50 : null, // Set right for Like
        child: Material(
          color: Colors.transparent,
          child: Container(
            child: Transform.rotate(
              angle: isNope ? 0.87 : (isLike ? -0.87 : 0.0),
              child: Image.asset(imagePath, width: 100, height: 50),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context)!.insert(overlayEntry);

    // Entfernt das Overlay nach kurzer Zeit
    Future.delayed(const Duration(milliseconds: 800), () {
      overlayEntry.remove();
    });
  }

  // Verarbeitet das Swipen und Wechseln der WGKarten
  @override
  void initState() {
    for (int i = 0; i < wgliste.length; i++) {
      swipeItems.add(SwipeItem(
          content: wgliste[i], //aktuell angezeigte WG

          //TODO WGs zu matches hinzufügen
          likeAction: () {
            _showIconOverlay('assets/images/swipe_like.png', isLike: true);
          },
          nopeAction: () {
            _showIconOverlay('assets/images/swipe_nope.png', isNope: true);
          },
          superlikeAction: () {
            // Keine weiteren Bestätigungen oder Animationen implementiert
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,),
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
        body: Stack(children: [
          SwipeCards(
            matchEngine: _matchEngine!,
            itemBuilder: (BuildContext context, int index) {
              return WGKarte(wgliste[
                  index]); //Übergabe an Klasse für Erstellung der Karten
            },
            onStackFinished: () {
              //TODO Nachricht komm später wieder
              // late OverlayEntry overlayEntry;
              // overlayEntry = OverlayEntry(
              //   builder: (BuildContext context) => Positioned.fill(
              //     top: 200,
              //     // Use the specified alignment for positioning
              //     child: Material(
              //       color: Colors.transparent,
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Container( // Enthält Text mit grauer Hinterlegung
              //             width: 350,
              //             height: 40,
              //             decoration: BoxDecoration(
              //               color: const Color.fromARGB(120, 221, 221, 221),
              //               borderRadius: BorderRadius.circular(15),
              //             ),
              //             child: const Text(
              //               "Es sind momentan keine weiteren WGs verfügbar.",
              //               textAlign: TextAlign.center,
              //               style: TextStyle(color: Colors.black),
              //             ),
              //           ),
              //           GradientElevatedButton(
              //             onPressed: () {
              //               initState();
              //               overlayEntry.remove();
              //             },
              //             child: const Text(
              //               'Erneut beginnen',
              //               textAlign: TextAlign.center,
              //               style:
              //                   TextStyle(fontSize: 15, color: Colors.black),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // );
              // Overlay.of(context)!.insert(overlayEntry);
            },

            itemChanged: (SwipeItem item, int index) {
              print("item: ${item.content.location}, index: $index");
            },
            leftSwipeAllowed: true,
            rightSwipeAllowed: true,
            upSwipeAllowed: false, //Kein Superlike in roomance
            fillSpace: true,
            likeTag: Image.asset('assets/images/swipe_like.png',
                width: 100, height: 50),
            nopeTag: Image.asset('assets/images/swipe_nope.png',
                width: 100, height: 50),
          ),
          // Untere Buttons ausrichten
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Swipebuttons(
                  _matchEngine), // Übergabe an Klasse für die Buttons
            ),
          )
        ]));
  }
}
