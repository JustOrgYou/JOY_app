import 'package:flutter/material.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/swipe_tree_sort.dart';

/// TODO: REMOVE THIS CRUNCH. Migrate to navigator 2.0

class SwipeTreeSortRoute extends MaterialPageRoute<void> {
  SwipeTreeSortRoute()
      : super(
          builder: (_) => const SwipeTreeSort(),
        );
}
