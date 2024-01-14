import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Notwendig für Portrait Modus
import 'draggable_card';
import 'dart:async';


// Noch alles in einem Code ca. ~1.800 Zeilen momentan
// Navigationsleiste wird noch ausgegliedert, Code vereinfacht
// Darstellung wird Dynamisch ausgerichtet, damit diese auf jedem Gerät funktioniert
// Spezielle Funktionen: Swipe Funktion, Chat Funktion (Maps Implementierung in Sucheinstellungen geplant)
// Portrait Modus festgelegt
// 4 Seiten fertig/ 2 in Arbeit/ 2 Seiten stehen noch aus 
// Probleme: Scrollbarer Screen, Button implementierung in Swipe Funktionen, 



// -------------------------------MAIN



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]) // Wichtig für Portrait
      .then((_) {
    runApp(const Roomance1());
  });
}

class Roomance1 extends StatelessWidget {
  const Roomance1({Key? key});

  @override
  Widget build(BuildContext context) {
    // App-Konfiguration
    return const MaterialApp(
      
      home: Scaffold(body: Start1()),
    );
  }
}








//--------------------------------------Erster Screen INTRO---------------------------------------------//
class Start1 extends StatelessWidget

 {
  const Start1({super.key});

  @override
  Widget build(BuildContext context)
  
   {
    // Funktion für die Verzögerung und Navigation zur nächsten Seite --> 3 Sekunden
    // ignore: no_leading_underscores_for_local_identifiers
    void _navigateToNextPage()
    
     {
      Future.delayed(const Duration(seconds: 3), ()    // Sekunden für Verzögerung von S. 1 zu 2 werden hier festgelegt
      
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SecondScreen()), // Nächstes Fenster wir hier festgelegt
        );
      });
    }

    // Start der Verzögerung und Navigation beim Aufbau des Widgets
    _navigateToNextPage();

    
    return Column
    (
      children:
       [
        Container
        (
          // Container für das Hintergrunddesign
          width: MediaQuery.of(context).size.width,   // Passt sich dynamisch an Größe SP an
          height: MediaQuery.of(context).size.height,
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration
          (
            gradient: LinearGradient
            (
              begin: Alignment(0.00, -1.00),  // Werte für Farbverlauf
              end: Alignment(0, 1),
              colors:
              [Color(0xFFF24C3D), Color(0xFFFECB2D)], // Farbverlauf
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          child: Stack
          (
            children:
             [
              // Positioniertes Logo
              Positioned
              (
                 left: MediaQuery.of(context).size.width / 2 - 41.75, // Dynamische Positionierung Mittig Teilen durch halbe Breite Container
                
                top: 344,
                child: Container
                (
                  width: 83.50,   // Wichtiger Wert für MediaQuery
                  height: 98,
                  decoration: const BoxDecoration
                  (
                    image: DecorationImage
                    (
                      image: AssetImage("assets/images/logo1.png"),   // LOGo in der Mitte
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
                                        // Positionierter Schriftzug
              const Positioned
              (
                left: 115,  
                top: 434,
                child: Text
                (
                  'roomance',    // Schriftzug Mitte unter Logo
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 48,
                    fontFamily: 'Gudea',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -4,   //---------- Evtl an andere Logos anpassen-----> ERLEDIGT .ML
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//--------------------------------- Start Seite 2 mit Anmeldung --------------------------------//

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,  // Dynamische Anpassung an bildschirm
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),   // Farbverlauf
            end: Alignment(0, 1),
            colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
          ),
          shape: RoundedRectangleBorder(),
        ),

        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 152, // Dyn. Ausrichtung Anmeldung
              top: 690,
              child: SizedBox(
                width: 304,
                height: 53,
                child: ElevatedButton(
                  onPressed: () {
                                  // Button Funktion zur nächsten Seite
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EntdeckenScreen()),  // LOG IN zur nächsten Seite
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
                        "assets/images/google.png",   // Google LOGO
                        width: 33,
                        height: 33,
                      ),
                      const SizedBox(width: 8), // Abstand Logo Text
                      const Text(
                        'LOG IN WITH GOOGLE',   // ---- Kursive Schrift
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
              left: MediaQuery.of(context).size.width / 2 - 56, // Ermöglicht die dynamische Positionierung in der Mitte
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
              left: MediaQuery.of(context).size.width / 2 - 161.5, // Dynamische Positionierung
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
              left: MediaQuery.of(context).size.width / 2 - 112.5, // Dynamische Anpassung an Bildschirm
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
                          image: AssetImage("assets/images/logo1.png"),
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



// SEITE MATCHES ----------------------------------------------------IN ARBEIT .ML
class Matches extends StatelessWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack(
        children: [
          Positioned(
            top: 55,
            left: MediaQuery.of(context).size.width / 3 - 120,
            child: Image.asset(
              'assets/images/logo2.png',
              width: 45,
              height: 48,
            ),
          ),
          Positioned(
            top: 55,
            left: MediaQuery.of(context).size.width / 3 - 74,
            child: Row(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
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
              ],
            ),
          ),

                    // Match 1
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
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Möhringer.png"),
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
                                '4 Personen gemischt\n5 km entfernt',
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
                                'Möhringer Straße',
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
                                          borderRadius: BorderRadius.circular(15),
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
                                          MaterialPageRoute(builder: (context) => const Chat()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
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
                    // Match 2
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 195,
            top: 470,
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
                          image: AssetImage("assets/images/Donaustraße.png"),
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
                                '2 Personen gemischt\n2 km entfernt',
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
                                'Donaustraße',
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
                                          borderRadius: BorderRadius.circular(15),
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
                                          MaterialPageRoute(builder: (context) => const Chat()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
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
                     // Match 3
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 195,
            top: 740,
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
                          image: AssetImage("assets/images/Steinstraße.png"),
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
                                '4 Personen gemischt weiblich\n5 km entfernt',
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
                                'Burgstraße',
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
                                          borderRadius: BorderRadius.circular(15),
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
                                          MaterialPageRoute(builder: (context) => const Chat()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
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
      ),
       // Navigationsbar
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIconButton(
                label: 'Matches',
                imagePath: 'assets/images/Matches.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Matches()),
                  );
                },
              ),
              buildIconButton(
                label: 'Entdecken',
                imagePath: 'assets/images/Entdecken.png',
                scale: 1,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
                  );
                },
              ),
              buildIconButton(
                label: 'Logo3',
                imagePath: 'assets/images/logo3.png',
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
                imagePath: 'assets/images/Chat.png',
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
                imagePath: 'assets/images/Profil.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconButton(
      {required String label, required String imagePath, double scale = 1.0, Function()? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Transform.scale(
        scale: scale,
        child: Image.asset(imagePath),
      ),
    );
  }
}



// -----------------------------------------------SEITE CHAT-----------------------------------------//



class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack(
        children: [
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


          // ------------------------------ bis hier gewohnter Hintergrund

          // ----------------------------Texteingabefeld mit TextField
          Positioned(
            bottom: 80,
            left: 16,
            right: 16,
            child: Container(
              width: 333,
              height: 56,
              padding: const EdgeInsets.only(left: 22),
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x7F000000),
                    blurRadius: 20,
                    offset: Offset(5, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black, // Textfarbe im TextField
                      ),
                      decoration: InputDecoration(
                        hintText: 'Schreibe eine Nachricht', // Inhalt Textfenster
                        hintStyle: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontSize: 13,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/images/send.png'), // Logo rechts im Schriftfeld-> Papierflieger
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 24,
                    height: 24,
                   
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //----------------------------------- NAVIGATIONSLEISTE----------------------------------//
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          color: Colors.white,
          elevation: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIconButton(
                label: 'Matches',
                imagePath: 'assets/images/Matches.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Matches()),
                  );
                },
              ),
              buildIconButton(
                label: 'Entdecken',
                imagePath: 'assets/images/Entdecken.png',
                scale: 1,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
                  );
                },
              ),
              buildIconButton(
                label: 'Logo3',
                imagePath: 'assets/images/logo3.png',
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
                imagePath: 'assets/images/Chat.png',
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
                imagePath: 'assets/images/Profil.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconButton({required String label, required String imagePath, double scale = 1.0, Function()? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Transform.scale(
        scale: scale,
        child: Image.asset(imagePath),
      ),
    );
  }
}






class Swipen extends StatelessWidget {
  const Swipen({super.key});
//------------------------------------------Swipefunktion (IMPORTIERT) Zusammen mit Pubspec----------------------------//
  @override
  Widget build(BuildContext context) {
    String rightSwipeImagePath = 'assets/images/roomlike.png';  // Seiten, welche angezeigt werden
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
          const Positioned(  //------------------ Inhalt auf Swipekarte-------------------//
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
          Positioned(  // ICONS unten 
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



      //---------------------------------------- NAVIGATIONSLEISTE-----------------------------------------//
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          color: Colors.white,
          elevation: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIconButton(
                imagePath: 'assets/images/Matches.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Matches()),
                  );
                },
              ),
              buildIconButton(
                imagePath: 'assets/images/Entdecken.png',
                scale: 1,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
                  );
                },
              ),
              buildIconButton(
                imagePath: 'assets/images/logo3.png',
                scale: 1.5,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Swipen()),
                  );
                },
              ),
              buildIconButton(
                imagePath: 'assets/images/Chat.png',
                scale: 1.2,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chat()),
                  );
                },
              ),
              buildIconButton(
                imagePath: 'assets/images/Profil.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }




//--------------------------------------------------Swipe Widget----------------------------------------------------------------------------------
  Widget buildIconButton({required String imagePath, double scale = 1.0, Function()? onPressed, Function()? onSwipe}) {
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

  void loadNewImage(String imagePath, BuildContext context, String originalImagePath) {
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
    Future.delayed(const Duration(seconds: 1), () {   // Verzögerung von 1 Sekunde, dann nächster Screen
      Navigator.of(context).pop();                    // Hier später aus Datenbank weitere Anzeigen
      
    });
  }
}
//-----------------------------------------Swipe ENDE----------------------------------------------------------//


// TODO Navigationsleiste extrahieren und nur 1x als Code UND Markierung der jeweiligen Seite

// TODO Seiten: Einstellungen/ Matches / Profil

// TODO Mehr dynamische Positionierungen -> Erledigt .ML
