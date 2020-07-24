import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';

  Future addBookFirebase() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力して下さい');
    }
    Firestore.instance.collection('books').add(
      {
        'title': bookTitle,
        'createdAt': Timestamp.now(),
      },
    );
  }
}
