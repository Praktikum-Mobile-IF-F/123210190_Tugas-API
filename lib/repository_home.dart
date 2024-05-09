import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugasapitpm/modelhome.dart';

class BookService {
  static const String baseUrl = 'https://gutendex.com/books/?page=3';
  static Future<List<Book>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl'));
      final body = response.body;
      final result = jsonDecode(body);
      List<Book> books = List<Book>.from(
        result['results'].map((book) => Book.fromJson(book)),
      );
      return books;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}