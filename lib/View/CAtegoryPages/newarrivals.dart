import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oxy_boot/Widgets/ProductCard.dart';
import '../../Controller/CartController.dart';
import '../../Controller/productController.dart';
import '../../Styles/font_styles.dart';
import '../../Widgets/item_view.dart';
import '../../Styles/color.dart';
import '../product_view.dart';

class NewArrivalsPage extends StatefulWidget {
  const NewArrivalsPage({Key? key}) : super(key: key);

  @override
  State<NewArrivalsPage> createState() => _NewArrivalsPageState();
}

class _NewArrivalsPageState extends State<NewArrivalsPage> {
   final ProductController productController = Get.find();
  int _crossAxisCount = 2; // Initial number of grids

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
          title: const Text('Accessories'),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: bgWhite,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: productController.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _crossAxisCount,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(index: index);
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}