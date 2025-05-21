import 'package:flutter/material.dart';

class ImprintScreen extends StatelessWidget {
  const ImprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('📚 Book App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('Developed by:  Halil Görkem Yiğit and Egemen Tımbıl'),
            SizedBox(height: 8),
            Text(
                'E-mail: halilgorkemyigit@gmail.com and egemen.timbil@study.thws.de'),
            SizedBox(height: 12),
            Text(
              'This app was developed as part of a mobile app course project. It allows users to search for books using the OpenLibrary API.'
              'The API provides book data such as title, author, and cover image. Since the API does not include full descriptions, default text is used instead',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
