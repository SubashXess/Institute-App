import 'package:flutter/material.dart';
import '../components/date_time_picker.dart';

class CourseInsertProvider with ChangeNotifier {
  String? _startDate;
  String? get startDate => _startDate;

  String? _endDate;
  String? get endDate => _endDate;

  String? _startTime;
  String? get startTime => _startTime;

  String? _endTime;
  String? get endTime => _endTime;

  void pickStartDate(BuildContext context) async {
    _startDate = null;
    _startDate = await DatePicker.datePicker(context, 'MMM, dd yyyy');
    notifyListeners();
  }

  void pickEndDate(BuildContext context) async {
    _endDate = null;
    _endDate = await DatePicker.datePicker(context, 'MMM, dd yyyy');
    notifyListeners();
  }

  void pickStartTime(BuildContext context) async {
    _startTime = null;
    _startTime = await TimePicker.timePicker(context, 'HH:mm:ss');
    notifyListeners();
  }

  void pickEndTime(BuildContext context) async {
    _endTime = null;
    _endTime = await TimePicker.timePicker(context, 'HH:mm:ss');
    notifyListeners();
  }
}
