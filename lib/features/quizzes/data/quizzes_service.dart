import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniapp/features/quizzes/data/gemini_service.dart';

class QuizService {
  QuizService._();
  static final QuizService instance = QuizService._();
  final SupabaseClient supabase = Supabase.instance.client;
  final GeminiService gemini = GeminiService();

  Future<List<String>> getSelectedQuestions({required String quizTitle}) async {
    try {
      final response = await supabase
          .from("quizzzes_final")
          .select(quizTitle)
          .not(quizTitle, 'is', null)
          .neq(quizTitle, '');

      if (response.isEmpty) return [];

      final selected = await gemini.selectQuizQuestions(response, 3);
      return selected.take(3).toList();
    } catch (e) {
      debugPrint('Error getting questions: $e');
      return [];
    }
  }

  Future<Map> evaluateUserAnswer(String question, String answer) async {
    return await gemini.evaluateAnswer(question, answer);
  }
}
