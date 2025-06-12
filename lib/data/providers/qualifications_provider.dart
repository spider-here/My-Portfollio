import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:zakwan_ali_portfolio/data/models/qualification.dart';

class QualificationsProvider extends ChangeNotifier {
  static final QualificationsProvider _instance = QualificationsProvider._internal();

  factory QualificationsProvider() {
    return _instance;
  }

  QualificationsProvider._internal();

  Qualification? qualifications;

  void updateFromSnapshot(DocumentSnapshot snapshot) {
    try {
      qualifications = Qualification.fromSnapshot(snapshot);
      notifyListeners(); // Notify listeners if you want to react to changes
    } catch (e) {
      rethrow;
    }
  }
}
