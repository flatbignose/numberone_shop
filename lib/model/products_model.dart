class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      price: (map['price'] as num).toDouble(),
      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: Rating.fromMap(map['rating']),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: (map['rate'] as num).toDouble(),
      count: map['count'],
    );
  }
}
