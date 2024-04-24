import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenge_7/my_theme_model.dart';

class TopSectionWidget extends StatelessWidget {
  final String title;
  final List<Legend> legends;
  final EdgeInsets padding;

  const TopSectionWidget({
    super.key,
    required this.title,
    required this.legends,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeModel>(
      builder: (context, themeModel, child) {
        return Container(
          height: 20,
          margin: padding,
          child: Row(
            children: [
              Text(title, style: TextStyle(color: themeModel.isDark() ? const Color(0xFF9595A4) : const Color(0xFF040420), fontWeight: FontWeight.bold, fontSize: 12)),
              Expanded(flex: 5, child: Container()),
              ...legends
                  .map(
                    (e) => Row(
                  children: [
                    _LegendWidget(legend: e),
                    const SizedBox(width: 12)
                  ],
                ),
              )
                  ,
              Expanded(flex: 1, child: Container()),
              const Text('2019', style: TextStyle(color: Color(0xFFA7A7B7))),
            ],
          ),
        );
      },
    );
  }
}

class _LegendWidget extends StatelessWidget {
  final Legend legend;

  const _LegendWidget({
    required this.legend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: legend.color,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        ),
        const SizedBox(width: 4),
        Text(legend.title, style: const TextStyle(color: Color(0xFFA7A7B7))),
      ],
    );
  }
}

class Legend {
  final String title;
  final Color color;

  Legend({
    required this.title,
    required this.color,
  });
}
