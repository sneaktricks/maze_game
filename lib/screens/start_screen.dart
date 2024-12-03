import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maze_game/screens/level_selection_screen.dart';
import 'package:maze_game/widgets/constrained_view.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Maze Game",
                style: TextStyle(fontSize: 80),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(
                onPressed: () => Get.to(() => LevelSelectionScreen()),
                child: const Text(
                  "Press to Start",
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
