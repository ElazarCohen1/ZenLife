import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Couleurs principales avec opacité intégrée (format ARGB)
    final colors = [
      const Color(0x4D3F51B5), // Indigo 30%
      const Color(0x407D26C0), // Purple 25%
      const Color(0x3348A0FF), // BlueAccent 20%
      const Color(0x2618FFFF), // TealAccent 15%
    ];

    // Grandes formes symétriques
    final mainShape =
        Path()
          ..moveTo(0, size.height * 0.3)
          ..quadraticBezierTo(
            size.width * 0.25,
            size.height * 0.2,
            size.width * 0.5,
            size.height * 0.3,
          )
          ..quadraticBezierTo(
            size.width * 0.75,
            size.height * 0.4,
            size.width,
            size.height * 0.3,
          )
          ..lineTo(size.width, size.height * 0.7)
          ..quadraticBezierTo(
            size.width * 0.75,
            size.height * 0.8,
            size.width * 0.5,
            size.height * 0.7,
          )
          ..quadraticBezierTo(
            size.width * 0.25,
            size.height * 0.6,
            0,
            size.height * 0.7,
          )
          ..close();

    final gradient =
        Paint()
          ..shader = LinearGradient(
            colors: colors,
            stops: const [0.0, 0.3, 0.7, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Formes secondaires pour plus de profondeur
    final secondaryShape =
        Path()
          ..moveTo(size.width * 0.1, size.height * 0.1)
          ..quadraticBezierTo(
            size.width * 0.3,
            size.height * 0.15,
            size.width * 0.1,
            size.height * 0.25,
          )
          ..quadraticBezierTo(
            size.width * -0.1,
            size.height * 0.2,
            size.width * 0.1,
            size.height * 0.1,
          );

    final secondaryGradient =
        Paint()
          ..shader = RadialGradient(
            colors: const [Color(0x19FFFFFF), Colors.transparent],
            radius: 0.8,
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.2, size.height * 0.2),
              radius: size.width * 0.2,
            ),
          );

    // Dessin des éléments
    canvas.drawPath(mainShape, gradient);
    canvas.drawPath(secondaryShape, secondaryGradient);

    // Ajout de bulles symétriques
    final bubblePaint = Paint()..color = const Color(0x14FFFFFF); // Blanc 8%

    // Bulles positionnées symétriquement
    final positions = [
      Offset(size.width * 0.2, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.3),
      Offset(size.width * 0.3, size.height * 0.7),
      Offset(size.width * 0.7, size.height * 0.7),
      Offset(size.width * 0.5, size.height * 0.2),
      Offset(size.width * 0.5, size.height * 0.8),
    ];

    for (final position in positions) {
      canvas.drawCircle(position, size.width * 0.05, bubblePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
