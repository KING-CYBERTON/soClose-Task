import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:oxy_boot/Widgets/RowCart.dart';

import '../../Controller/CartController.dart';
import '../../Styles/color.dart';
import '../../constraints/CustomText.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     const int webScreenSize =700;
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/icons/back_ic.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Cart',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: CartProducts(),
          ),
          CartTotal(),
          SizedBox(
            height: 20,
          )
        ]));
  }
}

Widget  paymentmethod(GlobalKey<FormState> formKey) {
  final CartController controller = Get.find();
  final MpesaNameController = TextEditingController();
  final MpesaCodeController = TextEditingController();
  final MpesaNumberController = TextEditingController();
  final ContactNameController = TextEditingController();
  final ContactPhoneController = TextEditingController();

  return SingleChildScrollView(
    
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
                      groupValue: controller.paymentMethod.value,
                      onChanged: (value) {
                        controller.paymentMethod.value = value.toString();
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
                    Image.asset('images/mpesagoodtimes.PNG',
                fit: BoxFit.contain,),
                    Radio(
                      value: "Cash",
                      groupValue: controller.paymentMethod.value,
                      onChanged: (value) {
                        controller.paymentMethod.value = value.toString();
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
            if (controller.paymentMethod.value == 'M-Pesa') ...[
              
              SizedBox(
                width: 300,
                child: Container(
                  decoration: BoxDecoration(
                    color: bgWhite,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        offset: Offset(1, 1),
                        color: Color.fromARGB(255, 31, 126, 189),
                      )
                    ],
                    border: Border.all(
                      color: Color.fromARGB(255, 36, 107, 148),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                height: 40,
                child: Image.asset('images/mpesagoodtimes.PNG',
                fit: BoxFit.contain,),
              ),
                          const SizedBox(height: 10),

                          CustomText(
                            isPass: false,
                            hintText: 'Mpesa Payment Name',
                            textInputType: TextInputType.name,
                            textController: MpesaNameController,
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
                            hintText: 'Mpesapayment Phone Number',
                            textInputType: TextInputType.phone,
                            textController: MpesaCodeController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Mpesa Phone Number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            isPass: false,
                            hintText: 'Mpesa Transaction Code',
                            textInputType: TextInputType.text,
                            textController: MpesaNumberController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Mpesa Transaction Code';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            isPass: false,
                            hintText: 'Contact Name',
                            textInputType: TextInputType.name,
                            textController: ContactNameController,
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
                            hintText: 'Contact Phone Number',
                            textInputType: TextInputType.phone,
                            textController: ContactPhoneController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Contact Phone Number';
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
            if (controller.paymentMethod.value == 'Cash') ...[
              const SizedBox(height: 10),
              TextFormField(
                  controller: ContactNameController,
                  decoration: InputDecoration(labelText: 'Contact Name'),
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
                  decoration: InputDecoration(labelText: 'Contact Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Contact Phone Number';
                    }
                    return null;
                  },)
            ],
          ],
        ),
      ],
    ),
  );
}
