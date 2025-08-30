import 'package:flutter/material.dart';

class QuizLoading extends StatelessWidget {
  const QuizLoading({super.key, required this.primaryRed});

  final Color primaryRed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: primaryRed, strokeWidth: 3),
            const SizedBox(height: 16),
            Text(
              'AI is selecting the best questions...',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
