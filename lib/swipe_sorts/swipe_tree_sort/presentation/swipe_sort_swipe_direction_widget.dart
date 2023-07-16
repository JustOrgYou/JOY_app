import 'package:flutter/material.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/domain/tree_composite.dart';

class SwipeSortSwipeDirectionWidget extends StatelessWidget {
  final TreeComposite<String> composite;
  final double? angle;
  final double scale;
  const SwipeSortSwipeDirectionWidget({
    required this.composite,
    required this.scale,
    this.angle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Transform.scale(
        scale: scale,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            composite.when(
              empty: SizedBox.shrink,
              leaf: Text.new,
              branch: (_) => Transform.rotate(
                angle: angle ?? 0,
                child: Icon(
                  Icons.subdirectory_arrow_right_rounded,
                  size: 24,
                  color: Colors.blue[200],
                ),
              ),
              back: () => Transform.rotate(
                angle: angle ?? 0,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                  color: Colors.red[200],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
