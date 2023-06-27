import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  // ignore: non_constant_identifier_names
  final String PName;
  final String PImage;
  final double price;

  const Product({
    required this.PName,
    required this.price,
    required this.PImage,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      PName: snap['PName'],
      price: snap['price'],
      PImage: snap['PImage'],
    );
    return product;
  }

  static const List<Product> products = [
    Product(PName: 'vance', price: 2500.00, PImage: 'assets/images/vance.png'),
    Product(PName: 'AirMax', price: 2500.00, PImage: 'assets/shows/img2.png'),
    Product(PName: 'img3', price: 2500.00, PImage: 'assets/shows/img3.png')
  ];
}
