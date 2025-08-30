import 'package:shared_preferences/shared_preferences.dart';

Future<double> getTotalScore({required String quizTitle}) async {
  final prefs = await SharedPreferences.getInstance();
  double totalScore = 0.0;

  for (int i = 0; i < 3; i++) {
    final score = prefs.getDouble('${quizTitle}_$i') ?? 0.0;
    totalScore += score;
  }

  return totalScore;
}

Future<void> saveErrors(bool q1, bool q2, bool q3) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('q1_error', q1);
  await prefs.setBool('q2_error', q2);
  await prefs.setBool('q3_error', q3);
}

Future<int> getErrors() async {
  final prefs = await SharedPreferences.getInstance();
  //get the number of trues
  final q1 = prefs.getBool('q1_error') ?? false;
  final q2 = prefs.getBool('q2_error') ?? false;
  final q3 = prefs.getBool('q3_error') ?? false;

  int errors = 0;
  if (q1) errors++;
  if (q2) errors++;
  if (q3) errors++;

  return errors;
}

class LocalData {
  LocalData._();

  static final LocalData instance = LocalData._();
  Future setAttempt({required String quizTitle}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(quizTitle, true);
  }

  Future<bool> getAttempt({required String quizTitle}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(quizTitle) ?? false;
  }
}
