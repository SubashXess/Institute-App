import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker {
  static Future<String?> datePicker(context, String pattern) async {
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

class TimePicker {
  static Future<String?> timePicker(context, String pattern) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context, //context of current state
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = DateFormat(pattern).format(parsedTime);
      print(formattedTime); //output 14:59:00
      return formattedTime;
    } else {
      return null;
    }
    // TimeOfDay? pickedTime = await showTimePicker(
    //   initialTime: TimeOfDay.now(),
    //   initialEntryMode: TimePickerEntryMode.input,

    //   context: context, //context of current state
    // );

    // if (pickedTime != null) {
    //   DateTime parsedTime =
    //       DateFormat.jm().parse(pickedTime.format(context).toString());

    //   String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
    //   return formattedTime;
    // } else {
    //   return null;
    // }
  }
}
