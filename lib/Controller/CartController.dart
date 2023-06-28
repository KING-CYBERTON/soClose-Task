import 'package:cloud_firestore/cloud_firestore.dart';
import "package:get/get.dart";
import 'package:flutter/material.dart';
import '../DataModel/Product.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  // Add a dict to store the products in the cart.
  var _products = {}.obs;
  RxDouble grandTotal = RxDouble(0);

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Product Added",
      "You have added the ${product.PName} to the cart",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  void deleteProduct(Product product) {
    _products.remove(product);
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);



    void transactionCompleted() async {
    // Save the cart data to Firestore
final List orderList = _products.entries.map((entry) {
    final product = entry.key;
    final quantity = entry.value;
    final productJson = product.toJson();
    productJson['quantity'] = quantity;
    return productJson;
  }).toList();

  await FirebaseFirestore.instance
      .collection('orders')
      .doc('userId')
      .set({'products': orderList}); // Assuming _products is a RxMap<String, int>

    // Clear the cart
    products.clear();

    // Show a success message
    Get.back();
    Get.snackbar(
      "Message",
      "Transaction succeeded!",
      colorText: Colors.white,
      backgroundColor: Color(0xff4D4D4D),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

}
