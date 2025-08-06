import 'package:cloud_firestore/cloud_firestore.dart';

class Qualification {
  String id;
  String title;
  String subject;
  String institute;
  String location;
  bool present;
  Timestamp? endDate;

  Qualification({required this.id,
    required this.title,
    required this.subject,
    required this.institute,
    required this.location,
    required this.present,
    required this.endDate});
}