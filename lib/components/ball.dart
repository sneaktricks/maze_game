import 'dart:ui';

import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Ball extends BodyComponent with DragCallbacks {
  @override
  final Vector2 position;
  final double radius;
  Ball({required this.position, required this.radius});

  @override
  Body createBody() {
    paint = Paint()..color = const Color.fromRGBO(255, 0, 0, 1);

    final bodyDef = BodyDef(
      type: BodyType.static,
      position: position,
    );

    final shape = CircleShape()..radius = radius;
    final fixtureDef = FixtureDef(shape)
      ..friction = 0.5
      ..restitution = 0.8
      ..density = 0.8;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}