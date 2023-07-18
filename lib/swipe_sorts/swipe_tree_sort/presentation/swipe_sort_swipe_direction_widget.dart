import 'dart:math';

import 'package:flutter/material.dart';

class SwipeSortSwipeDirectionWidget extends StatelessWidget {
  final SwipeDirectionWidgetType type;
  final String? value;
  final double? angle;
  final double scale;
  const SwipeSortSwipeDirectionWidget({
    required this.type,
    required this.scale,
    this.angle,
    super.key,
    this.value,
  }) : assert(
          type != SwipeDirectionWidgetType.leaf || value != null,
          'value should be provided for leaf type',
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(
        cos(angle ?? 1),
        sin(angle ?? 0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Transform.scale(
          scale: scale,
          child: switch (type) {
            SwipeDirectionWidgetType.branch => Transform.rotate(
                angle: angle ?? 0,
                child: Icon(
                  Icons.subdirectory_arrow_right_rounded,
                  size: 24,
                  color: Colors.blue[200],
                ),
              ),
            SwipeDirectionWidgetType.leaf => Text(value!),
            SwipeDirectionWidgetType.back => Transform.rotate(
                angle: angle ?? 0,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                  color: Colors.red[200],
                ),
              ),
            SwipeDirectionWidgetType.none => const SizedBox.shrink(),
          },
        ),
      ),
    );
  }
}

enum SwipeDirectionWidgetType {
  branch,
  leaf,
  back,
  none,
}
