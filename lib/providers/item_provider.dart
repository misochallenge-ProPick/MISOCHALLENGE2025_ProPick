import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  List<List<String>> _items = [];

  List<List<String>> get items => _items;

  void setItems(List<List<String>> newItems) {
    _items = newItems;
    notifyListeners();
  }

  void clearItems() {
    _items = [];
    notifyListeners();
  }
}
