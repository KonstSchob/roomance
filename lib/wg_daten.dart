import 'package:roomance/import.dart';

class WGDaten {
  //Speicherung der WGs
  final List<WG> wgliste = [
    WG(
      location: 'Möhringer Straße',
      people: 4,
      gender: 0,
      distance: 25,
      image: const AssetImage('Möhringer.png'),
      ),
    WG(
      location: 'Steinstraße',
      people: 2,
      gender: 2,
      distance: 2,
      image: const AssetImage("Steinstraße.png"),
      ),
    WG(
      location: 'Donaustraße',
      people: 6,
      gender: 1,
      distance: 5,
      image: const AssetImage("Donaustraße.png"),
      ),
  ];
}
