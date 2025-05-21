class Book {
  final int id;
  final String title;
  final String author;
  final String publisher;
  final int year;
  final String description;
  final String coverImage;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    required this.year,
    required this.description,
    required this.coverImage,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      publisher: json['publisher'],
      year: json['year'],
      description: json['description'],
      coverImage: json['coverImage'],
    );
  }
}


