import 'package:flutter/material.dart';

class OneUIScrollPhysics extends ScrollPhysics {
  final double expandedHeight;

  const OneUIScrollPhysics(this.expandedHeight, {ScrollPhysics? parent})
      : super(parent: parent);

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    assert(ancestor != null);
    return OneUIScrollPhysics(expandedHeight, parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    if (velocity == 0.0 ||
        (velocity > 0.0 && position.pixels >= position.maxScrollExtent) ||
        (velocity < 0.0 && position.pixels <= position.minScrollExtent)) {
      return null;
    }
    return OneUIScrollSimulation(
      position.pixels,
      velocity,
      expandedHeight: expandedHeight,
    );
  }
}

class OneUIScrollSimulation extends ClampingScrollSimulation {
  final double expandedHeight;

  OneUIScrollSimulation(
    double position,
    double velocity, {
    required this.expandedHeight,
    double friction = 0.015,
    Tolerance tolerance = Tolerance.defaultTolerance,
  }) : super(
          position: position,
          velocity: velocity,
          friction: friction,
          tolerance: tolerance,
        ) {
    assert(expandedHeight >= 0);
  }

  @override
  double x(double time) {
    final double x = super.x(time);
    return x < 0.0 ? 0.0 : (x > expandedHeight ? expandedHeight : x);
  }

  @override
  bool isDone(double time) => super.isDone(time) || position >= expandedHeight;
}
