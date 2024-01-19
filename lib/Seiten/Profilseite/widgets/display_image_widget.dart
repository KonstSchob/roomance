import 'package:roomance/Funktionsbausteine/import.dart';

// Modifizierte DisplayImage Klasse, um gradient und lokale Bilder zu verwenden

class DisplayImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const DisplayImage({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const roomanceGradient = LinearGradient(
      colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Center(
        child: Stack(children: [
      buildImage(roomanceGradient),
      Positioned(
        right: 4,
        top: 10,
        child: buildEditIcon(roomanceGradient),
      )
    ]));
  }

  //Bild mit eigenem Rahmen in roomance Farben
  Widget buildImage(LinearGradient rahmenColor) {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: GradientBoxBorder(
          gradient: rahmenColor,
          width: 5,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: image as ImageProvider,
        radius: 90,
      ),
    );
  }

  // Erzeugt den Kreis für den Edit-Button beim Profilbild
  Widget buildEditIcon(LinearGradient rahmenColor) => buildCircle(
      all: 8,
      gradient: rahmenColor,
      child: const Icon(
        Icons.edit,
        color: Colors.black,
        size: 20,
      ));

  Widget buildCircle({
    required Widget child,
    required double all,
    required LinearGradient gradient,
  }) =>
      // Verwendet eigenen gradient
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradient,
          border: GradientBoxBorder(
            gradient: gradient,
            width: 3,
          ),
        ),
        child: ClipOval(
            child: Container(
          padding: EdgeInsets.all(all),
          color: Colors.white,
          child: child,
        )),
      );
}
