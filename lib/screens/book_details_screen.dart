import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Center(
        child: Text('${book.title} by ${book.author}'),
      ),
    );
  }
}
