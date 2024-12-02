import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maze_game/screens/level_selection_screen.dart';

class ResultScreen extends StatelessWidget {
  final int moves;
  final (int, int) size;
  const ResultScreen({super.key, required this.moves, required this.size});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${size.$1}x${size.$2} maze clear!",
                style: const TextStyle(fontSize: 48)),
            Text("Moves: $moves", style: const TextStyle(fontSize: 24)),
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            ElevatedButton(
              child: const Text(
                "Finish",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => Get.to(() => const LevelSelectionScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
