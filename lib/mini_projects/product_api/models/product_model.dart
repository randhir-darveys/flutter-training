class ProductModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;
  final double rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
      rating: json['rating']['rate'].toDouble(),
    );
  }
}

// Explanation:

// Is model me nested JSON parsing use hui hai. API ka rating object directly map karke ProductModel me convert kiya gaya.

// Nested JSON parsing

// Normal: json['title']

// Nested: json['rating']['rate']

// Meaning: rating object ke andar rate key

// Example:

// "rating": {
// "rate": 4.5
// }

// Access: json['rating']['rate']