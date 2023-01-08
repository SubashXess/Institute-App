import 'package:flutter/foundation.dart';

class SearchAnimationProvider with ChangeNotifier {
  bool _selected = false;
  bool get selected => _selected;

  bool _visible = true;
  bool get visible => _visible;

  void isSelected(bool value) {
    _selected = value;
    notifyListeners();
  }

  void isVisible(bool value) {
    _visible = value;
    notifyListeners();
  }
}
