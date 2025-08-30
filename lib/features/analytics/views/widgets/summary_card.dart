import 'package:flutter/material.dart';
import 'package:uniapp/features/analytics/views/widgets/summary_stat.dart';

class SummaryCard extends StatelessWidget {
  final int totalAttempts;
  final double avgScore;
  final double avgCompletion;
  final String time;

  const SummaryCard({
    super.key,
    required this.totalAttempts,
    required this.avgScore,
    required this.avgCompletion,
    required,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final completionProgress = avgCompletion / 100;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SummaryStat(
                value: '$totalAttempts',
                label: 'Total Attempts',
                icon: Icons.assignment_turned_in,
                color: Colors.blue,
              ),
              SummaryStat(
                value: '${avgScore.toStringAsFixed(1)}%',
                label: 'Avg. Score',
                icon: Icons.star,
                color: Colors.amber,
              ),
              SummaryStat(
                value: time.isEmpty ? '0s' : time,
                label: 'Time',
                icon: Icons.timer_outlined,
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: completionProgress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
              _getCompletionColor(completionProgress),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overall Progress',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Text(
                '${avgCompletion.toStringAsFixed(0)}%', // Use directly without *100
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getCompletionColor(double value) {
    if (value > 0.8) return Colors.green;
    if (value > 0.6) return Colors.amber;
    return Colors.red;
  }
}
