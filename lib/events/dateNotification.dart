import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime date = DateTime.now();
final DateFormat dateFormat = DateFormat('MMM dd, yyyy');
String formattedDate = dateFormat.format(date);

updateDate(BuildContext context, String taskDate) {
  if (taskDate == formattedDate) {
    print("son iguales");
  }
}
