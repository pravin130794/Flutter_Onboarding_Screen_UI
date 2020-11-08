import 'package:flutter/cupertino.dart';

class IndexNotifier with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  set index(int index) {
    _index = index;
    notifyListeners();
  }
}
