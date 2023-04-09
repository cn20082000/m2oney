import 'package:cn_datetime_utils/cn_datetime_utils.dart';
import 'package:cn_structure/cn_structure.dart';

import '../../../widgets/wi_timer/wi_count_down_timer.dart';

class VerificationNotifier extends CnNotifier {
  final timeRemaining = CnRx(5.minute);

  WiCountDownTimer? _timer;

  @override
  Iterable<CnRx> get variables => [
        timeRemaining,
      ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resetTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void resetTimer() {
    _timer?.cancel();
    timeRemaining.value = 5.minute;
    _timer = WiCountDownTimer(
      time: 5.minute,
      step: 1.second,
      callback: (_, remainingTime) {
        if (remainingTime != null) {
          timeRemaining.value = remainingTime;
        }
      },
    );
  }
}
