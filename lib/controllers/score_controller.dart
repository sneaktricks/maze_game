import 'package:get/get.dart';
import 'package:maze_game/services/score_service.dart';

class ScoreController {
  final scoreService = Get.find<ScoreService>();

  /// Top scores of the dev. Can you beat these?
  static final Map<String, int> devScores = {
    "3x3": 1,
    "6x6": 3,
    "12x12": 35,
  };

  RxMap<String, int> scores;

  ScoreController() : scores = <String, int>{}.obs {
    scores.value = scoreService.scores;
  }

  int? getLevelPB(String level) {
    return scores[level];
  }

  int? getDevScore(String level) {
    return devScores[level];
  }

  bool saveScore(String level, int score) {
    final updated = scoreService.saveScore(level, score);
    if (updated) {
      scores[level] = score;
    }

    return updated;
  }
}
