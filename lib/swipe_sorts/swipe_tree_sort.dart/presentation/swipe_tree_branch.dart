// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort.dart/domain/tree_composite.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort.dart/presentation/task_deck.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:vector_math/vector_math_64.dart' as v;

class SwipeTreeBranch extends StatefulWidget {
  final TreeBranch<String> branch;
  final List<TaskEntry> tasks;

  const SwipeTreeBranch({
    required this.branch,
    required this.tasks,
    super.key,
  });

  @override
  State<SwipeTreeBranch> createState() => _SwipeTreeBranchState();
}

class _SwipeTreeBranchState extends State<SwipeTreeBranch> {
  final _dragPosition = ValueNotifier(v.Vector2.zero());
  final _swipeEventIgnoreLength = 20;
  final _swipeTriggerLength = 70.0;

  double get _angle => -_dragPosition.value.angleToSigned(v.Vector2(1, 0)) + pi;
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
    final choosedSectorRaw = (_angle / (pi * 2) * sectorCount).round();
    // since range is [0, 2*pi] we should handle case when angle is 2*pi
    final choosedSector =
        choosedSectorRaw >= sectorCount ? 0 : choosedSectorRaw;
    return choosedSector;
  }

  void _clearDisplacement() {
    _dragPosition.value = v.Vector2.zero();
  }

  bool _isSwipeTooShort() {
    if (_displacement.length < _swipeEventIgnoreLength) return true;

    if (_displacement.length < _swipeTriggerLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 10),
          content: Text('Not enough swipe: ${_displacement.length}'),
        ),
      );
      return true;
    }
    return false;
  }

  Future<void> _onDragEnd() async {
    if (_isSwipeTooShort()) return;

    final choosedSector = _selectedSector();
    final choosedChild = widget.branch.children[choosedSector];
    _clearDisplacement();

    await choosedChild.when<Future<void>>(
      leaf: (value) async => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 60),
          content: Text('Leaf: $value'),
        ),
      ),
      branch: (_) => Navigator.push<void>(
        context,
        MaterialPageRoute(
          builder: (context) => SwipeTreeBranch(
            branch: choosedChild as TreeBranch<String>,
            tasks: widget.tasks,
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
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            /// widget that represent active card an underlaying
            TaskDeck(),

            /// debug info
            Column(
              children: [
                Text(_dragPosition.value.toString()),
                Text(_angle.toString()),
              ],
            ),

            /// indicator where user is swiping
            Transform(
              transform: Matrix4.rotationZ(_angle)
                ..setTranslation(
                  v.Vector3(
                    constraints.maxWidth / 2,
                    constraints.maxHeight / 2,
                    0,
                  ),
                ),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: _displacement.length / 2,
                    height: 10,
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            /// indicator where user could swipe
            for (var i = 0; i < widget.branch.children.length; i++)
              Align(
                alignment: Alignment(
                  cos(pi * 2 / widget.branch.children.length * i),
                  sin(pi * 2 / widget.branch.children.length * i),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(i.toString()),
                      widget.branch.children[i].when(
                            leaf: Text.new,
                            branch: (_) => CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.blue,
                            ),
                            empty: SizedBox.shrink,
                            back: () => CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.red,
                            ),
                          ) ??
                          SizedBox.shrink(),
                    ],
                  ),
                ),
              ),

            /// invisible widget that will be used to detect swipes
            Draggable(
              onDragEnd: (_) => _onDragEnd(),
              onDragUpdate: _onDragUpdate,
              child: Container(
                color: Colors.transparent,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
              ),
              feedback: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
