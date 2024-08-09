import 'package:dota_2_beta_timer/core/timer.dart';
import 'package:dota_2_beta_timer/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await hotKeyManager.unregisterAll();

  final timer = Timer(
    name: 'Timer',
    isTurbo: false,
  );
  final turboTimer = Timer(
    name: 'Turbo Timer',
    isTurbo: true,
  );
  final aegisTimer = AegisTimer(
    5,
    name: 'Aegis Timer',
    isTurbo: false,
  );
  final aegisTurboTimer = AegisTimer(
    4,
    name: 'Aegis Turbo Timer',
    isTurbo: true,
  );

  runApp(
    MainApp(
      timer: timer,
      turboTimer: turboTimer,
      aegisTimer: aegisTimer,
      aegisTurboTimer: aegisTurboTimer,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.timer,
    required this.turboTimer,
    required this.aegisTimer,
    required this.aegisTurboTimer,
  });

  final Timer timer;
  final Timer turboTimer;
  final AegisTimer aegisTimer;
  final AegisTimer aegisTurboTimer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dota 2 Beta Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: Scaffold(
        body: MainScreen(
          timer: timer,
          turboTimer: turboTimer,
          aegisTimer: aegisTimer,
          aegisTurboTimer: aegisTurboTimer,
        ),
      ),
    );
  }
}
