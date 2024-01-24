import 'package:roomance/Funktionsbausteine/import.dart';

class Swipebuttons extends StatelessWidget {
  final MatchEngine? _matchEngine;
  const Swipebuttons(this._matchEngine, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            _matchEngine!.currentItem?.nope(); //Führt Nope Geste aus
          },
          icon: Container(
            width: 75,
            height: 75,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/swipe_nopeicon.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO Nicht implementiert: Zurück Geste ausführen
          },
          icon: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/swipe_backicon.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            _matchEngine!.currentItem?.like(); //Führt Like Geste aus
          },
          icon: Container(
            width: 75,
            height: 75,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/swipe_likeicon.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}