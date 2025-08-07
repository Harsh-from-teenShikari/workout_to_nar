import 'package:flutter/material.dart';

class SessionTimer extends StatefulWidget {
  final Duration initialDuration;
  final VoidCallback? onComplete;
  const SessionTimer({Key? key, required this.initialDuration, this.onComplete}) : super(key: key);

  @override
  State<SessionTimer> createState() => _SessionTimerState();
}

class _SessionTimerState extends State<SessionTimer> {
  late Duration remaining;
  late bool running;
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    remaining = widget.initialDuration;
    running = false;
    _ticker = Ticker(_onTick);
  }

  void _onTick(Duration elapsed) {
    if (!running) return;
    setState(() {
      remaining = widget.initialDuration - elapsed;
      if (remaining <= Duration.zero) {
        running = false;
        remaining = Duration.zero;
        widget.onComplete?.call();
        _ticker.stop();
      }
    });
  }

  void _start() {
    if (!running) {
      running = true;
      _ticker.start();
    }
  }

  void _pause() {
    if (running) {
      running = false;
      _ticker.stop();
    }
  }

  void _reset() {
    setState(() {
      remaining = widget.initialDuration;
      running = false;
      _ticker.stop();
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${remaining.inMinutes}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')}',
            style: Theme.of(context).textTheme.headlineMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.play_arrow), onPressed: _start),
            IconButton(icon: Icon(Icons.pause), onPressed: _pause),
            IconButton(icon: Icon(Icons.replay), onPressed: _reset),
          ],
        ),
      ],
    );
  }
}

class Ticker {
  final void Function(Duration) onTick;
  Duration _elapsed = Duration.zero;
  bool _active = false;
  late final Stopwatch _stopwatch;

  Ticker(this.onTick) {
    _stopwatch = Stopwatch();
  }

  void start() {
    if (_active) return;
    _active = true;
    _stopwatch.start();
    _tick();
  }

  void stop() {
    _active = false;
    _stopwatch.stop();
  }

  void dispose() {
    stop();
  }

  void _tick() async {
    while (_active) {
      await Future.delayed(Duration(seconds: 1));
      if (_active) {
        _elapsed = _stopwatch.elapsed;
        onTick(_elapsed);
      }
    }
  }
}