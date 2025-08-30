import 'package:flutter/material.dart';
import 'package:uniapp/features/quizzes/views/widgets/quiz_question_card.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.onPressed,
    required this.isAnswering,
    this.answerFeedback,
  });
  final void Function() onPressed;
  final bool isAnswering;
  final String? answerFeedback;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: isAnswering ? Colors.blue : primaryRed,
      child: Icon(
        isAnswering
            ? Icons.stop
            : answerFeedback != null
            ? Icons.arrow_forward
            : Icons.mic,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
