import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maze_game/components/level_card.dart';
import 'package:maze_game/screens/game_screen.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

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
              children: [
                LevelCard(
                  size: (5, 5),
                  personalBest: null,
                  devBest: null,
                  cleared: false,
                  onTap: () => Get.to(
                    () => const GameScreen(mazeWidth: 5, mazeHeight: 5),
                  ),
                ),
                const SizedBox(width: 10),
                LevelCard(
                  size: (10, 10),
                  personalBest: null,
                  devBest: null,
                  cleared: false,
                  onTap: () => Get.to(
                    () => const GameScreen(mazeWidth: 10, mazeHeight: 10),
                  ),
                ),
                const SizedBox(width: 10),
                LevelCard(
                  size: (20, 20),
                  personalBest: null,
                  devBest: null,
                  cleared: false,
                  onTap: () => Get.to(
                    () => const GameScreen(mazeWidth: 20, mazeHeight: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
