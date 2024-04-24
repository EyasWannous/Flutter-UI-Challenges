import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_6/constant/review_constant.dart';
import 'package:flutter/material.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => const SizedBox(width: 18),
        itemBuilder: (_, index) {
          if (index == ReviewConstant.reviewImages.length) {
            return CachedNetworkImage(imageUrl: ReviewConstant.addImageUrl);
          }
          return CachedNetworkImage(
              imageUrl: ReviewConstant.reviewImages[index]);
        },
        itemCount: ReviewConstant.reviewImages.length + 1,
      ),
    );
  }
}
