import 'package:roomance/import.dart';

class WG {
  final String location;
  final int people;
  final int gender;
  String genderString;
  final int distance;
  final ImageProvider image;

  WG({
    required this.location,
    required this.people,
    required this.gender,
    required this.distance, //Platzhalter, müsste über Standort laufen
    required this.image,
   
  }) : genderString = (gender == 0) ? 'gemischt' : 
                   (gender == 1) ? 'nur männlich' :
                   (gender == 2) ? 'nur weiblich' : 
                   'unbekannt';
    
  
}
