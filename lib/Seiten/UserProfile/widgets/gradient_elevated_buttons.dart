import 'package:roomance/import.dart';

// --- Erzeugt einen ElevatedButton mit roomance Gradient als Hintergrund
class GradientElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const GradientElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44,
    this.gradient = const LinearGradient(
      colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(15);
    const roomanceGradient = LinearGradient(
      colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: const GradientBoxBorder(
          gradient: roomanceGradient,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(120, 221, 221, 221),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
