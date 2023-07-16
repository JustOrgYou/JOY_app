// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/tasks_service/data/task_providers.dart';
import 'package:vector_math/vector_math_64.dart' as v;

class SwipeRadialSort extends HookConsumerWidget {
  const SwipeRadialSort({Key? key}) : super(key: key);

  void _onDragEnd(Offset offset) {
    // print(offset);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offset = useState(Offset.zero);
    final isDragging = useState(false);
    final categories = ref.watch(taskCategoriesProvider);
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final center = v.Vector2(
              constraints.maxWidth / 2,
              constraints.maxHeight / 2,
            );
            const categoryTitleHeigh = 30.0;
            const categoryTitleWidth = 200.0;
            const cardWith = 100.0;
            const cardHeight = 100.0;
            const r = 200;
            final container = Container(
              width: cardWith,
              height: cardHeight,
              color: Colors.amber,
            );
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        'isDragging: ${isDragging.value}',
                        style: TextStyle(
                          color: isDragging.value ? Colors.green : Colors.red,
                        ),
                      ),
                      Text('offset: ${offset.value}'),
                      Text('Distance: ${offset.value.distance}'),
                      Text('Direction: ${offset.value.direction / 3.14}'),
                    ],
                  ),
                ),
                for (int i = 0; i < categories.length; i++)
                  () {
                    final angle = i / categories.length * 2 * pi;
                    final position = center -
                        v.Vector2(r * cos(angle), r * sin(angle)) -
                        v.Vector2(categoryTitleWidth, categoryTitleHeigh) / 2;
                    final isFlipped = angle > pi * 0.5 && angle < pi * 1.5;
                    return Positioned(
                      left: position.x,
                      top: position.y,
                      child: Transform.rotate(
                        angle: angle,
                        child: Transform.flip(
                          flipX: isFlipped,
                          flipY: isFlipped,
                          child: SizedBox(
                            width: categoryTitleWidth,
                            height: categoryTitleHeigh,
                            child: ColoredBox(
                              color: Colors.blue[200]!,
                              child: Center(
                                child: Text(
                                  categories[i],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }(),
                Center(
                  child: Draggable(
                    onDragStarted: () => isDragging.value = true,
                    onDraggableCanceled: (_, __) {
                      _onDragEnd(offset.value);
                      isDragging.value = false;
                      offset.value = Offset.zero;
                    },
                    onDragUpdate: (details) {
                      final x = offset.value.dx + details.delta.dx;
                      final y = offset.value.dy + details.delta.dy;
                      offset.value = Offset(x, y);
                    },
                    childWhenDragging: Opacity(opacity: 0.5, child: container),
                    feedback: container,
                    child: container,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
