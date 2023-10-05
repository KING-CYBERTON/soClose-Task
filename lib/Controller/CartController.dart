import 'package:cloud_firestore/cloud_firestore.dart';
import "package:get/get.dart";
import 'package:flutter/material.dart';
import '../DataModel/Product.dart';
import '../DataModel/orderModel.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  // Add a dict to store the products in the cart.
  var _products = {}.obs;
  RxString paymentMethod = "Select".obs;
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

      int get totalProducts {
    return _products.values.reduce((sum, quantity) => sum + quantity);
  }

  void transactionCompleted() async {
    // Save the cart data to Firestore
    final List orderList = _products.entries.map((entry) {
      final product = entry.key;
      final quantity = entry.value;
      final productJson = product.toJson();
      productJson['quantity'] = quantity;
      return productJson;
    }).toList();

    await FirebaseFirestore.instance.collection('orders').doc('userId').set(
        {'products': orderList}); // Assuming _products is a RxMap<String, int>

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

  Future<void> postOrderToFirestore(Orders order) async {
    try {
      // Convert the Orders object to a JSON representation
      final orderJson = {
        'contactname': order.contactname,
        'contactphone': order.contactphone,
        'Billedtotal': order.total,
        'mpesaname': order.mpesaname,
        'mpesnumber': order.mpesnumber,
        'mpesacode': order.mpesacode,
        'orderlist': order.orderlist
      };

      // Save the order data to Firestore under the 'orders' collection
      await FirebaseFirestore.instance.collection('orders').add(orderJson);

      // Clear the cart after successful data posting
      products.clear();

      // Show a success message
      Get.back();
      Get.snackbar(
        "Message",
        "Transaction succeeded! Order has been placed.",
        colorText: Colors.white,
        backgroundColor: Color(0xff4D4D4D),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error posting order: $e');
      Get.snackbar(
        "Error",
        "Failed to place the order. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
