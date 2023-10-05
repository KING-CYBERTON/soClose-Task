import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/View/CAtegoryPages/newarrivals.dart';
import 'package:oxy_boot/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:oxy_boot/Styles/color.dart';
import 'package:oxy_boot/responsive/mobile.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:oxy_boot/responsive/response.dart';
import 'package:oxy_boot/responsive/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/productController.dart';
import '../View/CAtegoryPages/Categorycards.dart';

class CustomScrollViewExample extends StatefulWidget {
  final String name;
  const CustomScrollViewExample({Key? key, required this.name}) : super(key: key);

  @override
  _CustomScrollViewExampleState createState() => _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productController.shoes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard2(productList: productController.shoes[index]),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 500, // Adjust the height as needed
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: productController.shoes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard2(productList: productController.shoes[index]),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
