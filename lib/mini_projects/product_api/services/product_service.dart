import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

// Explanation:
// ProductService API layer hai jo fake store API se products fetch karta hai aur ProductModel list me convert karta hai.

// Ye exactly Users API jaisa hai, but difference:
//
// Users: Simple JSON
//
// Products: Complex JSON + nested objects
//
// Flow:

// API request
// ↓
// JSON response
// ↓
// jsonDecode()
// ↓
// List<ProductModel>
// ↓
// UI render