// quiz_service.dart
// import 'dart:async';
// import 'package:deepgram_speech_to_text/deepgram_speech_to_text.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uniapp/features/quizzes/data/local_data.dart';
// import 'package:uniapp/features/quizzes/data/quizzes_service.dart';

import 'dart:async';
import 'package:uniapp/features/quizzes/data/quizzes_service.dart';

class QuizServiceinFront {
  final QuizService _quizService = QuizService.instance;

  Future<List<String>> loadQuestions({required String quizTitle}) async {
    try {
      final selectedQuestions = await _quizService.getSelectedQuestions(
        quizTitle: quizTitle,
      );
      if (selectedQuestions.isEmpty) {
        throw Exception('No questions available');
      }
      return selectedQuestions;
    } catch (e) {
      throw Exception('Failed to load questions: ${e.toString()}');
    }
  }
}
