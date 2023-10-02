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


class ShoePagee extends StatefulWidget {
 final bool gridview;
  final double wsize;
  final String name;
  const ShoePagee({Key? key, required this.gridview, required this.wsize, required this.name,}) : super(key: key);

  @override
  State<ShoePagee> createState() => _ShoePageeState();
}

class _ShoePageeState extends State<ShoePagee> {
  
  // final ProductController productController = Get.find();
  final productController = Get.put(ProductController());
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgWhite,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
                 ProductList(
        productList: productController.shoes,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
            ],
          ),
        ),
      ),
    );
  }

}