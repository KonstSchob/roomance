import '../../import.dart';

class Swipen extends StatelessWidget {
  const Swipen({super.key});
//------------------------------------------Swipefunktion (IMPORTIERT) Zusammen mit Pubspec----------------------------//
  @override
  Widget build(BuildContext context) {
    String rightSwipeImagePath =
        'assets/images/roomlike.png'; // Seiten, welche angezeigt werden
    String leftSwipeImagePath = 'assets/images/roomnope.png';
    String originalImagePath = 'assets/room.png';

    return Scaffold(
      body: Stack(
        children: [
          DraggableCard(
            card: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(
                child: Image.asset(
                  originalImagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onSlideUpdate: (distance) {
              // Handle slide update
            },
            onSlideOutComplete: (direction) {
              // Handle slide out complete
              if (direction == SlideDirection.right) {
                // User swiped to the right
                // Load the right swipe image
                print('Swiped to the right');
                loadNewImage(rightSwipeImagePath, context, originalImagePath);
              } else if (direction == SlideDirection.left) {
                // User swiped to the left
                // Load the left swipe image
                print('Swiped to the left');
                loadNewImage(leftSwipeImagePath, context, originalImagePath);
              }
            },
          ),
          const Positioned(
            //------------------ Inhalt auf Swipekarte-------------------//
            left: 20.0,
            bottom: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    'Möhringer Straße',
                    style: TextStyle(
                      color: Color(0xFFFCFCFC),
                      fontSize: 37,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 241,
                  height: 27,
                  child: Text(
                    '4 Personen gemischt',
                    style: TextStyle(
                      color: Color(0xFFFCFCFC),
                      fontSize: 18,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 315,
                  height: 27,
                  child: Text(
                    '5 km entfernt',
                    style: TextStyle(
                      color: Color(0xFFFCFCFC),
                      fontSize: 18,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            // ICONS unten
            bottom: 20.0,
            left: MediaQuery.of(context).size.width / 2 - 170,
            child: Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/nopeicon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/back.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: MediaQuery.of(context).size.width / 2 + 95,
            child: Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/likeicon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),

      // //---------------------------------------- NAVIGATIONSLEISTE-----------------------------------------//
      // bottomNavigationBar: SizedBox(
      //   height: 60,
      //   child: BottomAppBar(
      //     color: Colors.white,
      //     elevation: 8,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         buildIconButton(
      //           imagePath: 'assets/images/Matches.png',
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const Matches()),
      //             );
      //           },
      //         ),
      //         buildIconButton(
      //           imagePath: 'assets/images/Entdecken.png',
      //           scale: 1,
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
      //             );
      //           },
      //         ),
      //         buildIconButton(
      //           imagePath: 'assets/images/logo3.png',
      //           scale: 1.5,
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const Swipen()),
      //             );
      //           },
      //         ),
      //         buildIconButton(
      //           imagePath: 'assets/images/Chat.png',
      //           scale: 1.2,
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const Chat()),
      //             );
      //           },
      //         ),
      //         buildIconButton(
      //           imagePath: 'assets/images/Profil.png',
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

//--------------------------------------------------Swipe Widget----------------------------------------------------------------------------------
  Widget buildIconButton(
      {required String imagePath,
      double scale = 1.0,
      Function()? onPressed,
      Function()? onSwipe}) {
    return IconButton(
      onPressed: () {
        if (onSwipe != null) {
          onSwipe();
        }
        if (onPressed != null) {
          onPressed();
        }
      },
      icon: Transform.scale(
        scale: scale,
        child: Image.asset(imagePath),
      ),
    );
  }

  void loadNewImage(
      String imagePath, BuildContext context, String originalImagePath) {
    // Implement logic to load and display the new image in the corresponding area
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );

    // Delay for 1 second and then close the dialog and revert to the original image
    Future.delayed(const Duration(seconds: 1), () {
      // Verzögerung von 1 Sekunde, dann nächster Screen
      Navigator.of(context).pop(); // Hier später aus Datenbank weitere Anzeigen
    });
  }
}
