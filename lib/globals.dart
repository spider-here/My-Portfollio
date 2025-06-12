import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:web/web.dart' as web;

class Globals{
  Globals._();

  static String timestampToString(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String month = DateFormat('MMM').format(dateTime);
    String year = DateFormat('yyyy').format(dateTime);

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

}
