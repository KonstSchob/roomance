import '../import.dart';

// SEITE MATCHES --------------------------------------------------  TODO Scrollbar machen und dynamische Liste
class Matches extends StatelessWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
      //   AppBar(backgroundColor: Colors.white,
      // ),
      
      // Logo 
      Text('Fortnite'),      
      // Stack(
      //   children: [
      //     Positioned(
      //       top: 55,
      //       left: MediaQuery.of(context).size.width / 3 - 120,
      //       child: Image.asset(
      //         'assets/images/logo2.png',
      //         width: 45,
      //         height: 48,
      //       ),
      //     ),
      //     Positioned(
      //       top: 55,
      //       left: MediaQuery.of(context).size.width / 3 - 74,
      //       child: Row(
      //         children: [
      //           ShaderMask(
      //             shaderCallback: (Rect bounds) {
      //               return const LinearGradient(
      //                 begin: Alignment.topCenter,
      //                 end: Alignment.bottomCenter,
      //                 colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
      //               ).createShader(bounds);
      //             },
      //             child: const Text(
      //               'roomance',
      //               style: TextStyle(
      //                 fontSize: 48,
      //                 fontFamily: 'Gudea',
      //                 fontWeight: FontWeight.w400,
      //                 letterSpacing: -4,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      
      const Matchliste(), 
            
          // Positioned( // Match 2
          //   left: MediaQuery.of(context).size.width / 2 - 195,
          //   top: 470,
          //   child: SizedBox(
          //     width: 390,
          //     height: 250,
          //     child: Stack(
          //       children: [
          //         Positioned(
          //           left: 0,
          //           top: 0,
          //           child: Container(
          //             width: 390,
          //             height: 250,
          //             decoration: ShapeDecoration(
          //               image: const DecorationImage(
          //                 image: AssetImage("assets/images/Donaustraße.png"),
          //                 fit: BoxFit.fill,
          //               ),
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(15),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Positioned(
          //           left: 5,
          //           top: 0,
          //           child: SizedBox(
          //             width: 357,
          //             height: 223,
          //             child: Stack(
          //               children: [
          //                 const Positioned(
          //                   left: 7,
          //                   top: 177,
          //                   child: SizedBox(
          //                     width: 178,
          //                     height: 36,
          //                     child: Text(
          //                       '2 Personen gemischt\n2 km entfernt',
          //                       style: TextStyle(
          //                         color: Color(0xFFAEAEAE),
          //                         fontSize: 15,
          //                         fontFamily: 'Mulish',
          //                         fontWeight: FontWeight.w600,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 const Positioned(
          //                   left: 6,
          //                   top: 105,
          //                   child: SizedBox(
          //                     width: 234,
          //                     height: 89,
          //                     child: Text(
          //                       'Donaustraße',
          //                       style: TextStyle(
          //                         color: Color.fromARGB(255, 255, 255, 255),
          //                         fontSize: 30,
          //                         fontFamily: 'Mulish',
          //                         fontWeight: FontWeight.w800,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 Positioned(
          //                   left: MediaQuery.of(context).size.width - 130,
          //                   top: 195,
          //                   child: SizedBox(
          //                     width: 72,
          //                     height: 25,
          //                     child: Stack(
          //                       children: [
          //                         Positioned(
          //                           left: 0,
          //                           top: 0,
          //                           child: Container(
          //                             width: 72,
          //                             height: 25,
          //                             decoration: ShapeDecoration(
          //                               color: const Color(0xFFFCFCFC),
          //                               shape: RoundedRectangleBorder(
          //                                 borderRadius:
          //                                     BorderRadius.circular(15),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         Positioned(
          //                           left: 2,
          //                           top: -6,
          //                           child: ElevatedButton(
          //                             onPressed: () {
          //                               Navigator.push(
          //                                 context,
          //                                 MaterialPageRoute(
          //                                     builder: (context) =>
          //                                         const Chat()),
          //                               );
          //                             },
          //                             style: ElevatedButton.styleFrom(
          //                               backgroundColor: Colors.transparent,
          //                               elevation: 0,
          //                               shape: RoundedRectangleBorder(
          //                                 borderRadius:
          //                                     BorderRadius.circular(15),
          //                               ),
          //                             ),
          //                             child: const Text(
          //                               'Chat',
          //                               textAlign: TextAlign.center,
          //                               style: TextStyle(
          //                                 color: Colors.black,
          //                                 fontSize: 15,
          //                                 fontFamily: 'Mulish',
          //                                 fontWeight: FontWeight.w700,
          //                                 height: 0.06,
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
            
          // Match 3
          // Positioned(
          //   left: MediaQuery.of(context).size.width / 2 - 195,
          //   top: 740,
          //   child: SizedBox(
          //     width: 390,
          //     height: 250,
          //     child: Stack(
          //       children: [
          //         Positioned(
          //           left: 0,
          //           top: 0,
          //           child: Container(
          //             width: 390,
          //             height: 250,
          //             decoration: ShapeDecoration(
          //               image: const DecorationImage(
          //                 image: AssetImage("assets/images/Steinstraße.png"),
          //                 fit: BoxFit.fill,
          //               ),
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(15),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Positioned(
          //           left: 5,
          //           top: 0,
          //           child: SizedBox(
          //             width: 357,
          //             height: 223,
          //             child: Stack(
          //               children: [
          //                 const Positioned(
          //                   left: 7,
          //                   top: 177,
          //                   child: SizedBox(
          //                     width: 178,
          //                     height: 36,
          //                     child: Text(
          //                       '4 Personen gemischt weiblich\n5 km entfernt',
          //                       style: TextStyle(
          //                         color: Color(0xFFAEAEAE),
          //                         fontSize: 15,
          //                         fontFamily: 'Mulish',
          //                         fontWeight: FontWeight.w600,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 const Positioned(
          //                   left: 6,
          //                   top: 105,
          //                   child: SizedBox(
          //                     width: 234,
          //                     height: 89,
          //                     child: Text(
          //                       'Burgstraße',
          //                       style: TextStyle(
          //                         color: Color.fromARGB(255, 255, 255, 255),
          //                         fontSize: 30,
          //                         fontFamily: 'Mulish',
          //                         fontWeight: FontWeight.w800,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 Positioned(
          //                   left: MediaQuery.of(context).size.width - 130,
          //                   top: 195,
          //                   child: SizedBox(
          //                     width: 72,
          //                     height: 25,
          //                     child: Stack(
          //                       children: [
          //                         Positioned(
          //                           left: 0,
          //                           top: 0,
          //                           child: Container(
          //                             width: 72,
          //                             height: 25,
          //                             decoration: ShapeDecoration(
          //                               color: const Color(0xFFFCFCFC),
          //                               shape: RoundedRectangleBorder(
          //                                 borderRadius:
          //                                     BorderRadius.circular(15),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         Positioned(
          //                           left: 2,
          //                           top: -6,
          //                           child: ElevatedButton(
          //                             onPressed: () {
          //                               Navigator.push(
          //                                 context,
          //                                 MaterialPageRoute(
          //                                     builder: (context) =>
          //                                         const Chat()),
          //                               );
          //                             },
          //                             style: ElevatedButton.styleFrom(
          //                               backgroundColor: Colors.transparent,
          //                               elevation: 0,
          //                               shape: RoundedRectangleBorder(
          //                                 borderRadius:
          //                                     BorderRadius.circular(15),
          //                               ),
          //                             ),
          //                             child: const Text(
          //                               'Chat',
          //                               textAlign: TextAlign.center,
          //                               style: TextStyle(
          //                                 color: Colors.black,
          //                                 fontSize: 15,
          //                                 fontFamily: 'Mulish',
          //                                 fontWeight: FontWeight.w700,
          //                                 height: 0.06,
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
      onPressed: onPressed,
      icon: Transform.scale(
        scale: scale,
        child: Image.asset(imagePath),
      ),
    );
  }
}

