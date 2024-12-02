import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:maze_game/components/ball.dart';
import 'package:maze_game/components/edge.dart';
import 'package:maze_game/components/wall.dart';
import 'package:maze_game/maze/maze.dart';

class MazeGame extends Forge2DGame {
  Maze maze = Maze.realDimensions(10, 10)..prepare();

  MazeGame() : super(
    gravity: Vector2(0, 9.81),
    camera: CameraComponent.withFixedResolution(width: 800, height: 800)
  );

  @override
  FutureOr<void> onLoad() async {
    await addMaze(maze);

    return super.onLoad();
  }
  
  Future<void> addMaze(Maze maze) {
    final width = camera.visibleWorldRect.right - camera.visibleWorldRect.left;
    final height = camera.visibleWorldRect.bottom - camera.visibleWorldRect.top;
    final wallWidth = width / maze.width;
    final wallHeight = height / maze.height;

    final List<Wall> walls = [];

    for (var i = 0; i < maze.width; i++) {
      final x = camera.visibleWorldRect.left + i * wallWidth;

      for (var j = 0; j < maze.height; j++) {
        final y = camera.visibleWorldRect.top + j * wallHeight;
        if (maze.walls[j][i]) {
          walls.add(
            Wall(
              position: Vector2(x, y), 
              halfWidth: wallWidth / 2, 
              halfHeight: wallHeight / 2,
            ),
          );
        }
      }
    }

    final ball = Ball(
      position: Vector2(
        camera.visibleWorldRect.left + 1.5 * wallWidth,
        camera.visibleWorldRect.top + 0.5 * wallHeight,  
      ), 
      radius: min(wallWidth / 4, wallHeight / 4),
    );

    final startEdge = Edge(
      from: Vector2(
        camera.visibleWorldRect.left + maze.start.x * wallWidth,
        camera.visibleWorldRect.top,
      ),
      to: Vector2(
        camera.visibleWorldRect.left + (maze.start.x + 1) * wallWidth,
        camera.visibleWorldRect.top,
      ),
    );

    final endEdge = Edge(
      from: Vector2(
        camera.visibleWorldRect.left + maze.end.x * wallWidth,
        camera.visibleWorldRect.top + (maze.end.y + 1) * wallHeight,
      ),
      to: Vector2(
        camera.visibleWorldRect.left + (maze.end.x + 1) * wallWidth,
        camera.visibleWorldRect.top + (maze.end.y + 1) * wallHeight,
      ),
    );

    return world.addAll(<Component>[...walls, ball, startEdge, endEdge]);
  }

}