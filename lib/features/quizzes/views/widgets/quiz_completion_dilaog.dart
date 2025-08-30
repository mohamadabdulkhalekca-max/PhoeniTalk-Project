import 'package:flutter/material.dart';

class QuizCompletionDialog extends StatelessWidget {
  const QuizCompletionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("🎉 Quiz Complete!"),
      content: const Text("You've finished all questions."),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Close"),
        ),
      ],
    );
  }
}
