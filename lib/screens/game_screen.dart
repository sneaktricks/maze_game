import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:maze_game/components/game.dart';
import 'package:maze_game/controllers/score_controller.dart';

class GameScreen extends StatelessWidget {
  final scoreController = Get.find<ScoreController>();

  final int mazeWidth;
  final int mazeHeight;
  final String levelName;

  GameScreen(
      {super.key,
      required this.mazeWidth,
      required this.mazeHeight,
      required this.levelName});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: MazeGame(
        mazeWidth,
        mazeHeight,
        (moves) {
          scoreController.saveScore(levelName, moves);
        },
        scoreController.getLevelPB(levelName),
      ),
    );

    // GameWidget.controlled(
    //   gameFactory: () => MazeGame(
    //     mazeWidth,
    //     mazeHeight,
    //     (moves) {
    //       scoreController.saveScore(levelName, moves);
    //     },
    //   ),
    // );
  }
}
