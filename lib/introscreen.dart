import 'package:flutter/material.dart';

import 'import.dart';


//--------------------------------------Erster Screen INTRO---------------------------------------------//
class Startseite1 extends StatelessWidget

 {
  const Startseite1({super.key});

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