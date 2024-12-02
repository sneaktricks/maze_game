import 'package:hive_ce_flutter/hive_flutter.dart';

class ScoreService {
  final storage = Hive.box<Map>("storage");
  static const key = "scores";

  Map<String, int> get scores =>
      storage.get(key)?.cast<String, int>() ?? <String, int>{};

  /// Persist the provided score if it is better than the current best.
  /// Returns `true` if the record was updated.
  bool saveScore(String level, int score) {
    final scoreMap = scores;
    final oldScore = scoreMap[level];

    // Return false if score is not lower than the current best
    if (oldScore != null && score >= oldScore) {
      return false;
    }

    scoreMap[level] = score;
    storage.put(key, scoreMap);
    return true;
  }
}
