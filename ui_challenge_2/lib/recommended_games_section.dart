import 'package:flutter/material.dart';
import 'package:ui_challenge_2/sizes.dart';

import 'game_item.dart';
import 'horizontal_snapping_list.dart';

final game1 = GameModel(
  image: 'assets/images/game1.png',
  title: 'Road Fight',
  subtitle: 'Shooting Cars',
);

final game2 = GameModel(
  image: 'assets/images/game2.png',
  title: 'Vikings',
  subtitle: 'Sons of Ragnar',
);

List<GameModel> games = [
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
];

class RecommendedGamesSection extends StatelessWidget {

  final itemSize = 142.0;

  const RecommendedGamesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: pagePadding),
          child: Row(
            children: [
              const Text('Recommended Games', style: TextStyle(color: Colors.black, fontSize: 22)),
              Expanded(child: Container()),
              const Text(
                'View All',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8,),
        HorizontalSnappingList(
          listHeight: itemSize,
          itemWidth: itemSize,
          itemHorizontalMargin: 0,
          itemCount: games.length,
          itemBuilder: (context, i) {
            return GameItemWidget(
              gameModel: games[i],
              itemWidth: itemSize,
              itemHeight: itemSize,
            );
          },
        )
      ],
    );
  }
}