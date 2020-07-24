import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app/book.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  Future fetchbooks() async {
    final docs = await Firestore.instance.collection('books').getDocuments();
    final books = docs.documents.map((doc) => Book(doc['title'])).toList();
    this.books = books;
    notifyListeners();
  }
}
