import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:maze_game/components/game.dart';

class Ball extends BodyComponent<MazeGame>
    with DragCallbacks, ContactCallbacks {
  @override
  final Vector2 position;
  final double radius;
  Ball({required this.position, required this.radius});

  @override
  Body createBody() {
    paint = Paint()..color = const Color.fromARGB(255, 255, 0, 4);

    final bodyDef = BodyDef(
      type: BodyType.static,
      position: position,
      angularDamping: 2,
    );

    final shape = CircleShape()..radius = radius;
    final fixtureDef = FixtureDef(shape)
      ..friction = 0.5
      ..restitution = 0.5
      ..density = 0.5;

    return world.createBody(bodyDef)
      ..userData = this
      ..createFixture(fixtureDef);
  }

  @override
  Future<void> onLoad() {
    addAll([
      CustomPainterComponent(
        painter: _DragPainter(this),
        anchor: Anchor.center,
        size: Vector2(radius, radius),
        position: Vector2(0, 0),
      ),
    ]);
    return super.onLoad();
  }

  Vector2 _dragStart = Vector2.zero();
  Vector2 _dragDelta = Vector2.zero();
  Vector2 get dragDelta => _dragDelta;

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    _dragStart = event.localPosition;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    _dragDelta = event.localEndPosition - _dragStart;
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);

    body.setType(BodyType.dynamic);

    final impulse = (_dragDelta.clone()..rotate(body.angle)) * (-6 * radius);
    body.applyLinearImpulse(impulse);

    _dragStart = Vector2.zero();
    _dragDelta = Vector2.zero();

    game.incrementMoves();
  }
}

class _DragPainter extends CustomPainter {
  _DragPainter(this.ball);

  final Ball ball;

  @override
  void paint(Canvas canvas, Size size) {
    if (ball.dragDelta != Vector2.zero()) {
      var center = size.center(Offset.zero);
      canvas.drawLine(
          center,
          center + (ball.dragDelta * -1).toOffset(),
          Paint()
            ..color = Colors.orange.withOpacity(0.7)
            ..strokeWidth = 0.4 * ball.radius
            ..strokeCap = StrokeCap.round);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
