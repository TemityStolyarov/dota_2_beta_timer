import 'package:audioplayers/audioplayers.dart';
import 'package:logger/logger.dart';

final logger = Logger();
final AudioPlayer _player = AudioPlayer();

String dec(int digit) {
  if (digit < 0) {
    return digit < -9 ? digit.toString() : '-0${-digit}';
  }
  return digit > 9 ? digit.toString() : '0$digit';
}

// Future.delayed(const Duration(seconds: 2)).then((value) {
//   _player.play(AssetSource('sounds/BOUNTY.mp3'));
//   logger.w('Появились руны богатства');
// });

checkEvents(int hr, int min, int sec, bool isTurbo) {
  final isPowerUpRuneTime = ((min % 2 == 0) && sec == 0 && min != 0);
  final isBountyRuneTime = ((min % 3 == 0) && min < 30 && sec == 0 && min != 0);
  final isWisdomRuneTime = ((min % 7 == 0) && sec == 0 && min != 0);
  final isWisdomRuneSoonTime = (hr == 0 && min == 6 && sec == 25) ||
      (hr == 0 && min == 13 && sec == 25) ||
      (hr == 0 && min == 20 && sec == 25) ||
      (hr == 0 && min == 27 && sec == 25) ||
      (hr == 0 && min == 34 && sec == 25) ||
      (hr == 0 && min == 41 && sec == 25);
  final isTormentorTime = (min == 20 && sec == 0);
  final isTurboTormentorTime = (min == 10 && sec == 0);
  final isTormentorSoonTime = (min == 19 && sec == 10);
  final isTurboTormentorSoonTime = (min == 9 && sec == 10);
  final isLotusTime = (hr == 0 && min == 2 && sec == 50) ||
      (hr == 0 && min == 5 && sec == 50) ||
      (hr == 0 && min == 8 && sec == 50) ||
      (hr == 0 && min == 11 && sec == 50);
  final isTurboLotusTime = (hr == 0 && min == 1 && sec == 20) ||
      (hr == 0 && min == 2 && sec == 50) ||
      (hr == 0 && min == 4 && sec == 20) ||
      (hr == 0 && min == 5 && sec == 50);

  if (isTurbo) {
    if (isTormentorSoonTime) {
      // TORMENTOR_SOON
      _player.play(AssetSource('sounds/TORMENTOR_SOON.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Скоро появится торментор');
    }
    if (isTurboTormentorTime) {
      // TORMENTOR
      _player.play(AssetSource('sounds/TORMENTOR.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)}  Появился торментор');
    }
    if (isTurboLotusTime) {
      // LOTUS
      _player.play(AssetSource('sounds/LOTUS.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Появился лотус');
    }

    // // //

    if (hr == 0 && min == 3 && sec == 32) {
      // 1_TIER
      _player.play(AssetSource('sounds/1_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-1 шмотки');
    }
    if (hr == 0 && min == 8 && sec == 32) {
      // 2_TIER
      _player.play(AssetSource('sounds/2_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-2 шмотки');
    }
    if (hr == 0 && min == 13 && sec == 32) {
      // 3_TIER
      _player.play(AssetSource('sounds/3_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-3 шмотки');
    }
    if (hr == 0 && min == 18 && sec == 22) {
      // 4_TIER
      _player.play(AssetSource('sounds/4_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-4 шмотки');
    }
    if (hr == 0 && min == 30 && sec == 2) {
      // 5_TIER
      _player.play(AssetSource('sounds/5_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-5 шмотки');
    }
  } else {
    if (isTurboTormentorSoonTime) {
      // TORMENTOR_SOON
      _player.play(AssetSource('sounds/TORMENTOR_SOON.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Скоро появится торментор');
    }
    if (isTormentorTime) {
      // TORMENTOR
      _player.play(AssetSource('sounds/TORMENTOR.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)}  Появился торментор');
    }
    if (isLotusTime) {
      // LOTUS
      _player.play(AssetSource('sounds/LOTUS.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Появился лотус');
    }

    // // //

    if (hr == 0 && min == 7 && sec == 2) {
      // 1_TIER
      _player.play(AssetSource('sounds/1_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-1 шмотки');
    }
    if (hr == 0 && min == 17 && sec == 2) {
      // 2_TIER
      _player.play(AssetSource('sounds/2_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-2 шмотки');
    }
    if (hr == 0 && min == 27 && sec == 2) {
      // 3_TIER
      _player.play(AssetSource('sounds/3_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-3 шмотки');
    }
    if (hr == 0 && min == 36 && sec == 42) {
      // 4_TIER
      _player.play(AssetSource('sounds/4_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-4 шмотки');
    }
    if (hr == 1 && min == 0 && sec == 2) {
      // 5_TIER
      _player.play(AssetSource('sounds/5_TIER.mp3'));
      logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Доступны TIER-5 шмотки');
    }
  }

  if (isWisdomRuneSoonTime) {
    // WISDOM_SOON
    _player.play(AssetSource('sounds/WISDOM_SOON.mp3'));
    logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Скоро появится руна мудрости');
  }

  if (isWisdomRuneTime) {
    // WISDOM
    _player.play(AssetSource('sounds/WISDOM.mp3'));
    logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Появилась руна мудрости');
  }

  if (!isWisdomRuneTime) {
    if (isPowerUpRuneTime && isBountyRuneTime) {
      // POWERUP_AND_BOUNTY
      _player.play(AssetSource('sounds/POWERUP_AND_BOUNTY.mp3'));
      logger.i(
        '${dec(hr)}:${dec(min)}:${dec(sec)} Появились руны усиления и богатства',
      );
    } else {
      if (isPowerUpRuneTime) {
        // POWERUP
        _player.play(AssetSource('sounds/POWERUP.mp3'));
        logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Появились руны усиления');
      }
      if (isBountyRuneTime) {
        // BOUNTY
        _player.play(AssetSource('sounds/BOUNTY.mp3'));
        logger.i('${dec(hr)}:${dec(min)}:${dec(sec)} Появились руны богатства');
      }
    }
  }

  if (hr == 0 && min == 0 && sec == 1) {
    // WELCOME
    _player.play(AssetSource('sounds/WELCOME.mp3'));
    logger.i(
      '${dec(hr)}:${dec(min)}:${dec(sec)} К новым свершениям, сэр! Удачи и приятной игры!',
    );
  }
}

checkAegisEvents(int hr, int min, int sec, bool isTurbo) {
  if (isTurbo) {
    if (sec == -10) {
      // ROSHAN_UP_SOON
      _player.play(AssetSource('sounds/ROSHAN_UP_SOON.mp3'));
      logger.w('Рошан скоро встанет');
    }
    if (sec == -60) {
      // ROSHAN_UP
      _player.play(AssetSource('sounds/ROSHAN_UP.mp3'));
      logger.w('Рошан встал');
    }
  } else {
    if (sec == -60) {
      // ROSHAN_UP_SOON
      _player.play(AssetSource('sounds/ROSHAN_UP_SOON.mp3'));
      logger.w('Рошан скоро встанет');
    }
    if (sec == -120) {
      // ROSHAN_UP
      _player.play(AssetSource('sounds/ROSHAN_UP.mp3'));
      logger.w('Рошан встал');
    }
  }

  if (min == 1 && sec == 0) {
    // AEGIS_60
    _player.play(AssetSource('sounds/AEGIS_60.mp3'));
    logger.w('60 до конца Аегиса');
  }
  if (min == 0 && sec == 30) {
    // AEGIS_30
    _player.play(AssetSource('sounds/AEGIS_30.mp3'));
    logger.w('30 до конца Аегиса');
  }
  if (min == 0 && sec == 0) {
    // AEGIS_END
    _player.play(AssetSource('sounds/AEGIS_END.mp3'));
    logger.w('Аегис кончился');
  }
}
