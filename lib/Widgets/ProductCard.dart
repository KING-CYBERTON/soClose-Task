import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxy_boot/DataModel/Product.dart';
import 'package:oxy_boot/View/CAtegoryPages/Categorycards.dart';
import '../Controller/FavController.dart';
import '../Styles/color.dart';
import '../Styles/font_styles.dart';

class ProductCard3 extends StatelessWidget {
  final FavAuth controller;
  final Product product;

  final int index;
  ProductCard3({
    super.key,
    required this.index,
    required this.controller,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), color: Colors.white),
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          product.PName,
                          style: textStyle4,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.price.toString(),
                          style: textStyle4,
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                    child: Image(
                      image: NetworkImage(
                        product.PImage,
                      ),
                      width:100 ,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
            ],
              ),
                       Positioned(
                    bottom: 0,
                   left: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: likebutton(productList: product)
                    ),
                  ),
             
            ],
          ),
        ),
      ),
    );
  }
}

// class ProductList extends StatelessWidget {
//   final productController = Get.put(ProductController());

//   ProductList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: ListView.builder(
//             itemCount: productController.products.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ProductCard3(
//                 index: index,
//               );
//             }));
//   }
// }
