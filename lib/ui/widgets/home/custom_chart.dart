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
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    const style = TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                    );
                    Widget text;
                    switch (value.toInt()) {
                      case 0:
                        text = const Text('Jan', style: style);
                        break;
                      case 1:
                        text = const Text('Feb', style: style);
                        break;
                      case 2:
                        text = const Text('Mar', style: style);
                        break;
                      case 3:
                        text = const Text('Apr', style: style);
                        break;
                      case 4:
                        text = const Text('May', style: style);
                        break;
                      case 5:
                        text = const Text('Jun', style: style);
                        break;
                      case 6:
                        text = const Text('Jul', style: style);
                        break;
                      case 7:
                        text = const Text('Aug', style: style);
                        break;
                      case 8:
                        text = const Text('Sep', style: style);
                        break;
                      default:
                        text = const Text('', style: style);
                        break;
                    }
                    return SideTitleWidget(
                      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
                      space: 4.0,
                      meta: meta,
                      child: text,
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 28,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    const style = TextStyle(
                      color: Colors.black,
                      fontSize: 6,
                    );
                    return Text(value.toString(), style: style);
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
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
                spots: const [
                  FlSpot(0, 3),
                  FlSpot(1, 6),
                  FlSpot(2, 7),
                  FlSpot(3, 4),
                  FlSpot(4, 5),
                  FlSpot(5, 3),
                  FlSpot(6, 6),
                  FlSpot(7, 8),
                  FlSpot(8, 7),
                ],
                isCurved: true,
                color: const Color(0xFFFF4A4A),
                barWidth: 1.19,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFF4A4A).withOpacity(0.5),
                      const Color(0xFFFF4A4A).withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
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
