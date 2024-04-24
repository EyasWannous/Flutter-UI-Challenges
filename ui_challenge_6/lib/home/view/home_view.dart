import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_6/constant/juice_constant.dart';
import 'package:challenge_6/juice/view/juice_details_page.dart';
import 'package:flutter/material.dart';

import '../../juice/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 38,
                margin: const EdgeInsets.only(
                  left: 20,
                  top: 32,
                  right: 20,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://flutter4fun.com/wp-content/uploads/2021/09/menu.png',
                    ),
                    const Text(
                      'Besom',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          'https://flutter4fun.com/wp-content/uploads/2021/09/bag.png',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                      right: 20,
                      bottom: 100,
                    ),
                    itemBuilder: (context, index) {
                      final juice = JuiceConstant.juiceList[index];
                      return JuiceWidget(
                        juice,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => JuiceDetailsPage(juice),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: JuiceConstant.juiceList.length,
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                height: 64,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 18.0,
                    sigmaY: 18.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://flutter4fun.com/wp-content/uploads/2021/09/Home.png',
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            'https://flutter4fun.com/wp-content/uploads/2021/09/Search.png',
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            'https://flutter4fun.com/wp-content/uploads/2021/09/Heart.png',
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            'https://flutter4fun.com/wp-content/uploads/2021/09/account.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
