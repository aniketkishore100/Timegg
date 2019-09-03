import 'dart:async';

class EggTimer {
  EggTimerState state = EggTimerState.ready;
  final Duration maxTime;
  final Stopwatch stopwatch = new Stopwatch();
  Duration _currentTime = const Duration(seconds: 0);
  Duration lastStartTime = const Duration(seconds: 0);

  EggTimer({this.maxTime});

  get currentTime {
    return _currentTime;
  }

  set currentTime(newTime) {
    if (state == EggTimerState.ready) {
      _currentTime = newTime;
    }
  }

  resume() {
    state = EggTimerState.running;
    lastStartTime = currentTime;
    stopwatch.start();
    _tick();
  }

  pause() {}
  _tick() {
    print("currentTime:${_currentTime.inSeconds}");
    _currentTime = lastStartTime - stopwatch.elapsed;

    if (_currentTime.inSeconds > 0) {
      Timer(Duration(seconds: 1), _tick);
    } else {
      state = EggTimerState.ready;
    }
  }
}

enum EggTimerState {
  ready,
  running,
  paused,
}
