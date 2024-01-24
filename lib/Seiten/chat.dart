import 'package:flutter/material.dart';
import '../Funktionsbausteine/import.dart';

// --- Seite Chat ---

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0, bottom: 10,
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
      body: Stack(
        children: [
          // Texteingabefeld mit TextField
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
                        hintText:
                            'Schreibe eine Nachricht', // Inhalt Textfenster
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
                    child: Image.asset(
                        'assets/images/send.png'), // Logo rechts im Schriftfeld-> Papierflieger
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
