class Book {
  String title;
  String author;
  int publicationYear;

  Book({required this.title, required this.author, required this.publicationYear});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      publicationYear: json['publicationYear'],
    );
  }
}
