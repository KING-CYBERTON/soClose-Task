import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  // Add a field for the document ID
  final String documentId;
  final String selectedcollection;
  final String PName;
  final double price;
  String PImage;
  final String brand;
  final String description;
  final String size;

  Product({
    // Include the document ID in the constructor
    required this.documentId,
    required this.selectedcollection,
    required this.PName,
    required this.price,
    required this.PImage,
    required this.brand,
    required this.description,
     required this.size,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      documentId: json['documentId']
          as String, // Update with the actual field name from Firestore
      PName: json['PName'] as String,
      price: json['price'] as double,
      PImage:json['PImage'] as String ,
      brand: json['brand'] as String,
      size: json['size'] as String,
      description: json['description'] as String,
      selectedcollection: json['selectedcollection'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // Include the document ID in the JSON serialization
      'documentId': documentId,
      'PName': PName,
      'price': price,
      'PImage': PImage,
      'brand': brand,
      'size': size,
      'description': description,
      'selectedcollection': selectedcollection,
    };
  }

  static Product fromSnapshot(DocumentSnapshot snap) {
    if (snap.exists) {
      Map<String, dynamic>? data = snap.data() as Map<String, dynamic>?;

      if (data != null) {
        return Product(
          documentId: snap.id,
          PName: data['PName'] ?? '',
          price: (data['price'] as num?)?.toDouble() ?? 0.0,
          size: data['size'] as String? ?? '' ,
          PImage: data['PImage'] as String,
          brand: data['brand'] as String? ?? '',
          description: data['description'] ?? '',
          selectedcollection: data['selectedcollection'] ?? '',
        );
      }
    }

    // Return a default instance or throw an exception based on your use case
    throw StateError("DocumentSnapshot is null or doesn't exist");
  }
}
