// import 'package:flutter/material.dart';
// import 'package:project_way/model/category_model.dart';

// class CategoryProvider with ChangeNotifier {
//   List<Category> _categories = [];

//   List<Category> get categories => _categories;

//   void addCategory(Category category) {
//     _categories.add(category);
//     notifyListeners();
//   }

//   void removeCategory(Category category) {
//     _categories.remove(category);
//     notifyListeners();
//   }

//   void updateCategory(int index, Category updatedCategory) {
//     _categories[index] = updatedCategory;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:project_way/database/category_db/category_db.dart';
import 'package:project_way/model/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  CategoryProvider() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    _categories = await CategoryDatabase().getCategories();
    notifyListeners();
  }

  Future<void> addCategory(Category category) async {
    await CategoryDatabase().insertCategory(category);
    await loadCategories();
  }

  Future<void> removeCategory(int id) async {
    await CategoryDatabase().deleteCategory(id);
    await loadCategories();
  }

  Future<void> updateCategory(Category category) async {
    await CategoryDatabase().updateCategory(category);
    await loadCategories();
  }

  Future<List<Category>> categoryById(String id) async {
    List<Category> mp = await CategoryDatabase().getCategoryById(id);
    return mp;
  }
}
