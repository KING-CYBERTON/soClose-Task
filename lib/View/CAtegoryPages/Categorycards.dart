import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
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
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isGridView
          ? GridView.builder(
              itemCount: productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    screenWidth, // Change the cross-axis count as needed
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return ProductCard2(
                  productList: productList[index],
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
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ImageViewDialog(product: product);
                      },
                    );
                  },
                  child: Image(
                    image: NetworkImage(product.PImage),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard2 extends StatelessWidget {
  final Product productList;

  const ProductCard2({Key? key, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final ProductController productController = Get.find();

    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Bounce(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ImageViewDialog(product: productList);
            },
          );
        },
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: 160.0,
          height: 160.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Image(
                  image: NetworkImage(productList.PImage),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex: 1,
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
                              productList.PName,
                              style: textStyle4,
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              productList.price.toString(),
                              style: textStyle4,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Bounce(
                          onPressed: () {
                            cartController.addProduct(productList);
                          },
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
  }
}

class ImageViewDialog extends StatelessWidget {
  final Product product;

  const ImageViewDialog({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Dialog(
        child: Stack(
          children: [
            PhotoView(
              imageProvider: NetworkImage(product.PImage),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
            Text(
              product.PName,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            Center(
              child: Text('@GoodTimes_Trends\n ${product.PName}',
                  style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      color: Colors.lightBlue[700])),
            )
          ],
        ),
      ),
    );
  }
}
