import 'package:flutter/material.dart';
import '../components/date_picker.dart';

class CourseInsertProvider with ChangeNotifier {
  String? _startDate;
  String? get startDate => _startDate;

  String? _endDate;
  String? get endDate => _endDate;

  void pickStartDate(BuildContext context) async {
    _startDate = null;
    _startDate = await DateTimePicker.datePicker(context, 'MMM, dd yyyy');
    notifyListeners();
  }

  void pickEndDate(BuildContext context) async {
    _endDate = null;
    _endDate = await DateTimePicker.datePicker(context, 'MMM, dd yyyy');
    notifyListeners();
  }
}
