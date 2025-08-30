import 'package:flutter/material.dart';
import 'package:uniapp/features/analytics/views/widgets/analytics_view_body.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Analytics"),
        backgroundColor: Colors.red,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      body: AnalyticsViewBody(),
    );
  }
}
