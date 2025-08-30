import 'package:supabase_flutter/supabase_flutter.dart';

class QuizAnalyticsService {
  QuizAnalyticsService._();
  static final QuizAnalyticsService instance = QuizAnalyticsService._();
  final tables = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getQuizAnalytics() async {
    final response = await tables
        .from('quiz_analytics')
        .select()
        .eq('user_id', Supabase.instance.client.auth.currentUser!.id);

    return response;
  }
}
