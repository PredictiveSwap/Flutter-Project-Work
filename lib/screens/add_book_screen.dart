import 'package:flutter/material.dart';
import '../models/book.dart';

class AddBookScreen extends StatefulWidget {
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String author = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                title = value;
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Author'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an author';
                }
                author = value;
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Assuming the Book constructor only needs title and author
                  Navigator.pop(context, Book(title: title, author: author, publicationYear: 2022)); // Example year
                }
              },
              child: Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
