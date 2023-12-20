import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:oxy_boot/Widgets/RowCart.dart';

import '../../Controller/CartController.dart';
import '../../Controller/Deliverydetails.dart';
import '../../DataModel/Deliverydetails.dart';
import '../../Styles/color.dart';
import '../../constraints/CustomText.dart';
import '../../responsive/mobile.dart';
import '../../responsive/response.dart';
import '../../responsive/webview.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<FormState> _formKeyy = GlobalKey<FormState>();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController deliveryController = TextEditingController();
  final detaildelivery = Get.put(DeliveryDetailsController());
  String selectedCounty = '';
  List<String> counties = [
    'Nairobi',
    'Baringo',
    'Bomet',
    'Bungoma',
    'Busia',
    'Elgeyo-Marakwet',
    'Embu',
    'Garissa',
    'Homa Bay',
    'Isiolo',
    'Kajiado',
    'Kakamega',
    'Kericho',
    'Kiambu',
    'Kilifi',
    'Kirinyaga',
    'Kisii',
    'Kitui',
    'Kwale',
    'Laikipia',
    'Lamu',
    'Machakos',
    'Makueni',
    'Mandera',
    'Meru',
    'Migori',
    'Marsabit',
    'Nandi',
    'Narok',
    'Nyamira',
    'Nyandarua',
    'Nyeri',
    'Samburu',
    'Siaya',
    'Taita-Taveta',
    'Tana River',
    'Tharaka-Nithi',
    'Trans Nzoia',
    'Turkana',
    'Uasin Gishu',
    'Vihiga',
    'Wajir',
    'West Pokot',
  ];

  @override
  Widget build(BuildContext context) {
    const int webScreenSize = 700;
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
                const SizedBox(
                  width: 50,
                ),
                const Text(
                  'Cart',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        // Return your deliveryform as a dialog
                        return Deliverydetails(context);
                      },
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: bgWhite,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Icon(Icons.delivery_dining),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CartProducts(),
          ),
          const CartTotal(),
          const SizedBox(
            height: 20,
          )
        ]));
  }

  Widget Deliverydetails(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: kIsWeb ? 800 : 400,
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(46.0),
            child: Form(
              key: _formKeyy,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: streetController,
                      decoration:
                          const InputDecoration(labelText: 'Street Address'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Street address is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    DropdownButtonFormField(
                      items: counties.map((county) {
                        return DropdownMenuItem(
                          value: county,
                          child: Text(county),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedCounty = value.toString();
                      },
                      decoration: const InputDecoration(labelText: 'County'),
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'County is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: townController,
                      decoration: const InputDecoration(labelText: 'Town'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Town is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: deliveryController,
                      maxLines: 5,
                      maxLength: 200,
                      decoration: const InputDecoration(
                        labelText: 'Delivery Details (Optional)',
                        hintText: 'Additional information about the delivery',
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKeyy.currentState!.validate()) {
                              final details = DeliveryDetails(
                                street: streetController.text,
                                deliverDetails: deliveryController.text,
                                town: townController.text,
                                county: selectedCounty,
                              );

                              // Add the details to the GetX controller
                              Get.find<CartController>()
                                  .addDeliveryDetails(details);

                              Navigator.pop(context); // Close the dialog
                            }
                          },
                          child: const Text('Submit'),
                        ),
                        Container(
                          color: Colors.red,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: const Text('Back')),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget paymentmethod(GlobalKey<FormState> formKey) {
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
                    Image.asset(
                      'images/mpesagoodtimes.PNG',
                      fit: BoxFit.contain,
                    ),
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
                      color: const Color.fromARGB(255, 36, 107, 148),
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
                            child: Image.asset(
                              'images/mpesagoodtimes.PNG',
                              fit: BoxFit.contain,
                            ),
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
                decoration: const InputDecoration(labelText: 'Contact Name'),
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
                decoration:
                    const InputDecoration(labelText: 'Contact Phone Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Contact Phone Number';
                  }
                  return null;
                },
              )
            ],
          ],
        ),
      ],
    ),
  );
}
