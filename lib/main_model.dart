import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String kboyText = 'KBOY';

  void changekboyText() {
    kboyText = 'Kboy very good';
    notifyListeners();
  }

}