import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenge_7/my_theme_model.dart';

import 'top_section.dart';

class BarChartWidget1 extends StatelessWidget {
  const BarChartWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeModel>(
      builder: (context, themeModel, child) {
        BarChartRodData makeRodData(double y) {
          return BarChartRodData(
            toY: y,
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFAB5E),
                Color(0xFFFFD336),
              ],
            ),
            width: 14,
            borderRadius: BorderRadius.circular(2),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              color: themeModel.isDark()
                  ? const Color(0xFF1D1D2B)
                  : const Color(0xFFFCFCFC),
              toY: 140,
            ),
          );
        }

        return Column(
          children: [
            const TopSectionWidget(
              title: 'Bar Graph',
              legends: [],
              padding: EdgeInsets.only(left: 8, right: 18, top: 8, bottom: 8),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 18, top: 18, bottom: 18),
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [makeRodData(20)]),
                      BarChartGroupData(x: 1, barRods: [makeRodData(40)]),
                      BarChartGroupData(x: 2, barRods: [makeRodData(30)]),
                      BarChartGroupData(x: 3, barRods: [makeRodData(60)]),
                      BarChartGroupData(x: 4, barRods: [makeRodData(75)]),
                      BarChartGroupData(x: 5, barRods: [makeRodData(35)]),
                      BarChartGroupData(x: 6, barRods: [makeRodData(42)]),
                      BarChartGroupData(x: 7, barRods: [makeRodData(33)]),
                      BarChartGroupData(x: 8, barRods: [makeRodData(60)]),
                      BarChartGroupData(x: 9, barRods: [makeRodData(90)]),
                      BarChartGroupData(x: 10, barRods: [makeRodData(86)]),
                      BarChartGroupData(x: 11, barRods: [makeRodData(120)]),
                    ],
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
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
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                  ),
                  swapAnimationDuration: Duration.zero,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
