import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:maze_game/components/ball.dart';
import 'package:maze_game/components/game.dart';

class Edge extends BodyComponent<MazeGame> with ContactCallbacks {
  final Vector2 from;
  final Vector2 to;
  final bool isFinish;

  Edge({required this.from, required this.to, this.isFinish = false});

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.static,
      position: Vector2.zero(),
    );

    if (isFinish) paint.color = Colors.transparent;

    final shape = EdgeShape()..set(from, to);
    final fixtureDef = FixtureDef(shape)..friction = 0.5;

    return world.createBody(bodyDef)
      ..userData = this
      ..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Ball && isFinish) {
      game.isGameFinished = true;
    }

    super.beginContact(other, contact);
  }
}
