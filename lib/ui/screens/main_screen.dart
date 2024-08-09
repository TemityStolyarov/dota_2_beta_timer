import 'package:dota_2_beta_timer/core/timer.dart';
import 'package:dota_2_beta_timer/ui/widgets/tab_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
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
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String time;
  late String turboTime;
  late String aegisTime;
  late String aegisTurboTime;

  static const platform = MethodChannel('hotkey');

  @override
  void initState() {
    super.initState();

    widget.timer.addListener(_updateTime);
    widget.turboTimer.addListener(_updateTurboTime);
    widget.aegisTimer.addListener(_updateAegisTime);
    widget.aegisTurboTimer.addListener(_updateAegisTurboTime);

    time = widget.timer.time;
    turboTime = widget.turboTimer.time;
    aegisTime = widget.aegisTimer.time;
    aegisTurboTime = widget.aegisTurboTimer.time;

    platform.setMethodCallHandler(_handleHotkey);
  }

  @override
  void dispose() {
    widget.timer.removeListener(_updateTime);
    widget.turboTimer.removeListener(_updateTurboTime);
    widget.aegisTimer.removeListener(_updateAegisTime);
    widget.aegisTurboTimer.removeListener(_updateAegisTurboTime);
    super.dispose();
  }

  Future<void> _handleHotkey(MethodCall call) async {
    switch (call.method) {
      case 'hotkey':
        // Ваш код для обработки нажатия клавиш
        print("Alt + P was pressed!");
        break;
      default:
        throw MissingPluginException('Неизвестный метод: ${call.method}');
    }
  }

  void _updateTime() {
    setState(() {
      time = widget.timer.time;
    });
  }

  void _updateTurboTime() {
    setState(() {
      turboTime = widget.turboTimer.time;
    });
  }

  void _updateAegisTime() {
    setState(() {
      aegisTime = widget.aegisTimer.time;
    });
  }

  void _updateAegisTurboTime() {
    setState(() {
      aegisTurboTime = widget.aegisTurboTimer.time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: TabColumn(
                  welcomeText: 'Aegis Timer',
                  startText: 'start',
                  pauseText: 'pause',
                  resumeText: 'resume',
                  stopText: 'stop',
                  startTimer: () => widget.aegisTimer.start(),
                  pauseTimer: () => widget.aegisTimer.pause(),
                  stopTimer: () => widget.aegisTimer.stop(),
                  time: aegisTime,
                  isAegisTimer: true,
                ),
              ),
              const Divider(thickness: 0.5),
              Expanded(
                child: TabColumn(
                  welcomeText: 'Aegis Turbo Timer',
                  startText: 'start',
                  pauseText: 'pause',
                  resumeText: 'resume',
                  stopText: 'stop',
                  startTimer: () => widget.aegisTurboTimer.start(),
                  pauseTimer: () => widget.aegisTurboTimer.pause(),
                  stopTimer: () => widget.aegisTurboTimer.stop(),
                  time: aegisTurboTime,
                  isAegisTimer: true,
                ),
              ),
            ],
          ),
        ),
        const VerticalDivider(thickness: 0.5),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: TabColumn(
                  welcomeText: 'Dota 2 Timer',
                  startText: 'start',
                  pauseText: 'pause',
                  resumeText: 'resume',
                  stopText: 'stop',
                  startTimer: () => widget.timer.start(),
                  pauseTimer: () => widget.timer.pause(),
                  stopTimer: () => widget.timer.stop(),
                  time: time,
                  isAegisTimer: false,
                  setTime00: () => widget.timer.setTime(0),
                  setTime15: () => widget.timer.setTime(-15),
                  setTime30: () => widget.timer.setTime(-30),
                ),
              ),
              const Divider(thickness: 0.5),
              Expanded(
                child: TabColumn(
                  welcomeText: 'Dota 2 Turbo Timer',
                  startText: 'start',
                  pauseText: 'pause',
                  resumeText: 'resume',
                  stopText: 'stop',
                  startTimer: () => widget.turboTimer.start(),
                  pauseTimer: () => widget.turboTimer.pause(),
                  stopTimer: () => widget.turboTimer.stop(),
                  time: turboTime,
                  isAegisTimer: false,
                  setTime00: () => widget.turboTimer.setTime(0),
                  setTime15: () => widget.turboTimer.setTime(-15),
                  setTime30: () => widget.turboTimer.setTime(-30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
