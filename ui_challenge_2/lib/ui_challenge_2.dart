// ignore_for_file: public_member_api_docs, sort_constructors_first
library ui_challenge_1;

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

import 'package:ui_challenge_2/new_games_section.dart';
import 'package:ui_challenge_2/stories_section.dart';

import 'heading_section.dart';
import 'popular_games_section.dart';
import 'recommended_games_section.dart';

class UiChallenge2 extends StatefulWidget {
  const UiChallenge2({super.key});

  @override
  UiChallenge2State createState() => UiChallenge2State();
}

class UiChallenge2State extends State<UiChallenge2> {
  int navPos = 2;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          IndexedStack(
            index: navPos,
            children: const [
              TextScreen(text: "Search"),
              TextScreen(text: "Favorites"),
              HomeScreen(),
              TextScreen(text: "Notifications"),
              TextScreen(text: "Settings"),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              onTap: (pos) {
                setState(() {
                  navPos = pos;
                });
              },
              index: navPos,
              items: const [
                CurvedNavigationBarItem(
                  child: Icon(Icons.search),
                  label: 'search',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.star),
                  label: 'star',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.home),
                  label: 'home',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.notifications),
                  label: 'notifications',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.settings),
                  label: 'settings',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: const [
            SafeArea(child: HeadingSection()),
            StoriesSection(),
            SizedBox(
              height: 22,
            ),
            PopularGamesSection(),
            RecommendedGamesSection(),
            NewGamesSection(),
            SizedBox(
              height: 120,
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.white, blurRadius: 30, spreadRadius: 40)
            ]),
          ),
        )
      ],
    );
  }
}

class TextScreen extends StatelessWidget {
  final String text;

  const TextScreen({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}
