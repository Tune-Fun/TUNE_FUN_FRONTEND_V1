import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StateNotifierProvider<TimerStateNotifier, int>((ref) {
  return TimerStateNotifier();
});

class TimerStateNotifier extends StateNotifier<int> {
  TimerStateNotifier() : super(180);

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (state < 1) {
        timer.cancel();
        state = 180;
      } else {
        state = state - 1;
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    state = 180;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
