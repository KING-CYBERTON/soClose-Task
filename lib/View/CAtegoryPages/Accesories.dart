import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/View/CAtegoryPages/Categorycards.dart';
import '../../Controller/CartController.dart';
import '../../Controller/productController.dart';
import '../../DataModel/Product.dart';
import '../../Styles/color.dart';
import '../../Styles/font_styles.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import '../Menu/card_screen.dart';
import '../product_view.dart';


class Accesories extends StatefulWidget {
  // Add productType parameter

  const Accesories({Key? key,}) : super(key: key);

  @override
  State<Accesories> createState() => _AccesoriesState();
}

class _AccesoriesState extends State<Accesories> {
  
  final ProductController productController = Get.find();
  int _crossAxisCount = 2; // Initial number of grids
  bool _isGridView = true;
// Current view mode

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of grids based on screen width
    if (screenWidth >= 600) {
      _crossAxisCount = 4;
    } else if (screenWidth >= 1200) {
      _crossAxisCount = 6;
    } else {
      _crossAxisCount = 2;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('accessories'),
        actions: [
          IconButton(
            icon:const Icon(Icons.shopping_cart),
            onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
          IconButton(
            icon: _isGridView ? const Icon(Icons.list) : const Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgWhite,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              ProductList(
                productList: productController.accesories, // Pass the product type to getProductList
                isGridView: _isGridView,
                screenWidth: _crossAxisCount,
              ),
            ],
          ),
        ),
      ),
    );
  }

}