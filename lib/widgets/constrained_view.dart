import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maze_game/utils/breakpoint.dart' as breakpoint;

class ConstrainedView extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ConstrainedView(
      {super.key, required this.child, this.maxWidth = breakpoint.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final c = constraints.copyWith(
            maxWidth: min(constraints.maxWidth, maxWidth),
          );
          return ConstrainedBox(
            constraints: c,
            child: child,
          );
        },
      ),
    );
  }
}
