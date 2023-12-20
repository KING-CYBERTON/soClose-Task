import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryDetails {
  String deliverDetails;
  String street;
  String town;
  String county;

  DeliveryDetails({
    required this.street,
    required this.deliverDetails,
    required this.town,
    required this.county,
  });

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'town': town,
      'deliverDetails': deliverDetails,
      'county': county,
    };
  }

  factory DeliveryDetails.fromMap(Map<String, dynamic> map) {
    return DeliveryDetails(
      street: map['street'],
      county: map['county'],
      town: map['town'],
      deliverDetails: map['deliverDetails'],
    );
  }

    @override
  String toString() {
    return 'DeliveryDetails {'
        '\n  street: $street,'
        '\n  town: $town,'
        '\n  deliverDetails: $deliverDetails,'
        '\n  county: $county,'
        '\n}';
  }
}

