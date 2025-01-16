import 'dart:convert';

class Product {
  final int id;
  final String image;
  final String name;
  final String description;
  final double price;
  final String category;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });

  //leer json
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
    );
  }

  static List<Product> parseProducts(String jsonString) {
    final parsed = json.decode(jsonString)['products'] as List<dynamic>;
    return parsed.map((json) => Product.fromJson(json)).toList();
  }
}
