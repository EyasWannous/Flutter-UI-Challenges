import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'top_section.dart';

class LineChartWidget2 extends StatelessWidget {
  const LineChartWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopSectionWidget(
          title: 'Line Graph',
          legends: [
            Legend(title: 'Omuk', color: const Color(0xFF5974FF)),
            Legend(
              title: 'Tomuk',
              color: const Color(0xFFFF3E8D),
            ),
          ],
          padding: const EdgeInsets.only(left: 8, right: 18, top: 8, bottom: 8),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 18, top: 18, bottom: 18),
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 40),
                      FlSpot(1, 50),
                      FlSpot(2, 60),
                      FlSpot(3, 48),
                      FlSpot(4, 36),
                      FlSpot(5, 58),
                      FlSpot(6, 80),
                      FlSpot(7, 40),
                      FlSpot(8, 31),
                      FlSpot(9, 22),
                      FlSpot(10, 71),
                      FlSpot(11, 120),
                    ],
                    dotData: const FlDotData(show: false),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF26B5), Color(0xFFFF5B5B)],
                    ),
                    isCurved: false,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: const LinearGradient(
                        colors: [Color(0x10FF26B5), Color(0x00FF26B5)],
                        begin: FractionalOffset(0.5, 0),
                        end: FractionalOffset(0.5, 1),
                      ),
                    ),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 20),
                      FlSpot(1, 36),
                      FlSpot(2, 60),
                      FlSpot(3, 40),
                      FlSpot(4, 80),
                      FlSpot(5, 90),
                      FlSpot(6, 50),
                      FlSpot(7, 42),
                      FlSpot(8, 64),
                      FlSpot(9, 68),
                      FlSpot(10, 100),
                      FlSpot(11, 95),
                    ],
                    dotData: const FlDotData(show: false),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF905BFF), Color(0xFF268AFF)],
                    ),
                    isCurved: false,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: const LinearGradient(
                        colors: [Color(0x1f268AFF), Color(0x00268AFF)],
                        begin: FractionalOffset(0.5, 0),
                        end: FractionalOffset(0.5, 1),
                      ),
                    ),
                  ),
                ],
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 6,
                      showTitles: true,
                      getTitlesWidget: (xValue, titleMeta) {
                        switch (xValue.toInt()) {
                          case 0:
                            return const Text('Jan');
                          case 1:
                            return const Text('Feb');
                          case 2:
                            return const Text('Mar');
                          case 3:
                            return const Text('Apr');
                          case 4:
                            return const Text('May');
                          case 5:
                            return const Text('Jun');
                          case 6:
                            return const Text('Jul');
                          case 7:
                            return const Text('Aug');
                          case 8:
                            return const Text('Sep');
                          case 9:
                            return const Text('Oct');
                          case 10:
                            return const Text('Nov');
                          case 11:
                            return const Text('Dec');
                          default:
                            throw StateError('Not supported');
                        }
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      reservedSize: 32,
                    ),
                  ),
                ),
                maxY: 140,
                minY: 0,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
