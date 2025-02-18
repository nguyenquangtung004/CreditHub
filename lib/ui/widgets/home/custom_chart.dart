import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomChartLine extends StatelessWidget {
  const CustomChartLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: 20.0),
        color: Colors.white,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                interval: 1,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Jan';
                    case 1:
                      return 'Feb';
                    case 2:
                      return 'Mar';
                    case 3:
                      return 'Apr';
                    case 4:
                      return 'May';
                    case 5:
                      return 'Jun';
                    case 6:
                      return 'Jul';
                    case 7:
                      return 'Aug';
                    case 8:
                      return 'Sep';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: 1,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.black,
                  fontSize: 6,
                ),
              ),
              rightTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),

                          ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.white, width: 1),
            ),
            minX: 0,
            maxX: 8,
            minY: 0,
            maxY: 10,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 3),
                  const FlSpot(1, 6),
                  const FlSpot(2, 7),
                  const FlSpot(3, 4),
                  const FlSpot(4, 5),
                  const FlSpot(5, 3),
                  const FlSpot(6, 6),
                  const FlSpot(7, 8),
                  const FlSpot(8, 7),
                ],
                isCurved: true,
                colors: [const Color(0xFFFF4A4A)],
                barWidth: 1.19, // Độ rộng của đường
                isStrokeCapRound: true,
                belowBarData: BarAreaData(
                  show: true,
                  // Thêm gradient vào đây
                  gradientFrom: const Offset(0, 0),
                  gradientTo: const Offset(0, 1),
                  colors: [
                    const Color(0xFFFF4A4A).withOpacity(0.5),
                    const Color(0xFFFF4A4A).withOpacity(0.0),
                  ],
                ),
                dotData: FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
