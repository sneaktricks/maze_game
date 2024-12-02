import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:maze_game/controllers/score_controller.dart';
import 'package:maze_game/screens/start_screen.dart';
import 'package:maze_game/services/score_service.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<Map>("storage");

  Get.lazyPut(() => ScoreService(), fenix: true);
  Get.lazyPut(() => ScoreController(), fenix: true);

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const StartScreen(),
      darkTheme: ThemeData.dark(useMaterial3: true),
    );
  }
}
