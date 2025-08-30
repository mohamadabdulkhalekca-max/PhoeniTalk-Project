import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String _apiKey = 'AIzaSyCa0HZX847sYuv4bOIVy4U6yH0UplwJuTM';
  final List<Map<String, String>> _conversationHistory = [];

  Future<List<String>> selectQuizQuestions(
    List<dynamic> allQuestions,
    int count,
  ) async {
    if (_conversationHistory.isNotEmpty) {
      _conversationHistory.clear();
    }
    final prompt = '''
    From the following quiz questions, select  $count questions 
    . 
    choose them super random ones.
    Return only the question texts in a JSON array:
   dont add the \'\'\' json thing just stright to the point as an api
   always choose diffrent questions. other than you selected as well. 
    All Questions: ${jsonEncode(allQuestions)},
    ''';

    try {
      final response = await http.post(
        Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent',
        ),
        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': _apiKey,
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': prompt},
              ],
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final text =
            responseData['candidates'][0]['content']['parts'][0]['text'];
        _conversationHistory.add({'role': 'assistant', 'content': text});

        return List<String>.from(jsonDecode(text));
      }
      return [];
    } catch (e) {
      print('Gemini API error: $e');
      return [];
    }
  }

  Future<Map> evaluateAnswer(String question, String answer) async {
    final prompt = '''
Evaluate whether the answer is correct for the following question.

Question: $question
Answer: $answer

Respond only with a JSON map containing:
- "status": true or false
- "feedback": a brief explanation (2 sentences max), and like your talking to the person directly., 
dont tell him to allaborate again, just a feedback.
Do not include any code fences, extra formatting, or explanations. Return only the JSON object.
and also dont be strict. even if he replyed with 1 word check if its relevent or nah.
dont add the \'\'\' json thing just stright to the point as an api.
''';
    _conversationHistory.add({'role': 'user', 'content': prompt});

    try {
      final response = await http.post(
        Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent',
        ),
        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': _apiKey,
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': prompt},
              ],
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        print("body: ${response.body}");
        final responseData = jsonDecode(response.body);
        final innerJson = jsonDecode(
          responseData['candidates'][0]['content']['parts'][0]['text'],
        );
        _conversationHistory.add({
          'role': 'assistant',
          'content': innerJson['feedback'],
        });

        final status = innerJson['status'];
        final feedback = innerJson['feedback'];

        debugPrint(status.toString());
        debugPrint(feedback.toString());
        return {'status': status, 'feedback': feedback};
      }
      return {};
    } catch (e) {
      debugPrint('Gemini error: $e');
      return {};
    }
  }

  void clearHistory() {
    _conversationHistory.clear();
  }
}
