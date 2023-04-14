import 'package:flutter/material.dart';

class DotIndicator extends Decoration {
  const DotIndicator();

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return const DotIndicatorPainter();
  }
}

class DotIndicatorPainter extends BoxPainter {
  const DotIndicatorPainter();

  static const radius = 8.0;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final dx = configuration.size!.width / 2;
    final dy = configuration.size!.height + radius / 2;
    final c = offset + Offset(dx, dy);

    final paint = Paint()..color = Colors.blue[400]!;

    canvas.drawCircle(c, radius, paint);
  }
}
