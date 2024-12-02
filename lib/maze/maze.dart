import 'package:flame/components.dart';
import 'package:maze_game/datastruct/stack.dart';

class Maze {
  late final List<List<bool>> _maze;
  final int width;
  final int height;

  Maze(this.width, this.height) {
    _maze = List.generate(
      height, 
      (index) => List.filled(width, true),
    );
  }

  factory Maze.realDimensions(int width, int height) {
    return Maze(width * 2 + 1, height * 2 + 1);
  }

  Vector2 get start => Vector2(1, 0);
  Vector2 get end => Vector2(width - 2, height - 1);

  void prepare() {
    const startX = 1;
    const startY = 1;

    _maze[0][1] = false;
    _maze[height-1][width-2] = false;

    final visited = List.generate(
      height, 
      (index) => List.filled(width, false),
    );
    final stack = Stack<(int, int)>();

    _maze[startY][startX] = false;
    visited[startY][startX] = true;
    stack.push((startX, startY));

    while (stack.isNotEmpty) {
      final cell = stack.pop();
      final neighbors_ = neighbors(cell);
      // print("Neighbors: ${_neighbors}");
      final unvisitedNeighbors = neighbors_.where((n) => !visited[n.$2][n.$1]).toList()..shuffle();

      for (final n in unvisitedNeighbors) {
        stack.push(cell);
        _maze[n.$2][n.$1] = false;
        _maze[(cell.$2 + n.$2) ~/ 2][(cell.$1 + n.$1) ~/ 2] = false;
        visited[n.$2][n.$1] = true;
        stack.push(n);
        break;
      }
    }
  }

  List<(int, int)> neighbors((int, int) cell) {
    final x = cell.$1;
    final y = cell.$2;

    final list = <(int, int)>[];

    if (x > 2) {
      list.add((x-2, y));
    }
    if (x < width-3) {
      list.add((x+2, y));
    }
    if (y < height-3) {
      list.add((x, y+2));
    }
    if (y > 2) {
      list.add((x, y-2));
    }

    return list;
  }

  List<List<bool>> get walls => _maze;

  @override
  String toString() {
    final buffer = StringBuffer();
    for (final wall in _maze) {
      buffer.writeln(wall.map((x) => x ? "X" : " ").join(" "));
    }
    return buffer.toString();
  }
}