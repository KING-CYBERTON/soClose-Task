import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? id;
  String deliverDetails;
  String street;
  String town;
  String county;
  String? email;

  UserData({
    this.id,
    required this.street,
    required this.deliverDetails,
    required this.town,
    required this.county,
    this.email,
  });

  toJson() {
    return {
      'email': email,
      'street': street,
      'town': town,
      'deliverDetails': deliverDetails,
      'county': county,
    };
  }

  factory UserData.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final json = document.data();
    return UserData(
      id: document.id,
      street : json!['street'],
      county: json['county'],
      town: json['town'],
      deliverDetails: json['deliverDetails'],
      email: json['email'] ?? '',
    );
  }
}
