import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({
    super.key,
    required this.cardColor,
    required this.shadowColor,
    required this.quizzes,
  });

  final Color cardColor;
  final Color shadowColor;
  final List<Map<String, dynamic>> quizzes;

  @override
  Widget build(BuildContext context) {
    final chartData = quizzes.take(7).toList();

    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: shadowColor, blurRadius: 10, spreadRadius: 1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(isVisible: false),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 100,
            interval: 20,
            axisLabelFormatter: (axisLabelRenderArgs) {
              return ChartAxisLabel('${axisLabelRenderArgs.value}%', null);
            },
          ),
          series: <LineSeries<Map<String, dynamic>, int>>[
            LineSeries<Map<String, dynamic>, int>(
              dataSource: chartData,
              xValueMapper: (quiz, index) => index,
              yValueMapper: (quiz, _) => quiz['score']!.roundToDouble(),
              name: quizzes.isNotEmpty ? quizzes[0]['quiz_name'] : '',
              color: Colors.blue,
              markerSettings: const MarkerSettings(
                isVisible: true,
                shape: DataMarkerType.circle,
                borderWidth: 2,
                borderColor: Colors.blue,
              ),
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.auto,
              ),
            ),
          ],
          tooltipBehavior: TooltipBehavior(
            enable: true,
            format: 'Score: point.y%',
          ),
        ),
      ),
    );
  }
}
