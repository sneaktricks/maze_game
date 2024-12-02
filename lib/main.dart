
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:maze_game/components/game.dart';
import 'package:maze_game/maze/maze.dart';

void main() {
  // final m = Maze.realDimensions(5, 5);
  // m.prepare();
  // print(m.toString());
  runApp(
    const GameWidget.controlled(gameFactory: MazeGame.new),
  );
  // runApp(const MainApp());
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }
