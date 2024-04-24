import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class JuiceDetailsPage extends StatefulWidget {
  final JuiceEntity juice;

  const JuiceDetailsPage(this.juice, {super.key});

  @override
  JuiceDetailsPageState createState() => JuiceDetailsPageState();
}

class JuiceDetailsPageState extends State<JuiceDetailsPage> {
  var count = 0;
  double bottomSectionHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: bottomSectionHeight),
            children: [
              AspectRatio(
                aspectRatio: 0.86,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final imageHeight = constraints.maxHeight * 0.7;
                    final imageHorizontalMargin = constraints.maxWidth * 0.15;
                    final imageBottomMargin = constraints.maxHeight * 0.07;
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: widget.juice.color,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          margin: const EdgeInsets.only(bottom: 26),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: imageHorizontalMargin,
                                right: imageHorizontalMargin,
                                bottom: imageBottomMargin,
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://flutter4fun.com/wp-content/uploads/2021/09/full.png',
                                height: imageHeight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CounterWidget(
                            currentCount: count,
                            color: widget.juice.color,
                            onIncreaseClicked: () {
                              setState(() {
                                count++;
                              });
                            },
                            onDecreaseClicked: () {
                              setState(() {
                                count--;
                              });
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Besom Orange Juice',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SimpleRatingBar(),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Drinking Orange Juice is not only enhances health body also strengthens muscles',
                      style: TextStyle(
                        color: Color(0xFFB0B1B4),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xFFD81C33),
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    ReviewsList(),
                  ],
                ),
              )
            ],
          ),
          Container(
            color: widget.juice.color,
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 26,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://flutter4fun.com/wp-content/uploads/2021/09/back.png',
                    width: 32,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(
                  'Besom.',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                CachedNetworkImage(
                  imageUrl:
                      'https://flutter4fun.com/wp-content/uploads/2021/09/shop_white.png',
                  width: 32,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: bottomSectionHeight,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '25.99',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 48,
                    child: MyButton(
                      text: 'Buy Now',
                      bgColor: widget.juice.color,
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
