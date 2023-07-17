import 'package:flutter/material.dart';
import 'package:todo_app/ml_suggestions_screen/ml_suggestions_screen.dart';

/// TODO: REMOVE THIS CRUNCH. Migrate to navigator 2.0

class MlSwipeTreeRoute extends MaterialPageRoute<void> {
  MlSwipeTreeRoute()
      : super(
    builder: (_) => const MlSwipeTree(),
  );
}
