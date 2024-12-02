import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:maze_game/components/game.dart';
import 'package:maze_game/screens/level_selection_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Maze Game"),
            ElevatedButton(
              onPressed: () => Get.to(() => const LevelSelectionScreen()),
              child: const Text("Press to Start"),
            )
          ],
        ),
      ),
    );
  }
}
