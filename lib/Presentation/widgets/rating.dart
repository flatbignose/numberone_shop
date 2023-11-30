import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_machine/core/color_text.dart';
import 'package:one_machine/model/products_model.dart';

class RatingPer extends StatelessWidget {
  const RatingPer({
    super.key,
    required this.rating,
    required this.data,
  });

  final double rating;
  final Product? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          ignoreGestures: true,
          itemCount: 5,
          itemPadding:
              const EdgeInsets.symmetric(horizontal: 2),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
        width10,
        Text(
          '(${data!.rating.count} ratings)',
          style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}