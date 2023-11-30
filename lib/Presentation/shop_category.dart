import 'package:flutter/material.dart';
import 'package:one_machine/Presentation/product_desc.dart';
import 'package:one_machine/provider.dart';
import 'package:one_machine/Presentation/widgets/product_grid.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 223, 223, 1),
        elevation: 1,
        title: const Text(
          'NumberOne Shop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, providerModel, _) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.52,
            ),
            itemBuilder: (context, index) {
              final data = providerModel.products[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleProduct(
                                data: data,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 0.3)
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ProductGrid(data: data),
                  ),
                ),
              );
            },
            itemCount: providerModel.products.length,
          );
        },
      ),
    );
  }
}
