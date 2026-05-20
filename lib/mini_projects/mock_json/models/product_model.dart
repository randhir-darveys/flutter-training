class ProductModel {
  final int id;
  final String name;
  final String category;
  final double price;
  final double rating;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
    );
  }
}