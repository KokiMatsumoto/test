import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/add_book_page.dart';

import 'book_list_model.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchbooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('booklist'),
        ),
        body: Consumer<BookListModel>(builder: (context, model, child) {
          final books = model.books;
          final ListTiles = books
              .map(
                (book) => ListTile(
                  title: Text(book.title),
                ),
              )
              .toList();
          return ListView(
            children: ListTiles,
          );
        }),
        floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
          return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                //TODO
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBookPage(),
                    fullscreenDialog: true,
                  ),
                );
                model.fetchbooks();
              });
        }),
      ),
    );
  }
}
