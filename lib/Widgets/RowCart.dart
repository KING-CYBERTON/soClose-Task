import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Controller/CartController.dart';
import '../Controller/productController.dart';
import '../DataModel/Product.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();

  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.products.isEmpty
          ? const Center(
              child: Text("Your cart is empty"),
            )
          : SizedBox(
              height: 600,
              child: ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RowCardCart(
                      controller: controller,
                      product: controller.products.keys.toList()[index],
                      quantity: controller.products.values.toList()[index],
                      index: index,
                    );
                  }),
            ),
    
    );
  }
}

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();

  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.products.isEmpty
          ? const Center(
              child: Text(""),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Ksh ${controller.total}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    _confirmationDialog();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: SizedBox(
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "Proceed",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ])),
    );
  }
}

void _confirmationDialog() {
  final CartController controller = Get.find();
 
  Get.defaultDialog(
    title: "Really want to proceed ?",
    actions: [
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel")),
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow)),
          onPressed: () {
            controller.transactionCompleted();
          },
          child: const Text(
            "Confirm",
            style: TextStyle(color: Colors.black),
          ))
    ],
    backgroundColor: const Color(0xff14c9cf),
    titleStyle: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 17,
        fontWeight: FontWeight.bold),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          height: 200,
          child: ListView.separated(
            separatorBuilder: (_, i) => const Divider(),
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              final product = controller.products.keys.toList()[index];
              final quantity = controller.products.values.toList()[index];
              return ListTile(
                leading: Container(
                  width: 60,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:     
                 NetworkImage(
                    product.PImage,
                  ),
                ),
              ),  
                ),
                title: Text(
                  product.PName,
                  style: const TextStyle(
                    color: Color(0xffb51010),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                subtitle: Text(
                  "Ksh. ${product.price} x $quantity",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        
        const Text(
          'name',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'email',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          ' Ksh ${controller.total}',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        )
      ],
    ),
  );
}

// row card for the cart

class RowCardCart extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
   const RowCardCart(
      {super.key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image:  NetworkImage(
                    product.PImage,
                  ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  product.PName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  product.price.toString(),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                    child: Row(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.delete),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        controller.deleteProduct(product);
                      },
                      label: const Text("Remove"),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.removeProduct(product);
                          },
                          // controller.removeProduct(product),
                          icon: const Icon(Icons.remove),
                        ),
                        Text(quantity.toString()),
                        IconButton(
                          onPressed: () {
                            controller.addProduct(product);
                          },
                          //  controller.addProduct(product),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
