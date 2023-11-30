// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_machine/Presentation/widgets/rating.dart';
import 'package:one_machine/core/color_text.dart';
import 'package:one_machine/model/products_model.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    Key? key,
    this.data,
  }) : super(key: key);
  final Product? data;

  @override
  Widget build(BuildContext context) {
    final double rating = data!.rating.rate;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 2,
              width: double.infinity,
              child: CachedNetworkImage(
                  imageUrl: data!.image, fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data!.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  height10,
                  Text(
                    "\$${data!.price.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: greenF),
                  ),
                  height10,
                  //Ratings stars and count of ratings given
                  RatingPer(rating: rating, data: data),
                  height10,
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 223, 223, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      data!.description,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  height10,
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
