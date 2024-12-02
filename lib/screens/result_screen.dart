import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maze_game/screens/level_selection_screen.dart';

class ResultScreen extends StatelessWidget {
  final int moves;
  final int? best;
  final (int, int) size;
  const ResultScreen(
      {super.key, required this.moves, required this.best, required this.size});

  String get levelName => "${size.$1}x${size.$2}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("$levelName Maze Clear!",
                style: const TextStyle(fontSize: 48)),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Text("Moves: $moves", style: const TextStyle(fontSize: 24)),
            Text(
                best == null || moves < best!
                    ? "New Personal Best!"
                    : "Best: $best",
                style: const TextStyle(fontSize: 24)),
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            ElevatedButton(
              child: const Text(
                "Back to Level Select",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => Get.off(() => LevelSelectionScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
