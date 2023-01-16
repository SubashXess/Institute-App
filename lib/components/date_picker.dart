import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker {
  static Future<String?> datePicker(
      BuildContext context, String pattern) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat(pattern).format(pickedDate);
      return formattedDate;
    } else {
      return null;
    }
  }
}
