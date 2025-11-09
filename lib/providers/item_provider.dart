import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  List<List<String>> _items = [];
  List<String> _info = [];
  List<String> _typeinfo = [];

  List<List<String>> get items => _items;
  List<String> get infos => _info;
  List<String> get typeInfo => _typeinfo;

  void setItems(List<List<String>> newItems) {
    _items = newItems;
    notifyListeners();
  }

  void addInfos(String? newInfos) {
    _info.add(newInfos ?? '');
    notifyListeners();
  }

  void setTypeInfo(List<String> newTypeInfos) {
    _typeinfo = newTypeInfos;
    notifyListeners();
  }

  void clearInfos() {
    _info = [];
    notifyListeners();
  }

  void clearTypeInfos() {
    _typeinfo = [];
    notifyListeners();
  }

  void clearItems() {
    _items = [];
    notifyListeners();
  }
}
