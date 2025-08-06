import 'package:cloud_firestore/cloud_firestore.dart';

class WorkExperience {
  String id;
  String designation;
  String company;
  String location;
  bool present;
  Timestamp startDate;
  Timestamp? endDate;

  WorkExperience({required this.id,
    required this.designation,
    required this.company,
    required this.location,
    required this.present,
    required this.startDate,
    required this.endDate});
}