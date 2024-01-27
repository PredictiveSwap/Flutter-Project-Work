import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/book.dart';
import 'add_book_screen.dart';
import 'book_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  Future<void> loadBooks() async {
    final String response = await rootBundle.loadString('lib/assets/book_data.json');
    final data = await json.decode(response);
    setState(() {
      books = List<Book>.from(data.map((i) => Book.fromJson(i)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index].title),
            subtitle: Text(books[index].author),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailsScreen(book: books[index]),
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  books.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newBook = await Navigator.push<Book>(
            context,
            MaterialPageRoute(builder: (context) => AddBookScreen()),
          );

          if (newBook != null) {
            setState(() {
              books.add(newBook);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
