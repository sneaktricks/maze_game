import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget {
  final (int, int) size;
  final int? personalBest;
  final int? devBest;
  final bool cleared;
  final Function()? onTap;

  const LevelCard(
      {super.key,
      required this.size,
      required this.personalBest,
      required this.devBest,
      required this.cleared,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: !cleared,
                  child: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 60,
                  ),
                ),
                Text(
                  "${size.$1}x${size.$2}",
                  style: const TextStyle(fontSize: 40),
                ),
                Text(
                  "PB: ${personalBest ?? '--'}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Dev: ${devBest ?? '--'}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
