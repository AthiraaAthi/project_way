import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class DropdownProvider extends ChangeNotifier {
  List<String> categories = [
    "categoryscreen.addCategoryDialog.categoryOptions.incomeCategory".tr(),
    "categoryscreen.addCategoryDialog.categoryOptions.expenseCategory".tr(),
  ];

  String _dropdownValue2 =
      "categoryscreen.addCategoryDialog.categoryOptions.incomeCategory".tr();

  List<String> colorNames = ["Green", "Blue", "Red", "Yellow"];
  List<Color> colors = [
    ColorConstant.defGreen,
    ColorConstant.defIndigo,
    Color.fromARGB(255, 230, 57, 45),
    Colors.yellow
  ];

  String _colorNameController = "Green";

  String get dropdownValue2 => _dropdownValue2;
  String get colorNameController => _colorNameController;

  void setDropdownValue2(String newValue) {
    _dropdownValue2 = newValue;
    notifyListeners();
  }

  void setColorNameController(String newValue) {
    _colorNameController = newValue;
    notifyListeners();
  }
}
