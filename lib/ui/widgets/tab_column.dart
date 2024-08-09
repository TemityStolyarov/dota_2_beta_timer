import 'package:flutter/material.dart';

class TabColumn extends StatelessWidget {
  const TabColumn({
    super.key,
    required this.startText,
    required this.stopText,
    required this.startTimer,
    required this.stopTimer,
    required this.welcomeText,
    required this.pauseTimer,
    required this.pauseText,
    required this.resumeText,
    required this.time,
    required this.isAegisTimer,
    this.setTime00,
    this.setTime15,
    this.setTime30,
  });

  final String startText;
  final String pauseText;
  final String resumeText;
  final String stopText;
  final VoidCallback startTimer;
  final VoidCallback pauseTimer;
  final VoidCallback stopTimer;
  final VoidCallback? setTime00;
  final VoidCallback? setTime15;
  final VoidCallback? setTime30;
  final String welcomeText;
  final String time;
  final bool isAegisTimer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            welcomeText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (!isAegisTimer) ...[
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: setTime30,
                  child: const Text(
                    '00:-30',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: setTime15,
                  child: const Text(
                    '00:-15',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: setTime00,
                  child: const Text(
                    '00:00',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: startTimer,
                child: Text(
                  startText,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: pauseTimer,
                style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(
                    Colors.yellow.shade800.withOpacity(0.15),
                  ),
                ),
                child: Text(
                  pauseText,
                  style: TextStyle(
                    color: Colors.yellow.shade800.withOpacity(1),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: startTimer,
                style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(
                    Colors.green.shade900.withOpacity(0.15),
                  ),
                ),
                child: Text(
                  resumeText,
                  style: TextStyle(
                    color: Colors.green.shade900.withOpacity(1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          TextButton(
            onPressed: stopTimer,
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(
                Colors.red.shade400.withOpacity(0.15),
              ),
            ),
            child: Text(
              stopText,
              style: TextStyle(
                color: Colors.red.shade400.withOpacity(1),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
