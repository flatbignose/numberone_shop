import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_machine/model/products_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> products = [];

  Future<void> getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<Product> allProducts = data
            .map((product) => Product.fromMap(product as Map<String, dynamic>))
            .toList();
        products = allProducts;
        notifyListeners();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to load products');
    }
  }
}
