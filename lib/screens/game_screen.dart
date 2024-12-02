import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:maze_game/components/game.dart';

class GameScreen extends StatelessWidget {
  final int mazeWidth;
  final int mazeHeight;
  const GameScreen(
      {super.key, required this.mazeWidth, required this.mazeHeight});

  @override
  Widget build(BuildContext context) {
    return GameWidget.controlled(
      gameFactory: () => MazeGame(mazeWidth, mazeHeight),
    );
  }
}
