import 'dart:async';

class WiCountDownTimer {
  final Duration? time;
  final Duration step;
  late Timer _timer;
  void Function(Duration passedTime, Duration? remainingTime)? callback;

  WiCountDownTimer({this.time, required this.step, this.callback}) {
    _timer = Timer.periodic(step, (timer) {
      if (time != null && step * timer.tick > time!) {
        timer.cancel();
      }
      callback?.call(
        step * timer.tick,
        time != null ? time! - (step * timer.tick) : null,
      );
      if (time != null && step * timer.tick == time!) {
        timer.cancel();
      }
    });
  }

  void cancel() {
    _timer.cancel();
  }
}
