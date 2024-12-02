import 'package:flame_forge2d/flame_forge2d.dart';

class Wall extends BodyComponent {
  @override
  final Vector2 position;
  final double halfWidth;
  final double halfHeight;

  Wall({required this.position, required this.halfWidth, required this.halfHeight});

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.static,
      position: position + Vector2(halfWidth, halfHeight),
    );

    final shape = PolygonShape()..setAsBoxXY(halfWidth, halfHeight);
    final fixtureDef = FixtureDef(shape)..friction = 0.5;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}