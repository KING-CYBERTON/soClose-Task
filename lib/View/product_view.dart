// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/Styles/color.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:oxy_boot/Styles/font_styles.dart';

import '../Controller/CartController.dart';
import '../DataModel/Product.dart';

class ProductView extends StatefulWidget {
  final Product product;
  const ProductView({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final CartController controller = Get.find();
  List<int> euSizes = [];
  List<double> usSizes = [];
  List<double> ukSizes = [];
  int selectShows = 0;
  int countryIndex = 0;
  int sizeIndex = 0;
  List<int> convertStringTointSizes(String input) {
    List<String> sizeStrings = input.split(',');

    // Trim each string and convert it to an integer
    List<int> sizes = sizeStrings.map((String size) {
      return int.tryParse(size.trim()) ??
          0; // Use 0 or another default value if parsing fails
    }).toList();

    // Remove any sizes that are 0 (or another default value)
    sizes.removeWhere((size) => size == 0);

    return sizes;
  }

  List<String> convertStringToSizes(String input) {
    List<String> sizeStrings = input.split(',');

    // Trim each string and convert it to an integer
    // List<int> sizes = sizeStrings.map((String size) {
    //   return int.tryParse(size.trim()) ?? 0; // Use 0 or another default value if parsing fails
    // }).toList();

    // Remove any sizes that are 0 (or another default value)
    // sizes.removeWhere((size) => size == 0);

    return sizeStrings;
  }

  Map<int, Map<String, double>> sizeTable = {
    35: {'US': 3.5, 'UK': 2.5},
    36: {'US': 4, 'UK': 3},
    37: {'US': 4.5, 'UK': 3.5},
    38: {'US': 5, 'UK': 4},
    39: {'US': 5.5, 'UK': 4.5},
    40: {'US': 6, 'UK': 5},
    41: {'US': 7, 'UK': 6},
    42: {'US': 8, 'UK': 7},
    43: {'US': 9, 'UK': 8},
    44: {'US': 9.5, 'UK': 9},
    45: {'US': 10.5, 'UK': 10},
    46: {'US': 11.5, 'UK': 11},
    47: {'US': 12.5, 'UK': 12},
    // Add more sizes as needed
  };

  List<double> convertSizesList(List<int> euSizes) {
    for (int euSize in euSizes) {
      if (sizeTable.containsKey(euSize)) {
        usSizes.add(sizeTable[euSize]!['US']!.toDouble());
      } else {
        // If the EU size is not found, add a placeholder value (e.g., -1)
        usSizes.add(-1);
      }
    }
    return usSizes;
  }

  List<double> convertSizesListUk(List<int> euSizes) {
    for (int euSize in euSizes) {
      if (sizeTable.containsKey(euSize)) {
        ukSizes.add(sizeTable[euSize]!['UK']!.toDouble());
      } else {
        // If the EU size is not found, add a placeholder value (e.g., -1)
        ukSizes.add(-1);
      }
    }
    return ukSizes;
  }

  @override
  Widget build(BuildContext context) {
    List<int> euSizes = convertStringTointSizes(widget.product.size);
    return Scaffold(
      backgroundColor: bgWhite,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Bounce(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset(
                          "assets/icons/back_ic.png",
                          width: 44.0,
                          height: 44.0,
                        )),
                    const Spacer(),
                    Stack(
                      children: [
                        Bounce(
                            onPressed: () {},
                            duration: const Duration(milliseconds: 500),
                            child: Image.asset(
                              "assets/icons/cart_ic.png",
                              width: 44.0,
                              height: 44.0,
                            )),
                        Positioned(
                          right: 0,
                          top: 3,
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Center(
                              child: Obx(() => Text(
                                    CartController.instance.totalProductsInCart
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: selectShows == 0
                      ? Image.network(
                          widget.product.PImage,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.fitHeight,
                        )
                      : selectShows == 1
                          ? select2()
                          : select3(),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.PName,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.product.price.toString(),
                          style: const TextStyle(
                              // color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "Gallery",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Bounce(
                                onPressed: () {
                                  selectShows = 0;
                                  setState(() {});
                                },
                                duration: const Duration(milliseconds: 500),
                                child: Container(
                                  width: 56.0,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                      color: selectShows == 0
                                          ? customBlue
                                          : bgWhite,
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: Image.network(widget.product.PImage),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              widget.product.PImage2.isEmpty
                                  ? Container()
                                  : Bounce(
                                      onPressed: () {
                                        selectShows = 1;
                                        setState(() {});
                                      },
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Container(
                                        width: 56.0,
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                            color: selectShows == 1
                                                ? customBlue
                                                : bgWhite,
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        child: Image.network(
                                            widget.product.PImage),
                                      ),
                                    ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              widget.product.PImage3.isEmpty
                                  ? Container()
                                  : Bounce(
                                      onPressed: () {
                                        selectShows = 2;
                                        setState(() {});
                                      },
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Container(
                                        width: 56.0,
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                            color: selectShows == 2
                                                ? customBlue
                                                : bgWhite,
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        child: Image.network(
                                            widget.product.PImage),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            const Text("Size",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            const Spacer(),
                            widget.product.selectedcollection == 'shoes'
                                ? Row(
                                    children: [
                                      Bounce(
                                        onPressed: () {
                                          countryIndex = 0;
                                          setState(() {});
                                        },
                                        duration:
                                            const Duration(milliseconds: 200),
                                        child: Text("EU",
                                            style: countryIndex == 0
                                                ? const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500)
                                                : const TextStyle(
                                                    // color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Bounce(
                                        onPressed: () {
                                          convertSizesList(euSizes);
                                          countryIndex = 1;
                                          setState(() {});
                                        },
                                        duration:
                                            const Duration(milliseconds: 200),
                                        child: Text("US",
                                            style: countryIndex == 1
                                                ? const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500)
                                                : const TextStyle(
                                                    // color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Bounce(
                                        onPressed: () {
                                          convertSizesListUk(euSizes);
                                          countryIndex = 2;
                                          setState(() {});
                                        },
                                        duration:
                                            const Duration(milliseconds: 200),
                                        child: Text("UK",
                                            style: countryIndex == 2
                                                ? const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500)
                                                : const TextStyle(
                                                    // color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ],
                                  )
                                : Container()
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        widget.product.selectedcollection == 'shoes'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0; i < euSizes.length; i++)
                                    Bounce(
                                      onPressed: () {
                                        sizeIndex = i;
                                        setState(() {});
                                      },
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: sizeIndex == i
                                            ? customBlue
                                            : bgWhite,
                                        child: Text(
                                          countryIndex == 0
                                              ? euSizes[i].toString()
                                              : countryIndex == 1
                                                  ? (i < usSizes.length
                                                      ? usSizes[i].toString()
                                                      : '')
                                                  : (i < ukSizes.length
                                                      ? ukSizes[i].toString()
                                                      : ''),
                                          style: sizeIndex == i
                                              ? const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)
                                              : const TextStyle(
                                                  // color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0; i < euSizes.length; i++)
                                    Bounce(
                                      onPressed: () {
                                        sizeIndex = i;
                                        setState(() {});
                                      },
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: sizeIndex == i
                                            ? customBlue
                                            : bgWhite,
                                        child: Text(
                                          euSizes[i] as String,
                                          style: sizeIndex == i
                                              ? const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)
                                              : const TextStyle(
                                                  // color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                ],
                              )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24.0),
                topLeft: Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.1,
                blurRadius: 25,
                color: bgWhite,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Price",
                    style: textStyle1,
                  ),
                  Text(
                    widget.product.price.toString(),
                    style: textStyle4,
                  ),
                ],
              ),
              const Spacer(),
              Bounce(
                onPressed: () {
                  controller.addProduct(widget.product);
                  print(widget.product.size);
                },
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 165.0,
                  height: 55.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: customBlue,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          color: customBlue,
                        )
                      ]),
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: "airbnb"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget select3() {
    return widget.product.PImage3.isEmpty
        ? Container()
        : Image.network(widget.product.PImage3,
            width: double.infinity, height: 200, fit: BoxFit.cover);
  }

  Widget select2() {
    return widget.product.PImage2.isEmpty
        ? Container()
        : Image.network(widget.product.PImage2,
            width: double.infinity, height: 200, fit: BoxFit.cover);
  }
}
