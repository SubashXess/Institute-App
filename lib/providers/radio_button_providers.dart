import 'package:flutter/foundation.dart';

class RadioButtonProviders with ChangeNotifier {
  String? _selectedValue;
  String? get selectedValue => _selectedValue;

  void chooseValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }
}
