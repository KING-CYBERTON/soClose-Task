import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/Widgets/ProductCard.dart';
import 'package:oxy_boot/Widgets/item_view.dart';
import 'package:photo_view/photo_view.dart';
import '../../Controller/CartController.dart';
import '../../Controller/FavController.dart';
import '../../Controller/productController.dart';
import '../../DataModel/Product.dart';
import '../../Styles/color.dart';
import '../../Styles/font_styles.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import '../product_view.dart';

class ProductList extends StatelessWidget {
  final String name;
  final List<Product> productList;
  final bool isGridView;
  final int screenWidth;

  const ProductList({
    required this.productList,
    required this.isGridView,
    Key? key,
    required this.screenWidth,
    required this.name,
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
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final product = productList[index];
                if (name.isEmpty) {
                  return ProductCard2(
                    productList: productList[index],
                  );
                } else if (product.PName.startsWith(name.toLowerCase())) {
                  return ProductCard2(
                    productList: product,
                  );
                } else {
                  Container();
                }
                return null;
              },
            )
          : ListView.builder(
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                final product = productList[index];
                if (name.isEmpty) {
                  return ProductCard(
                    product: product,
                  );
                } else if (product.PName.startsWith(name.toLowerCase())) {
                  return ProductCard(
                    product: product,
                  );
                } else {
                  Container();
                }
                return null;
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

class Productcard3 extends StatelessWidget {
  final Product productList;
  const Productcard3({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final FavAuth Fcontroller = Get.put(FavAuth());
    final ProductController productController = Get.find();
    bool fav = true;
    return Bounce(
      onPressed: () {
        Get.to(ProductView(
          product: productList,
        ));
      },
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 8),
        child: Container(
         
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    productList.PImage,
                    fit: BoxFit.fill,
                    height: 170,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productList.PName,
                            style: const TextStyle(
                                // color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          likebutton(
                            productList: productList,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productList.price.toString(),
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Bounce(
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
                        ],
                      ),
                    ),
                  ],
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
    final FavAuth Fcontroller = Get.put(FavAuth());
    final ProductController productController = Get.find();
    bool fav = true;

    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Bounce(
        onPressed: () {
          Get.to(ProductView(product: productList));
        },
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              
              Expanded(
                flex: 3,
                child:
                productList.outofstock == true?
                      Stack(
                        children: [
                         Container(color: Colors.white.withOpacity(0.8),height: 30,child: Text('OutofStock',style: TextStyle(color: Colors.red ,fontSize: 20),),),
                          ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child:  Image(
                          image: NetworkImage(productList.PImage),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                    ),), Container(color: Colors.white.withOpacity(0.8),height: 30,child: Text('OutofStock',style: TextStyle(color: Colors.red ,fontSize: 20),),),
                        
                        ],
                      ):ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child:  Image(
                          image: NetworkImage(productList.PImage),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                    ),),
           
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                                likebutton(productList: productList),
                                Bounce(
                          onPressed: () {
                            cartController.addProduct(productList);
                          },
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            width: 30.0,
                            height:  26.0,
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
                  
                            ],
                          )
                        
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productList.PName,
                              style: textStyle4,
                            ),
                            
                            Text(
                              productList.price.toString(),
                              style: textStyle4,
                            ),
                          ],
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

  const ImageViewDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.transparent,
      child: Dialog(
        child: Stack(
          children: [
            PhotoView(
              imageProvider: NetworkImage(product.PImage),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
          ],
        ),
      ),
    );
  }
}

class likebutton extends StatefulWidget {
  final Product productList;

  const likebutton({super.key, required this.productList});

  @override
  State<likebutton> createState() => _likebuttonState();
}

class _likebuttonState extends State<likebutton> {
  final cartController = Get.put(CartController());
  final FavAuth Fcontroller = Get.put(FavAuth());
  final ProductController productController = Get.find();
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(
        onPressed: () {
          if (Fcontroller.isProductFavorite(widget.productList) == false) {
            Fcontroller.addProduct(widget.productList);
            print(Fcontroller.isProductFavorite(widget.productList));
          } else {
            Fcontroller.removeProduct(widget.productList);
            print(Fcontroller.isProductFavorite(widget.productList));
          }
        },
        icon: Icon(
          Fcontroller.isProductFavorite(widget.productList) == true
              ? Icons.favorite
              : Icons.favorite_border,
          color: Fcontroller.isProductFavorite(widget.productList) == true
              ? Colors.redAccent
              : Colors.black,
          weight: 400,
        )));
  }
}
