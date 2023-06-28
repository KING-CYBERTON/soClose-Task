import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  // ignore: non_constant_identifier_names
  final String PName;
  final String PImage;
  final double price;

  const Product({
    required this.PName,
    required this.PImage,
     required this.price,
  });

    Map<String, dynamic> toJson() {
    return {
      'PName': PName,
      'PImage': PImage,
      'price': price,
    };
  }

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      PName: snap['PName'],
      price: snap['price'],
      PImage: snap['PImage'],
    );
    return product;
  }

}
