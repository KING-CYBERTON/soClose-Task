import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/View/CAtegoryPages/favourite_screen.dart';
import 'package:oxy_boot/View/usersignin/SignUp.dart';
import 'package:oxy_boot/View/usersignin/userscreen.dart';

import '../../Controller/AuthController.dart';
import '../../Controller/FstoreConroller.dart';
import '../../DataModel/UserModel.dart';
import '../../Styles/color.dart';
import '../../constraints/CustomText.dart';

// import 'package:panda_period/auth/GetAuth.dart';

class LoginInPage extends StatefulWidget {
  final int navigationindex;
  const LoginInPage({super.key, required this.navigationindex});

  @override
  State<LoginInPage> createState() => _LoginInPageState();
}

class _LoginInPageState extends State<LoginInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final email = FirebaseAuth.instance.currentUser?.email;
  final user = FirebaseAuth.instance.currentUser!;
  final GetAuth contoller = Get.put(GetAuth());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final streetController = TextEditingController();
  final countyController = TextEditingController();
  final townController = TextEditingController();
  final deliveryController = TextEditingController();
  late Future<UserData> _userDataFuture;
  final repo = Get.put(FireRepo());

  @override
  void initState() {
    super.initState();
    _userDataFuture = FireRepo.instance.getUserData(email.toString());
  }

  int currentnum = 2;
  int num = 2;
  // Form fields
  String streetAddress = '';

  String town = '';
  String deliveryDetails = '';

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
    return Obx(() => contoller.num.value == 3
        ? num == 2
            ? homeprofile(num)
            : num == 3
                ? FavouriteScreen()
                : deliveryform()
        : currentnum == 2
            ? Scaffold(
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                    child: Center(
                  child: Container(
                    width: 350,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                      padding: const EdgeInsets.all(9.0),
                      child: Center(
                        child: Column(children: [
                          const Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 9, 17, 88),
                            ),
                          ),
                          const SizedBox(height: 40),
                          // ignore: prefer_const_constructors
                          CustomText(
                            hintText: 'Enter your email',
                            textInputType: TextInputType.emailAddress,
                            isPass: false,
                            textController: emailController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Contact Phone Number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          // ignore: prefer_const_constructors
                          CustomText(
                            hintText: 'Enter your password',
                            textInputType: TextInputType.emailAddress,
                            isPass: true,
                            textController: passwordController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Contact Phone Number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          const SizedBox(
                            width: 90,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              GetAuth.instance.logInUser(
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white10,
                              shadowColor:
                                  const Color.fromARGB(26, 81, 160, 180),
                            ),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 13, 1, 39),
                              ),
                            ),
                          ),

                          const SizedBox(width: 60),
                          const SizedBox(height: 20),
                          Wrap(
                            children: [
                              RichText(
                                  text: TextSpan(
                                text: "Don't have an account?",
                                style: const TextStyle(
                                  color: Color.fromARGB(221, 51, 48, 48),
                                ),
                                children: [
                                  TextSpan(
                                      text: ' SignUp',
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 22, 72, 165),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          setState(() {
                                            currentnum = 3;
                                          });
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) => SignUpPage()),
                                          // );
                                          //  Get.to(const UserScreen());
                                        })
                                ],
                              )),
                            ],
                          ),
                          Wrap(
                            children: [
                              RichText(
                                  text: TextSpan(
                                text: "Forgotten password?",
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                                children: [
                                  TextSpan(
                                      text: 'RECOVER',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          GetAuth.instance.resetPassword(
                                              emailController.text.trim());
                                        })
                                ],
                              )),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ),
                )))
            : Scaffold(
                body: SafeArea(
                    child: Center(
                child: Container(
                  width: 350,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome sign up',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 8, 59),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // ignore: prefer_const_constructors
                        CustomText(
                          hintText: 'Enter your email',
                          textInputType: TextInputType.emailAddress,
                          isPass: false,
                          textController: emailController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter Contact Phone Number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // ignore: prefer_const_constructors
                        CustomText(
                          hintText: 'Enter your password',
                          textInputType: TextInputType.emailAddress,
                          isPass: true,
                          textController: passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter Contact Phone Number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              contoller.createUser(emailController.text.trim(),
                                  passwordController.text.trim());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white10,
                              shadowColor: Colors.grey,
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 6, 12, 88),
                              ),
                            )),

                        const SizedBox(height: 20),
                        RichText(
                            text: TextSpan(
                          text: 'Have an account?',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 7, 6, 6),
                          ),
                          children: [
                            TextSpan(
                                text: '  LogIn',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      currentnum = 2;
                                    });
                                    // Get.to(LoginInPage());
                                  })
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ))));
  }

  Widget Userprofilescreen() {
    late int navnumber = 0;
    return IndexedStack(
      index: navnumber,
      children: [
        homeprofile(navnumber),
        const FavouriteScreen(),
        deliveryform()
      ],
    );
  }

  Widget homeprofile(int nav) {
    return Container(
      color: bgWhite,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 40,
              color: bgWhite,
              child: const Center(
                child: Text(
                  'Account info',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          color: Color.fromARGB(255, 31, 126, 189),
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 38,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Email: ${email.toString()}',
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Bounce(
                    onPressed: () {
                      setState(() {
                        num = 3;
                      });
                    },
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(1, 1),
                            color: Color.fromARGB(255, 31, 126, 189),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.filter_vintage_outlined,
                            color: Colors.amberAccent,
                            size: 38,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Wishlist',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Bounce(
                    onPressed: () {
                      setState(() {
                        num = 4;
                        print(num);
                      });
                    },
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(1, 1),
                            color: Color.fromARGB(255, 31, 126, 189),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            size: 38,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Delivery Details',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Bounce(
                    onPressed: () {},
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(1, 1),
                            color: Color.fromARGB(255, 31, 126, 189),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list_alt,
                            size: 38,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Your orders',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Bounce(
              onPressed: () {
                GetAuth.instance.logOut();
              },
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.all(15),
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 20,
                      offset: Offset(1, 1),
                      color: Color.fromARGB(255, 31, 126, 189),
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.redAccent.shade200,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      size: 38,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget deliveryform() {
    String selectedCounty = '';
    return FutureBuilder<UserData>(
      future: _userDataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final userData = snapshot.data!;

          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,

              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(1, 1),
                    color: Colors.blue,
                  )
                ],
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(11),
              ),
              // color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(46.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Steet'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          width: 300,
                          child: TextFormField(
                            controller: streetController,
                            decoration:
                                InputDecoration(labelText: userData.street),
                            // initialValue:userData == true? userData.street:"",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Street address is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text('County'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          width: 300,
                          child: DropdownButtonFormField(
                            items: counties.map((county) {
                              return DropdownMenuItem(
                                value: county,
                                child: Text(county),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCounty = value.toString();
                              });
                            },

                            decoration:
                                InputDecoration(labelText: userData.county),
                            // InputDecoration(labelText: userData.county),
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return 'County is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text('Town'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          width: 300,
                          child: TextFormField(
                            controller: townController,
                            decoration: InputDecoration(
                                labelText: userData.town,
                                hintText: userData.town),
                            //initialValue: userData.town,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Town is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text('Addtional Details'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          width: 300,
                          child: TextFormField(
                            maxLines: 5,
                            maxLength: 200,
                            controller: deliveryController,
                            decoration: InputDecoration(
                              labelText: userData.deliverDetails,
                              hintText: userData.deliverDetails,
                            ),
                            // initialValue: userData.deliverDetails,
                          ),
                        ),
                        const SizedBox(height: 32.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) return;

                                final email =
                                    FirebaseAuth.instance.currentUser?.email;
                                final user = UserData(
                                    email: email,
                                    street: streetController.text.trim(),
                                    deliverDetails:
                                        deliveryController.text.trim(),
                                    town: townController.text.trim(),
                                    county: selectedCounty.trim());
                                repo.updateUser(email.toString(), user);
                              },
                              child: const Text('Update'),
                            ),
                            Container(
                              color: Colors.red,
                              child: ElevatedButton(
                                  onPressed: () {
                                    num = 2;
                                  },
                                  child: Text('Back')),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
          ;
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(46.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: streetController,
                          decoration: const InputDecoration(
                              labelText: 'Street Address'),
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
                            setState(() {
                              selectedCounty = value.toString();
                            });
                          },
                          // Remove the value property
                          decoration:
                              const InputDecoration(labelText: 'County'),
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
                          maxLines: 5,
                          maxLength: 200,
                          controller: deliveryController,
                          decoration: const InputDecoration(
                            labelText: 'Delivery Details (Optional)',
                            hintText:
                                'Additional information about the delivery',
                          ),
                        ),
                        const SizedBox(height: 32.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) return;

                                final email =
                                    FirebaseAuth.instance.currentUser?.email;
                                final user = UserData(
                                    email: email,
                                    street: streetController.text.trim(),
                                    deliverDetails:
                                        deliveryController.text.trim(),
                                    town: townController.text.trim(),
                                    county: selectedCounty.toString());

                                repo.createUser(user);
                              },
                              child: const Text('Submit'),
                            ),
                            Container(
                              color: Colors.red,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      num = 2;
                                    });
                                  },
                                  child: Text('Back')),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class editdelivery extends StatefulWidget {
  editdelivery({super.key});

  @override
  State<editdelivery> createState() => _editdeliveryState();
}

class _editdeliveryState extends State<editdelivery> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final email = FirebaseAuth.instance.currentUser?.email;

  final GetAuth contoller = Get.put(GetAuth());

  final streetController = TextEditingController();

  final countyController = TextEditingController();

  final townController = TextEditingController();

  final deliveryController = TextEditingController();

  final repo = Get.put(FireRepo());
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
  var selectedCounty = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(46.0),
          child: Form(
            key: _formKey,
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
                      setState(() {
                        selectedCounty = value.toString();
                      });
                    },
                    value: selectedCounty,
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
                    maxLines: 5,
                    maxLength: 200,
                    controller: deliveryController,
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
                          if (!_formKey.currentState!.validate()) return;

                          final email =
                              FirebaseAuth.instance.currentUser?.email;
                          final user = UserData(
                              email: email,
                              street: streetController.text.trim(),
                              deliverDetails: deliveryController.text.trim(),
                              town: townController.text.trim(),
                              county: countyController.text.trim());

                          repo.createUser(user);
                        },
                        child: const Text('Submit'),
                      ),
                      Container(
                        color: Colors.red,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Back')),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
