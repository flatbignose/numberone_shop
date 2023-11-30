import 'package:flutter/material.dart';
import 'package:one_machine/core/color_text.dart';
import 'package:one_machine/model/products_model.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    this.data,
  });

  final Product? data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 2,
      height: size.height * 0.5,
      child: Column(
        children: [
          Container(
            width: size.width / 2,
            height: size.height / 3.2,
            decoration: BoxDecoration(
                color: white,
                image: DecorationImage(
                    image: NetworkImage(data!.image), fit: BoxFit.contain)),
          ),
          Text(
            data!.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Text(
          //   data!.category,
          //   style: TextStyle(
          //       overflow: TextOverflow.ellipsis,
          //       fontWeight: FontWeight.w600,
          //       color: Colors.grey.shade800),
          // ),
          Text(
            '₹${data!.price}',
            style: const TextStyle(
                fontSize: 18, color: greenF, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  decoration: BoxDecoration(
                    color: greenF,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    data!.rating.rate.toString(),
                    style: subTstyle,
                  )),
              width5,
              Text(
                '(${data!.rating.count.toString()})',
                style: subTstyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
