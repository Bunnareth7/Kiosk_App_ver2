import 'dart:async';

import 'package:flutter/material.dart';


class TripleTapDetector extends StatefulWidget {
  const TripleTapDetector({
    super.key,
    required this.child,
    required this.onTripleTap,
    this.window = const Duration(milliseconds: 1500),
  });

  final Widget child;
  final VoidCallback onTripleTap;
  final Duration window;

  @override
  State<TripleTapDetector> createState() => _TripleTapDetectorState();
}

class _TripleTapDetectorState extends State<TripleTapDetector> {
  int _tapCount = 0;
  Timer? _resetTimer;

  void _handleTap() {
    _tapCount++;
    _resetTimer?.cancel();

    if (_tapCount >= 3) {
      _tapCount = 0;
      widget.onTripleTap();
      return;
    }

    _resetTimer = Timer(widget.window, () {
      _tapCount = 0;
    });
  }

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: widget.child,
    );
  }
}