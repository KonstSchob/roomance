import 'package:roomance/Funktionsbausteine/import.dart';


class WG {
  final String location;
  final int people;
  final int gender;
  String genderString;
  final int distance;
  final ImageProvider image;
  bool isMatch;

  WG({
    required this.location,
    required this.people,
    required this.gender,
    required this.distance, //Platzhalter, müsste über Standort laufen
    required this.image,
    this.isMatch = false,
   
  }) : genderString = (gender == 0) ? 'gemischt' : 
                   (gender == 1) ? 'nur männlich' :
                   (gender == 2) ? 'nur weiblich' : 
                   'unbekannt';
}


class WGDaten {
  //Speicherung der WGs
  final List<WG> wgliste = [
    WG(
      location: 'Möhringer Straße',
      people: 4,
      gender: 0,
      distance: 25,
      image: const AssetImage('assets/images/Möhringerstraße.png'),
      ),
    WG(
      location: 'Steinstraße',
      people: 2,
      gender: 2,
      distance: 2,
      image: const AssetImage("assets/images/Steinstraße.png"),
      ),
    WG(
      location: 'Donaustraße',
      people: 6,
      gender: 1,
      distance: 5,
      image: const AssetImage("assets/images/Donaustraße.png"),
      ),
    WG(
      location: 'Marktplatz',
      people: 3,
      gender: 99,
      distance: 2,
      image: const AssetImage("assets/images/Marktplatz.png"),
    ),
  ];
}
