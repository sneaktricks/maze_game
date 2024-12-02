import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:maze_game/components/game.dart';

class MovesText extends TextComponent with HasGameRef<MazeGame> {
  MovesText(Vector2 position) {
    text = "Moves: 0";
    anchor = Anchor.center;
    this.position = position;
    textRenderer = TextPaint(
      style: const TextStyle(color: Colors.white, fontSize: 4),
    );
  }

  @override
  void update(double dt) {
    text = "Moves: ${game.moves}";

    super.update(dt);
  }
}
