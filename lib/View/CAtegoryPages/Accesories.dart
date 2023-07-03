import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Controller/CartController.dart';
import '../../Controller/productController.dart';
import '../../Styles/font_styles.dart';
import '../../Widgets/item_view.dart';
import '../../Styles/color.dart';
import '../product_view.dart';

class AccesoriesPage extends StatefulWidget {
  const AccesoriesPage({Key? key}) : super(key: key);

  @override
  State<AccesoriesPage> createState() => _AccesoriesPageState();
}

class _AccesoriesPageState extends State<AccesoriesPage> {
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
                      itemCount: productController.accesories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _crossAxisCount,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return AccessoriesCard(index: index);
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}


class AccessoriesCard extends StatelessWidget {
  final int index;

  const AccessoriesCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final ProductController productController = Get.find();

    return Obx(
      () {
        if (productController.accesories.isEmpty) {
          return CircularProgressIndicator();
        }

        final product = productController.accesories[index];

        return Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Bounce(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const ProductView()),
              );
            },
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 160.0,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image(
                      image: NetworkImage(product.PImage),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BEST SELLER",
                                  style: textStyle6,
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  product.PName,
                                  style: textStyle4,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  product.price.toString(),
                                  style: textStyle4,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Bounce(
                              onPressed: () {},
                              duration: const Duration(milliseconds: 500),
                              child: Container(
                                width: 44.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: customBlue,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

