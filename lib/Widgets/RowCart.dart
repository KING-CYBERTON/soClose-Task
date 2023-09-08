import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/View/Menu/card_screen.dart';
import 'package:oxy_boot/constraints/CustomText.dart';

import '../Controller/CartController.dart';
import '../Controller/productController.dart';
import '../DataModel/Product.dart';
import '../DataModel/orderModel.dart';
import '../DataModel/thankyounote.dart';
import '../Styles/color.dart';

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

class CartTotal extends StatefulWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  _CartTotalState createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final CartController controller = Get.find();
  final MpesaNameController = TextEditingController();
  final MpesaCodeController = TextEditingController();
  final MpesaNumberController = TextEditingController();
  final ContactNameController = TextEditingController();
  final ContactPhoneController = TextEditingController();
  final phoneRegex = RegExp(r'^\d{10}$');
  final mpesaCodeRegex = RegExp(r'^[A-Z0-9]{10}$');

  bool _showPaymentMethod = false; // Add a boolean to control visibility
  final _formKey = GlobalKey<FormState>(); // Add GlobalKey for the Form

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.products.isEmpty
          ? const Center(
              child: Text(""),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 75),
                child: Form(
                  key: _formKey, // Assign the GlobalKey to the Form
                  child: Column(
                    children: [
                      // Show the paymentmethod widget when _showPaymentMethod is true
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
                      if (_showPaymentMethod)
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ... (existing code)

                              const SizedBox(height: 10),
                              const Text(
                                'Select Payment Method:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),

                              Column(
                                children: [
                                  Obx(() => Row(
                                        children: [
                                          Radio(
                                            value: "M-Pesa",
                                            groupValue:
                                                controller.paymentMethod.value,
                                            onChanged: (value) {
                                              controller.paymentMethod.value =
                                                  value.toString();
                                            },
                                          ),
                                          const Text(
                                            'M-Pesa',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Image.asset('assets/images/mpesa.png'),
                                          Radio(
                                            value: "Cash",
                                            groupValue:
                                                controller.paymentMethod.value,
                                            onChanged: (value) {
                                              controller.paymentMethod.value =
                                                  value.toString();
                                            },
                                          ),
                                          const Text(
                                            'Cash on Delivery',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      )),
                                  // Display M-Pesa specific text fields if the payment method is M-Pesa
                                  if (controller.paymentMethod.value ==
                                      'M-Pesa') ...[
                                         SizedBox(
                height: 40,
                width: 200,
                child: Image.asset('assets/images/mpesagoodtimes.png',
                fit: BoxFit.fitWidth,),
              ),
                                    SizedBox(
                                      width: 300,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: bgWhite,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 10,
                                              offset: Offset(1, 1),
                                              color: Color.fromARGB(
                                                  255, 31, 126, 189),
                                            )
                                          ],
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 36, 107, 148),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(11),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 10),
                                                CustomText(
                                                  isPass: false,
                                                  hintText:
                                                      'Mpesa Payment Name',
                                                  textInputType:
                                                      TextInputType.name,
                                                  textController:
                                                      MpesaNameController,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter Mpesa Payment Name';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(height: 10),
                                                CustomText(
                                                  isPass: false,
                                                  hintText:
                                                      'Mpesa payment Phone Number',
                                                  textInputType:
                                                      TextInputType.number,
                                                  textController:
                                                      MpesaCodeController,
                                                  validator: (value) {
                                                    if (!phoneRegex
                                                        .hasMatch(value)) {
                                                      return 'Please enter a valid 10-digit phone number';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(height: 10),
                                                CustomText(
                                                  isPass: false,
                                                  hintText:
                                                      'Mpesa Transaction Code',
                                                  textInputType:
                                                      TextInputType.text,
                                                  textController:
                                                      MpesaNumberController,
                                                  validator: (value) {
                                                    if (!mpesaCodeRegex
                                                        .hasMatch(value)) {
                                                      return 'Please enter valid Mpesa Transaction Code';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(height: 10),
                                                CustomText(
                                                  isPass: false,
                                                  hintText: 'Contact Name',
                                                  textInputType:
                                                      TextInputType.name,
                                                  textController:
                                                      ContactNameController,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter Contact Name';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(height: 10),
                                                CustomText(
                                                  isPass: false,
                                                  hintText:
                                                      'Contact Phone Number',
                                                  textInputType:
                                                      TextInputType.number,
                                                  textController:
                                                      ContactPhoneController,
                                                  validator: (value) {
                                                    if (!phoneRegex
                                                        .hasMatch(value)) {
                                                      return 'Please enter a valid 10-digit phone number';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  // Display Cash specific text fields if the payment method is Cash
                                  if (controller.paymentMethod.value ==
                                      'Cash') ...[
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: ContactNameController,
                                      decoration: const InputDecoration(
                                          labelText: 'Contact Name'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Contact Name';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: ContactPhoneController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: 'Contact Phone Number'),
                                      validator: (value) {
                                        if (!phoneRegex.hasMatch(value!)) {
                                          return 'Please enter a valid Contact Phone Number';
                                        }
                                        return null;
                                      },
                                    )
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (!_showPaymentMethod) {
                              _showPaymentMethod =
                                  true; // Show the payment method widget when pressed
                            } else {
                              // Validate the form when Checkout is pressed
                              if (_formKey.currentState!.validate()) {
                                // Proceed with checkout only if the form is valid
                                final Orders order = Orders(
                                  contactname: ContactNameController.text,
                                  contactphone: ContactPhoneController.text,
                                  total: controller.total,
                                  mpesaname: MpesaNameController.text,
                                  mpesnumber: MpesaCodeController.text,
                                  mpesacode: MpesaNumberController.text,
                                  orderlist:
                                      controller.products.entries.map((entry) {
                                    final product = entry.key;
                                    final quantity = entry.value;
                                    final productJson = product.toJson();
                                    productJson['quantity'] = quantity;
                                    return productJson;
                                  }).toList(),
                                );

                                controller
                                    .postOrderToFirestore(order)
                                    .whenComplete(() {
                                  _confirmationDialog(
                                      ContactNameController.text);
                                });
                              }
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              _showPaymentMethod ? "Checkout" : "Proceed",
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

void _confirmationDialog(String contactName) {
  final CartController controller = Get.find();

  final thankYouNote = ThankYouNotes.getRandomThankYouNote();

  Get.defaultDialog(
    title: '$contactName, we appreciate',
    actions: [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text("Cancel"),
      ),
    ],
    backgroundColor: const Color(0xff14c9cf).withOpacity(0.5),
    titleStyle: const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image.asset('assets/images/goodtimes.png',
         width: 100,
                  height: 100,)),
        Text(
          thankYouNote,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 15,
          ),
        ),
        
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
                image: NetworkImage(
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
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
