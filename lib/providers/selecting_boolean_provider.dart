import 'package:flutter/foundation.dart';

class UserLoginTypeSelectedProvider with ChangeNotifier {
  int? _selected;
  int? get selected => _selected;

  String? _selectedImage;
  String? get selectedImage => _selectedImage;

  String? _selectedHeader;
  String? get selectedHeader => _selectedHeader;

  String? _selectedSubtitle;
  String? get selectedSubtitle => _selectedSubtitle;

  void selectedIndex(
      {int? index, String? image, String? header, String? subtitle}) {
    _selected = index;
    _selectedImage = image;
    _selectedHeader = header;
    _selectedSubtitle = subtitle;
    notifyListeners();
  }
}


