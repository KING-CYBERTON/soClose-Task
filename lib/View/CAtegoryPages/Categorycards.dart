import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/CartController.dart';
import '../../Controller/productController.dart';
import '../../DataModel/Product.dart';
import '../../Styles/color.dart';
import '../../Styles/font_styles.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import '../product_view.dart';




class ProductList extends StatelessWidget {
  final List<Product> productList;
  final bool isGridView;
  final int screenWidth;

  const ProductList({
    required this.productList,
    required this.isGridView,
    
    Key? key, required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isGridView
          ? GridView.builder(
              itemCount: productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth, // Change the cross-axis count as needed
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: productList[index],
                );
              },
            )
          : ListView.builder(
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                final product = productList[index];
                return ProductCard(
                  product: product,
                );
              },
            ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final CartController cartController = Get.put(CartController());

   ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: InkWell(
        onTap: () {
          cartController.addProduct(product);
          // Navigator.push(context,
          //     CupertinoPageRoute(builder: (context) => const ProductView()));
        },
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), color: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BEST CHOICE",
                        style: textStyle6,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product.PName,
                        style: textStyle4,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.price.toString(),
                        style: textStyle4,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image(
                  image: NetworkImage(product.PImage),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
