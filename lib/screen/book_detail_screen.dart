import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                   book.coverImage,
  height: 250,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    return Container(
      height: 250,
      color: Colors.grey.shade300,
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.broken_image, size: 60, color: Colors.grey),
          SizedBox(height: 8),
          Text('No Cover Available', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                book.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text("Author: ${book.author}"),
              Text("Publisher: ${book.publisher}"),
              Text("Year: ${book.year}"),
              const SizedBox(height: 16),
              const Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(book.description),
            ],
          ),
        ),
      ),
    );
  }
}
