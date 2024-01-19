import '../../Funktionsbausteine/import.dart';

class WGKarte extends StatelessWidget {
  final WG aktuelleWG;
  const WGKarte(this.aktuelleWG, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      // Inhalt auf Swipekarte
      child: Center(
        child: Stack(children: <Widget>[
          Image(
              image: aktuelleWG.image,
              height: double.infinity,
              fit: BoxFit.cover),
          Container(
            // Enthält Text auf dunklem Hintergrund
            alignment: Alignment.bottomLeft,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.5],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 105),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    aktuelleWG.location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 37,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${aktuelleWG.people} Personen, ${aktuelleWG.genderString}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${aktuelleWG.distance} km entfernt',
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
          ),
        ]),
      ),
    );
  }
}
