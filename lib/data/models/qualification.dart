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

  factory Qualification.fromSnapshot(DocumentSnapshot snapshot){
    final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Qualification(id: snapshot.id,
        title: data['title'],
        subject: data['subject'],
        institute: data['institute'],
        location: data['location'],
        present: data['present'],
        endDate: data['endDate']);
  }

}