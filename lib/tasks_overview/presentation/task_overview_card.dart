import 'package:flutter/material.dart';
import 'package:todo_app/tasks_overview/domain/task_entry.dart';

class TaskOverviewCard extends StatefulWidget {
  final TaskEntry taskEntry;
  final void Function(TaskEntry)? onDelete;
  final void Function(TaskEntry)? onDone;
  final void Function(TaskEntry)? onPressed;
  final void Function(TaskEntry)? onInfoPressed;
  final void Function(TaskEntry, TaskStatus)? onStatusChanged;

  const TaskOverviewCard({
    required this.taskEntry,
    this.onDelete,
    this.onDone,
    this.onPressed,
    this.onInfoPressed,
    this.onStatusChanged,
    super.key,
  });

  @override
  State<TaskOverviewCard> createState() => _TaskOverviewCardState();
}

class _TaskOverviewCardState extends State<TaskOverviewCard>
    with SingleTickerProviderStateMixin {
  final _menuOpenThreshold = 100.0;
  final _actionTreshold = 200.0;
  late final AnimationController _menuAnimationController;
  late final Animation<double> _menuAnimation;
  late final Tween<double> _menuTween;
  double _dragDisplacement = 0;

  @override
  void initState() {
    super.initState();
    _menuAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
    );
    _menuTween = Tween<double>(
      begin: 0,
      end: _menuOpenThreshold.toDouble(),
    );
    _menuAnimation = _menuTween.animate(_menuAnimationController)
      ..addListener(() {
        _updateDisplacement(_menuAnimation.value);
        print(1);
      });
  }

  @override
  void dispose() {
    _menuAnimationController.dispose();
    super.dispose();
  }

  void _updateDisplacement(double displacement) {
    setState(() {
      _dragDisplacement = displacement;
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    _updateDisplacement(
      _dragDisplacement + details.delta.dx,
    );
    _menuAnimationController.stop();
  }

  void _onDragEnd(DragEndDetails details) {
    /// apply action
    if (_dragDisplacement.abs() > _actionTreshold) {
      if (_dragDisplacement > 0) {
        widget.onDone?.call(widget.taskEntry);
      } else {
        widget.onDelete?.call(widget.taskEntry);
      }
    }

    // TODO(me): refactor animation related code to reduce complexity.
    /// calculate animation begin and end for left and right menu
    final double animationBegin;
    final double animationEnd;
    if (_dragDisplacement < 0) {
      animationBegin = _dragDisplacement;
      if (_dragDisplacement.abs() > _menuOpenThreshold) {
        animationEnd = -_menuOpenThreshold;
      } else {
        animationEnd = 0;
      }
    } else {
      animationEnd = _dragDisplacement;
      if (_dragDisplacement.abs() > _menuOpenThreshold) {
        animationBegin = _menuOpenThreshold;
      } else {
        animationBegin = 0;
      }
    }

    /// run return animation
    _menuTween.begin = animationBegin;
    _menuTween.end = animationEnd;
    if (_dragDisplacement < 0) {
      _menuAnimationController.forward(from: _dragDisplacement);
    } else {
      _menuAnimationController.reverse(from: _dragDisplacement);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed?.call(widget.taskEntry),
      child: GestureDetector(
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: Stack(
          children: [
            /// left menu
            if (_dragDisplacement > 0)
              Positioned.fill(
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        onPressed: () => widget.onDone?.call(widget.taskEntry),
                      ),
                    ),
                  ),
                ),
              ),

            /// right menu
            if (_dragDisplacement < 0)
              Positioned.fill(
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.tertiary,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.onError,
                        ),
                        onPressed: () =>
                            widget.onDelete?.call(widget.taskEntry),
                      ),
                    ),
                  ),
                ),
              ),

            /// card content
            Transform.translate(
              offset: Offset(_dragDisplacement, 0),
              child: ColoredBox(
                color: Theme.of(context).colorScheme.surface,
                child: Row(
                  children: [
                    Checkbox(
                      value: widget.taskEntry.status == TaskStatus.done,

                      // TODO: make code abstract from only two states.
                      onChanged: (isDone) => widget.onStatusChanged?.call(
                        widget.taskEntry,
                        isDone! ? TaskStatus.done : TaskStatus.open,
                      ),
                    ),
                    Expanded(
                      child: Text(widget.taskEntry.title),
                    ),
                    IconButton(
                      onPressed: () =>
                          widget.onInfoPressed?.call(widget.taskEntry),
                      icon: const Icon(Icons.info_outline),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Stack(
      //   children: [
      //     /// underlay with icons and colors
      //     Positioned.fill(
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: [
      //           Expanded(
      //             child: Container(
      //               color: Theme.of(context).colorScheme.secondary,
      //             ),
      //           ),
      //           Expanded(
      //             child: Container(
      //               color: Theme.of(context).colorScheme.tertiary,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),

      //     /// card content
      //   ],
      // ),
    );
  }
}
