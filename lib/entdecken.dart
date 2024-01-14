import 'package:flutter/material.dart';
import 'import.dart';


//---------------------------------------------Screen Entdecken--------------------------------------------//

class EntdeckenScreen extends StatelessWidget 
{
  const EntdeckenScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack
      (
        children: 
        [
          // Hauptinhalt der Seite

                                   // Logo in Farbe oben links mit eigener Position --> Ebentuell dynamisch Erledigt .ML
          Positioned
          (
            top: 55,
            left: MediaQuery.of(context).size.width / 3 - 120 , 
            child: Image.asset
            (
              'assets/images/logo2.png',
              width: 45,
              height: 48,
            ),
          ),

          // Schriftzug "roomance" in der oberen linken Ecke
          Positioned
          (
            top: 55,
            left: MediaQuery.of(context).size.width / 3 - 74 ,
            child: Row
            (
              children:
               [
                ShaderMask
                (
                  shaderCallback: (Rect bounds) 
                  {
                    return const LinearGradient
                    (
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)], // Farbverlauf
                    ).createShader(bounds);
                  },
                  child: const Text
                  (
                    'roomance',
                    style: TextStyle
                    (
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





          // ---------------------------------- Inhalt
             Positioned
             (
                left: MediaQuery.of(context).size.width / 2 ,  // Ausrichtung Bild "STRAße"
                top: 447,
                child: Container
                (                  
                  width: 194,
                  height: 295,
                  decoration: ShapeDecoration
                  (
                    image: const DecorationImage
                    (
                      image: AssetImage("assets/images/bild3.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
              Positioned
              (
                left: MediaQuery.of(context).size.width / 3 -128,        // Ausrichtug Bild Party
                top: 447,
                child: Container
                (                        // Bild Lade ein
                  width: 194,
                  height: 295,
                  decoration: ShapeDecoration
                  (
                    image: const DecorationImage
                    (
                      image: AssetImage("assets/images/bild2.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(0), // Eckenrundung
                    ),
                  ),
                ),
              ),
              
              Positioned
              (
                left: MediaQuery.of(context).size.width / 3 -118,  // Dynamische Ausrichtung Schrift Bild "Party"
                top: 440,
                child: const SizedBox
                (
                  width: 246,
                  height: 270,
                  child: Stack
                  (
                    children:
                     [ Positioned(
                        left: 0,
                        top: 143,
                        child: SizedBox(
                          width: 241.04,
                          height: 100,
                          child: Text(
                            'Lade\nandere ein',    // Hier Umbruch mit \n
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

              const Positioned(   // Achtung hier werden Veranstalte, Unternehme etwas.. und Triff dich positioniert TODO Eventuell ändern
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
                          'Triff dich mit\nanderen Roomance Mates',
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
              Positioned(   //-------------------------------- Bild Du suchst nach einem Zimmer
                left: MediaQuery.of(context).size.width / 2 - 195,
                top: 127,
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
                            image: const DecorationImage(
                              image: AssetImage("assets/images/bild1.png"),
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
                              const Positioned(
                                left: 7,
                                top: 177,
                                child: SizedBox(
                                  width: 178,
                                  height: 36,
                                  child: Text(
                                    'Suche jetzt in deiner Stadt!',
                                    style: TextStyle(
                                      color: Color(0xFFAEAEAE),
                                      fontSize: 15,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w600,
                                   
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 6,
                                top: 105,
                                child: SizedBox(
                                  width: 234,
                                  height: 89,
                                  child: Text(
                                    'Du suchst nach\neinem Zimmer?',  
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 30,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w800,
                                     
                                    ),
                                  ),
                                ),
                              ),


                              Positioned(
                                left: MediaQuery.of(context).size.width - 130, // Position Suche
                                top: 195,
                                child: SizedBox(
                                  width: 72,
                                  height: 25,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container( // Hintergrund für Suche
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const Swipen()),
                                              );
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
                                                fontSize: 15,  // Vorher 18
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
          // ... Weitere Widgets oder Positioned-Elemente hier
        ],
      ),


                   // -----------------------------------NAVIGATIONSLEISTE----------------------------------------//
            bottomNavigationBar: SizedBox(
        height: 60,                                              // Größe
        child: BottomAppBar(
          color: Colors.white,                                 // Hintergrundfarbe
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIconButton(
                label: 'Matches',
                imagePath: 'assets/images/Matches.png',           // Button L
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Matches()),
                  );
                },
              ),
              buildIconButton(
                label: 'Entdecken',
                imagePath: 'assets/images/Entdecken.png',    // Button L1
                scale: 1,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EntdeckenScreen()), // TODO Eventuell Löschen bei jeweiligen Screen
                  );
                },
              ),
              buildIconButton(
                label: 'Logo3',
                imagePath: 'assets/images/logo3.png',    // Button M
                scale: 1.5,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Swipen()),
                  );
                },
              ),
              buildIconButton(
                label: 'Chat',
                imagePath: 'assets/images/Chat.png',    // Button R1
                scale: 1.2,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chat()),
                  );
                },
              ),
              buildIconButton(
                label: 'Profil',
                imagePath: 'assets/images/Profil.png',   // button R
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
                  );
                },
              ),
            ],
        )
        ),
      ),
    );
  }

  Widget buildIconButton({required String label, required String imagePath, double scale = 1.0, Function()? onPressed}) {
    return IconButton(
      onPressed: onPressed,   // Nötig für Verlinkung
      icon: Transform.scale(
        scale: scale,
        child: Image.asset(imagePath),
      ),
    );
  }
}