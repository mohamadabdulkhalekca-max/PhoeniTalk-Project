import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://isjjhzsttxvwmrxiumpz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzampoenN0dHh2d21yeGl1bXB6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQwMzA1OTgsImV4cCI6MjA2OTYwNjU5OH0.WO16feFQCu3RJoCPtLiZ3UHQbu3LcOvMn46yfvV0-eQ',
  );

  runApp(const MainApp());
}
