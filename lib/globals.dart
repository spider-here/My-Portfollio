import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:web/web.dart' as web;

class Globals{
  Globals._();

  static String timestampToString(Timestamp timestamp) {
    final DateTime dateTime = timestamp.toDate();
    final String month = DateFormat('MMM').format(dateTime);
    final String year = DateFormat('yyyy').format(dateTime);

    return '$month, $year';
  }

  static void downloadFile(String url) {
    final anchor = web.HTMLAnchorElement()
      ..href = url
      ..download = 'Zakwan Ali Tariq - CV'
      ..target = '_blank';

    web.document.body?.append(anchor);
    anchor.click();
    anchor.remove(); // Cleanup after download
  }

  //textfield validations

  static String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '*Required';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '*Required';
    }

    final nameRegExp = RegExp(r"^[a-zA-Z' ]{2,50}$");

    if (!nameRegExp.hasMatch(value.trim())) {
      return "Enter a valid name (letters, spaces, apostrophes only)";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '*Required';
    }

    if(!(value.isEmail)){
      return 'Enter a valid email';
    }

    return null;
  }
}
