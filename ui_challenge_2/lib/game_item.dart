import 'package:flutter/material.dart';

class GameModel {
  final String image;
  final String title;
  final String subtitle;

  GameModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

class GameItemWidget extends StatelessWidget {
  final double itemWidth;
  final double itemHeight;
  final GameModel gameModel;

  const GameItemWidget({
    super.key,
    this.itemWidth = 188.0,
    this.itemHeight = 200.0,
    required this.gameModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth,
      height: itemHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            gameModel.image,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gameModel.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  gameModel.subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
