import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/domain/tree_composite.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/presentation/rotated_arrow.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/presentation/swipe_sort_swipe_direction_widget.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/presentation/task_deck.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:vector_math/vector_math_64.dart' as v;

class SwipeTreeBranch extends StatefulWidget {
  final TreeBranch<String> branch;
  final List<TaskEntry> tasks;
  final void Function(TaskEntry, String) onActionChoosed;

  const SwipeTreeBranch({
    required this.branch,
    required this.tasks,
    required this.onActionChoosed,
    super.key,
  });

  @override
  State<SwipeTreeBranch> createState() => _SwipeTreeBranchState();
}

class _SwipeTreeBranchState extends State<SwipeTreeBranch> {
  final _dragPosition = ValueNotifier(v.Vector2.zero());
  final _swipeTriggerLength = 70.0;

  double get _dragAngle =>
      -_dragPosition.value.angleToSigned(v.Vector2(1, 0)) + pi;
  v.Vector2 get _displacement => _dragPosition.value;

  @override
  void initState() {
    super.initState();
    _dragPosition.addListener(() {
      setState(() {});
    });
  }

  int _selectedSector() {
    final sectorCount = widget.branch.children.length;
    final choosedSectorRaw = (_dragAngle / (pi * 2) * sectorCount).round();
    // since range is [0, 2*pi] we should handle case when angle is 2*pi
    final choosedSector =
        choosedSectorRaw >= sectorCount ? 0 : choosedSectorRaw;
    return choosedSector;
  }

  void _clearDisplacement() {
    _dragPosition.value = v.Vector2.zero();
  }

  bool _isSwipeTooShort(v.Vector2 displacement) {
    if (displacement.length < _swipeTriggerLength) {
      return true;
    }
    return false;
  }

  Future<void> _onDragEnd() async {
    final choosedSector = _selectedSector();
    final choosedChild = widget.branch.children[choosedSector];
    final displacement = _displacement;
    _clearDisplacement();
    if (_isSwipeTooShort(displacement)) return;

    await choosedChild.when<Future<void>>(
      leaf: (value) async {
        widget.onActionChoosed(
          widget.tasks[0],
          value,
        );
      },
      branch: (_) => Navigator.push<void>(
        context,
        MaterialPageRoute(
          builder: (context) => SwipeTreeBranch(
            branch: choosedChild as TreeBranch<String>,
            tasks: widget.tasks,
            onActionChoosed: widget.onActionChoosed,
          ),
        ),
      ),
      empty: () async {},
      back: () async =>
          Navigator.canPop(context) ? Navigator.pop(context) : null,
    );
    // clear DragPosition
  }

  void _onDragUpdate(DragUpdateDetails details) {
    _dragPosition.value =
        _dragPosition.value + v.Vector2(details.delta.dx, details.delta.dy);
  }

  @override
  void dispose() {
    _dragPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              /// widget that represent active card an underlaying
              Center(
                child: TaskDeck(
                  tasks: widget.tasks,
                ),
              ),

              /// indicator where user is swiping
              RotatedArrow(
                angle: _dragAngle,
                length: _displacement.length / 2,
                offset: Offset(
                  constraints.maxWidth / 2,
                  constraints.maxHeight / 2,
                ),
                width: 10,
              ),

              /// indicator where user could swipe
              ...List<Widget>.generate(widget.branch.children.length, (index) {
                final angle = pi * 2 / widget.branch.children.length * index;
                return Align(
                  alignment: Alignment(
                    cos(angle),
                    sin(angle),
                  ),
                  child: SwipeSortSwipeDirectionWidget(
                    composite: widget.branch.children[index],
                    angle: angle,
                    scale: index == _selectedSector() &&
                            !_isSwipeTooShort(_displacement)
                        ? min(_displacement.length / _swipeTriggerLength, 3)
                        : 1,
                  ),
                );
              }),

              /// invisible widget that will be used to detect swipes
              Draggable(
                onDragEnd: (_) => _onDragEnd(),
                onDragUpdate: _onDragUpdate,
                child: Container(
                  color: Colors.transparent,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                ),
                feedback: const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
