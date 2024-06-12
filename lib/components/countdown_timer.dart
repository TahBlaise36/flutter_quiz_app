import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quiz_app/constanst/colors.dart';

class CountdownTimer extends StatefulWidget {
  final int duration; // Duration of the timer in seconds
  final VoidCallback onTimerEnd; // Callback to handle timer end

  const CountdownTimer({
    super.key,
    required this.duration,
    required this.onTimerEnd,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        widget.onTimerEnd();
        _timer?.cancel();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Transform.translate(
        offset: const Offset(0, -20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          // height: 60,
          // width: 60,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('lib/images/quiz_bg4.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _formatTime(_remainingTime),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
