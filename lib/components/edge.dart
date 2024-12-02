import 'package:flame_forge2d/flame_forge2d.dart';

class Edge extends BodyComponent {
  final Vector2 from;
  final Vector2 to;

  Edge({required this.from, required this.to});

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.static,
      position: Vector2.zero(),
    );

    final shape = EdgeShape()..set(from, to);
    final fixtureDef = FixtureDef(shape)..friction = 0.5;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}