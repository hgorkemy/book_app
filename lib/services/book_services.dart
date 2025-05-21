

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';

final searchQueryProvider = StateProvider<String>((ref) => 'flutter');

final bookListProvider = FutureProvider<List<Book>>((ref) async {
  final query = ref.watch(searchQueryProvider);

  final response = await http.get(
    Uri.parse('https://openlibrary.org/search.json?q=$query'),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<dynamic> docs = data['docs'];

    final books = docs
        .where((e) => e['title'] != null && e['author_name'] != null)
        .map((e) => Book.fromJson({
              'id': e.hashCode,
              'title': e['title'] ?? 'Unknown Title',
              'author': (e['author_name'] as List).first,
              'publisher': (e['publisher'] as List?)?.first ?? 'Unknown Publisher',
              'year': e['first_publish_year'] ?? 0,
              'description': 'Book from OpenLibrary API.',
              'coverImage': e['cover_i'] != null
                  ? 'https://covers.openlibrary.org/b/id/${e['cover_i']}-L.jpg'
                  : 'https://via.placeholder.com/100x150?text=No+Cover',
            }))
        .toList();

    return books;
  } else {
    throw Exception('Failed to load books from API');
  }
});


