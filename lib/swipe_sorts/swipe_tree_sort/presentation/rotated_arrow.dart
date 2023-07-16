import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as v;

/// Arrow that rotated around its left edge.
class RotatedArrow extends StatelessWidget {
  final double angle;
  final Offset offset;
  final double length;
  final double width;

  const RotatedArrow({
    required this.angle,
    required this.offset,
    required this.length,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationZ(angle)
        ..setTranslation(
          v.Vector3(
            offset.dx,
            offset.dy,
            0,
          ),
        ),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: length,
            height: width,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
