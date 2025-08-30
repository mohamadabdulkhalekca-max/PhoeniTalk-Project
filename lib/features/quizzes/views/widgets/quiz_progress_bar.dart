import 'package:flutter/material.dart';

class QuizProgressBar extends StatelessWidget {
  final double progress;
  static const Color primaryRed = Color(0xFFE53935);

  const QuizProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: LinearProgressIndicator(
          value: progress,
          minHeight: 8,
          backgroundColor: Colors.red.shade100,
          valueColor: const AlwaysStoppedAnimation<Color>(primaryRed),
        ),
      ),
    );
  }
}
