import 'package:flutter/material.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';

class CustomRoundShape extends StatelessWidget {
  const CustomRoundShape({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: CustomPaint(
        painter: CustomRoundShapePainter(),
      ),
    );
  }
}

class CustomRoundShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.bgColor;
    Path path = Path()
      ..lineTo(0.0, size.height)
      ..quadraticBezierTo(4.0, size.height * .01, 48.0, 0.0)
      ..lineTo(size.width - 48.0, 0.0)
      ..quadraticBezierTo(
          size.width - 4.0, size.height * .01, size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..close();

    return canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
