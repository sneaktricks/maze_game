import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maze_game/components/ball.dart';
import 'package:maze_game/components/edge.dart';
import 'package:maze_game/components/moves_text.dart';
import 'package:maze_game/components/wall.dart';
import 'package:maze_game/maze/maze.dart';
import 'package:maze_game/screens/result_screen.dart';

class MazeGame extends Forge2DGame {
  Maze maze = Maze(1, 1);

  int moves = 0;
  bool isGameFinished = false;
  bool isRedirected = false;

  final Function(int moves) onClear;
  final int? best;

  MazeGame(int mazeWidth, int mazeHeight, this.onClear, this.best)
      : super(
            gravity: Vector2(0, 20),
            camera:
                CameraComponent.withFixedResolution(width: 800, height: 1000)) {
    maze = Maze.realDimensions(mazeWidth, mazeHeight)..prepare();
  }

  void incrementMoves() {
    moves++;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isGameFinished && !isRedirected) {
      isRedirected = true;
      onClear(moves);
      Get.to(
        () => ResultScreen(
          moves: moves,
          size: ((maze.width - 1) ~/ 2, (maze.height - 1) ~/ 2),
          best: best,
        ),
      );
    }
  }

  @override
  FutureOr<void> onLoad() async {
    await addMaze(maze);
    await addTexts();

    return super.onLoad();
  }

  Future<void> addTexts() async {
    final objectiveText = TextComponent(
      text: "Drag the ball to launch it to the exit",
      anchor: Anchor.center,
      position: Vector2(0, camera.visibleWorldRect.top + 5),
      textRenderer: TextPaint(
        style: const TextStyle(color: Colors.yellow, fontSize: 4),
      ),
    );

    final movesText = MovesText(
      Vector2(0, camera.visibleWorldRect.bottom - 5),
    );

    return world.addAll([movesText, objectiveText]);
  }

  Future<void> addMaze(Maze maze) {
    final top = camera.visibleWorldRect.top + 10;
    final bottom = camera.visibleWorldRect.bottom - 10;

    final width = camera.visibleWorldRect.right - camera.visibleWorldRect.left;
    final height = bottom - top;
    final wallWidth = width / maze.width;
    final wallHeight = height / maze.height;

    final List<Wall> walls = [];

    for (var i = 0; i < maze.width; i++) {
      final x = camera.visibleWorldRect.left + i * wallWidth;

      double continuousWallStart = 0;
      double continuousWallHeight = 0;

      for (var j = 0; j < maze.height; j++) {
        final y = top + j * wallHeight;
        if (maze.walls[j][i]) {
          if (continuousWallHeight == 0) {
            continuousWallStart = y;
          }
          continuousWallHeight += wallHeight / 2;
        } else if (continuousWallHeight > 0) {
          walls.add(
            Wall(
              position: Vector2(x, continuousWallStart),
              halfWidth: wallWidth / 2,
              halfHeight: continuousWallHeight,
            ),
          );
          continuousWallHeight = 0;
        }
      }

      if (continuousWallHeight > 0) {
        walls.add(
          Wall(
            position: Vector2(x, continuousWallStart),
            halfWidth: wallWidth / 2,
            halfHeight: continuousWallHeight,
          ),
        );
        continuousWallHeight = 0;
      }
    }

    final ball = Ball(
      position: Vector2(
        camera.visibleWorldRect.left + 1.5 * wallWidth,
        top + 0.5 * wallHeight,
      ),
      radius: min(wallWidth / 5, wallHeight / 5),
    );

    final startEdge = Edge(
      from: Vector2(
        camera.visibleWorldRect.left + maze.start.x * wallWidth,
        top,
      ),
      to: Vector2(
        camera.visibleWorldRect.left + (maze.start.x + 1) * wallWidth,
        top,
      ),
      isFinish: false,
    );

    final endEdge = Edge(
      from: Vector2(
        camera.visibleWorldRect.left + maze.end.x * wallWidth,
        top + (maze.end.y + 1) * wallHeight,
      ),
      to: Vector2(
        camera.visibleWorldRect.left + (maze.end.x + 1) * wallWidth,
        top + (maze.end.y + 1) * wallHeight,
      ),
      isFinish: true,
    );

    return world.addAll(<Component>[...walls, ball, startEdge, endEdge]);
  }
}
