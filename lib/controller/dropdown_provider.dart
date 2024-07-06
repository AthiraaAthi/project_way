import 'package:flutter/material.dart';

class DropdownProvider extends ChangeNotifier {
  String _dropdownValue2 = 'Default value';
  String _colorNameController = 'Default color';

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
