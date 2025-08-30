import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniapp/features/quizzes/data/local_data.dart';

class CompletedService {
  CompletedService._();
  static CompletedService instance = CompletedService._();

  final supabase = Supabase.instance.client;
  setRecentQuiz({
    required String quizTitle,
    required double score,
    required dynamic time,
    required dynamic errors,
  }) async {
    await supabase.from('recent_quiz').insert({
      'score': score.floor(),
      'quiz_name': quizTitle,
      'errors': errors,
      'time': time,
    });
  }

  setQuizAnalyticsForQuiz({
    required String quizTitle,
    required double score,
    required dynamic time,
  }) async {
    final errors = await getErrors();
    final attempts = await LocalData.instance.getAttempt(quizTitle: quizTitle);
    await supabase.from('quiz_analytics').insert({
      'quiz_name': quizTitle,
      'score': score,
      'errors': errors,
      'attempts': attempts ? 1 : 0,
      'quiz_time': time,
      'questions': 3,
    });
  }
}
