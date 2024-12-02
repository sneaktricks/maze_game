import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maze_game/components/level_card.dart';
import 'package:maze_game/controllers/score_controller.dart';
import 'package:maze_game/screens/game_screen.dart';
import 'package:maze_game/screens/start_screen.dart';

class LevelSelectionScreen extends StatelessWidget {
  final scoreController = Get.find<ScoreController>();

  static final Map<String, (int, int)> levels = {
    "3x3": (3, 3),
    "6x6": (6, 6),
    "12x12": (12, 12),
  };

  LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Select Level",
              style: TextStyle(fontSize: 70),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: levels.entries.map((e) {
                final pb = scoreController.getLevelPB(e.key);
                return LevelCard(
                  size: e.value,
                  personalBest: pb,
                  devBest: scoreController.getDevScore(e.key),
                  cleared: pb != null,
                  onTap: () => Get.to(
                    () => GameScreen(
                      mazeWidth: e.value.$1,
                      mazeHeight: e.value.$2,
                      levelName: e.key,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.off(() => const StartScreen()),
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
