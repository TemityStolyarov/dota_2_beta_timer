import 'package:dota_2_beta_timer/core/helpers.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class Timer extends ValueNotifier<String> {
  Timer({
    required this.name,
    required this.isTurbo,
  }) : super('00:00:00');

  final String name;
  final bool isTurbo;

  bool count = false;
  int sec = 0;
  int min = 0;
  int hr = 0;

  String get time => value;

  start() {
    logger.i('$name started!');
    count = true;
    _count();
  }

  setTime(int secs) {
    sec = secs;
    _updateTime();
  }

  pause() {
    logger.i('$name paused!');
    count = false;
  }

  stop() {
    logger.i('$name stopped!');
    sec = 0;
    min = 0;
    hr = 0;
    count = false;
    _updateTime();
  }

  _count() {
    if (sec == 59 && min != 59) {
      sec = 0;
      min++;
    } else {
      if (min == 59 && sec == 59) {
        sec = 0;
        min = 0;
        hr++;
      } else {
        sec++;
      }
    }

    _updateTime();
    checkEvents(hr, min, sec, isTurbo);

    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (count) {
        _count();
      }
    });
  }

  void _updateTime() {
    value = '${dec(hr)}:${dec(min)}:${dec(sec)}';
  }
}

class AegisTimer extends Timer {
  AegisTimer(
    this.initMin, {
    required this.name,
    required this.isTurbo,
  }) : super(
          name: name,
          isTurbo: isTurbo,
        ) {
    min = initMin;
    sec = 0;
    _updateTime();
  }

  final int initMin;
  @override
  final String name;
  @override
  final bool isTurbo;

  @override
  stop() {
    logger.i('$name stopped!');
    sec = 0;
    min = initMin;
    hr = 0;
    count = false;
    _updateTime();
  }

  @override
  String get time => value;

  @override
  _count() {
    if (sec == 0 && min != 0) {
      min--;
      sec = 60;
    }

    sec--;

    if (sec < -120) {
      count = false;
      logger.i('$name finished!');
      return;
    }

    _updateTime();
    checkAegisEvents(hr, min, sec, isTurbo);

    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (count) {
        _count();
      }
    });
  }

  @override
  void _updateTime() {
    value = '${dec(hr)}:${dec(min)}:${dec(sec)}';
  }
}
