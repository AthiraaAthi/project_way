import 'package:flutter/material.dart';
import 'package:project_way/model/category_model.dart';

class categoryprovider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }
}
