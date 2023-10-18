import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../DataModel/Product.dart';

class FavAuth extends GetxController {
  static FavAuth instance = Get.find();

  // Add a dict to store the products in the cart.
  var _products = {}.obs;

  RxBool favlist = RxBool(false);

  void addProduct(Product product) {
    if (!_products.containsKey(product)) {
      _products[product] = 1;
      // This should be conditional based on the product state
 
    } else {
      _products[product] += 1;
    }
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    
    } else {
      _products[product] -= 1;
    }
  }

  bool isProductFavorite(Product product) {
    bool isFavorite = _products.containsKey(product);
    return isFavorite;
  }

  get products => _products;

  void checkAndSetFavorite(Product product) {
    if (!favlist.value) {
      // Check if the product is in the favorite list (you may need to adjust this condition based on your actual logic)
      if (_products.containsKey(product)) {
        favlist.value = true;
      }
    }
  }

  void transactionCompleted(User? user) async {
    if (user != null) {
      final List orderList = _products.entries.map((entry) {
        final product = entry.key;
        final quantity = entry.value;
        final productJson = product.toJson();
        productJson['quantity'] = quantity;
        return productJson;
      }).toList();

      await FirebaseFirestore.instance.collection('orders').doc('userId').set({
        'products': orderList
      }); // Assuming _products is a RxMap<String, int>

      // Clear the cart
      products.clear();

      // Show a success message
      Get.back();
      Get.snackbar(
        "Message",
        "Added To Wishlist!",
        colorText: Colors.white,
        backgroundColor: Color(0xff4D4D4D),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (user == null) {
      Get.snackbar(
        "Message",
        "Please Sign In",
        colorText: Colors.white,
        backgroundColor: Color.fromARGB(255, 212, 19, 19),
        snackPosition: SnackPosition.BOTTOM,
      );
      ;
    }
    // Save the cart data to Firestore
  }
}