class Matchliste extends StatefulWidget{

  const Matchliste({super.key});

  @override
  State<Matchliste> createState() => _MatchlisteState();
}

class _MatchlisteState extends State<Matchliste> {
  List<WG> wgliste = [];
  List<WG> matchliste = [];

  @override
  Widget build (BuildContext context) {
  return Scaffold(
    body: matchliste.isEmpty ? const Center(
      child: Text(
        'There are no favorites yet!',
        style: TextStyle(color: Colors.black),
      ),
    )
    : ListView.builder(
        padding: null, //TODO implement padding/formatting
        itemCount: matchliste.length,
        itemBuilder: (context, index) {
          return Row(
            children: [Text('TEST TEST TEST TEST\nTESTESTESTSETSFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'),
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 195,
                top: 200,
                child: SizedBox(
                  width: 390,
                  height: 250,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 390,
                          height: 250,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: matchliste[index].image, //Verwendetes Bild
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        top: 0,
                        child: SizedBox(
                          width: 357,
                          height: 223,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 7,
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
                                left: 6,
                                top: 105,
                                child: SizedBox(
                                  width: 234,
                                  height: 89,
                                  child: Text(
                                    matchliste[index].location,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 30,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
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
                                            backgroundColor: Colors.transparent,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },



          // return Card(
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.all(20.0),
          //           child: Text(
          //             matchliste[index].location,
          //             style: const TextStyle(fontSize: 19.0),
          //           ),
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           setState(() {
          //             matchliste.remove(matchliste[index]);
          //           });
          //         },
          //         style: ButtonStyle(
          //           backgroundColor:
          //               MaterialStateProperty.all<Color>(
          //             Colors.deepPurple,
          //           ),
          //         ),
          //         child: const Icon(
          //           Icons.remove,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ],
          //   ),
          // );
          
      ),);
  }
}