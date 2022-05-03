import 'dart:async';

typedef TickerCallback = Function(int tick);

class Ticker {
  Timer? _timer;

  Duration? _duration;
  TickerCallback? _onTick;

  void start({
    required Duration duration,
    required TickerCallback onTick,
  }) {
    if (_timer != null) return;
    _onTick = onTick;
    _duration = duration;
    _timer = Timer.periodic(duration, (_t) {
      onTick(_t.tick);
    });
  }

  void update({Duration? duration, TickerCallback? onTick}) {
    if (_timer == null) return;
    dispose();
    start(duration: duration ?? _duration!, onTick: onTick ?? _onTick!);
  }

  void dispose() {
    if (_timer == null) return;
    if (_timer!.isActive) {
      _timer!.cancel();
    }
    _timer = null;
  }
}
