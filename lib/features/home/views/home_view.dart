import 'package:flutter/material.dart';
import 'package:uniapp/features/home/views/widgets/analytics_section.dart';
import 'package:uniapp/features/home/views/widgets/custom_app_bar.dart';
import 'package:uniapp/features/home/views/widgets/custom_layout.dart';
import 'package:uniapp/features/home/views/widgets/recent_quiz.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: [
                  const RecentQuizContainer(),
                  const SizedBox(height: 20),
                  const SizedBox(height: 220, child: ButtonRowLayout()),
                  const SizedBox(height: 20),
                  AnalyticsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
