import 'dart:async';

import 'package:flutter/material.dart';

class Delayer {
  final int milliseconds;
  Timer? _timer;

  Delayer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
