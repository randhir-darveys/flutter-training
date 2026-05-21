import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserService {
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data
          .map((json) => UserModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}


// Explanation:

// UserService API layer hai. Ye HTTP GET request karta hai, JSON response decode karta hai, aur model objects me convert karta hai.
//
//
// Why dart:convert
// import 'dart:convert';
//
// API returns: JSON string
//
// Need: Dart objects
//
// Conversion: jsonDecode(response.body)
//
// Why http
// import 'package:http/http.dart' as http;
//
// For API request:
//
// GET
// POST
// PUT
// DELETE
//
// Now:
//
// http.get()
// Why Future
// Future<List<UserModel>>
//
// API instantly data nahi deta.
//
// Flow:
//
// Request sent
// wait
// response comes later
//
// So async operation = Future.
//
// async / await
// async
// await
//
// Meaning:
//
// wait for response
// without blocking UI
// Status code check
// if (response.statusCode == 200)
//
// 200 = success
//
// Else:
//
// throw Exception(...)
//
// Error handling.
//
// JSON parsing
//
// API:
//
// [
// {
// "id": 1,
// "name": "Leanne Graham"
// }
// ]
//
// Convert: jsonDecode(response.body)
//
// Then: UserModel.fromJson(json)