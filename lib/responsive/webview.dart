import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/Styles/color.dart';

import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:oxy_boot/View/CAtegoryPages/profile.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Controller/CartController.dart';
import '../View/CAtegoryPages/favourite_screen.dart';
import '../View/Menu/card_screen.dart';
import 'package:oxy_boot/responsive/mobile.dart';

import '../Styles/font_styles.dart';
import '../View/home_page.dart';
import '../View/usersignin/Login.dart';
import 'response.dart';

// ignore: camel_case_types
class weblcreenlayout extends StatefulWidget {
  const weblcreenlayout({super.key});

  @override
  State<weblcreenlayout> createState() => _weblcreenlayoutState();
}

Future<void> _launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

Color textColor = customGrey;

int navigationIndex = 0;
bool isSearchFocused = false;
bool isHovered = false;
bool isPressed = false;

// ignore: camel_case_types
class _weblcreenlayoutState extends State<weblcreenlayout> {
  String name = '';
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent[200],
          titleSpacing: 0.0,
          centerTitle: true,
          toolbarHeight: 65.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Bounce(
                  onPressed: () => MaterialPageRoute(
                    builder: (context) => const ResponsiveLayout(
                        mobileScreenLayout: mobilescreenlayout(),
                        webScreenLayout: weblcreenlayout()),
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    "assets/images/goodtimes.png",
                    width: 44,
                    height: 44,
                  ),
                ),
              ]),
          actions: [
            Row(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Store location",
                    style: textStyle1,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/location_ic.png",
                        width: 14,
                        height: 14.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Mfangano Street,\nSunbeam shopping complex ",
                        style: textStyle2,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: isSearchFocused
                      ? MediaQuery.of(context).size.width * 0.2
                      : 20,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        isSearchFocused = hasFocus;
                      });
                    },
                    child: isSearchFocused
                        ? TextFormField(
                            cursorColor:
                                Colors.red, // Change cursor color to red
                            cursorWidth: 2.5,
                            style: textStyle1,
                            decoration: InputDecoration(
                              fillColor: isSearchFocused
                                  ? Colors.white
                                  : Colors.transparent,
                              filled: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: isSearchFocused
                                  ? ""
                                  : "Search Product,Category",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: isSearchFocused
                                    ? const Icon(Icons.search)
                                    : Image.asset("assets/icons/search_ic.png"),
                              ),
                              hintStyle: textStyle1,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                setState(() {
                                  isSearchFocused = true;
                                });
                              });
                            },
                            child: Image.asset("assets/icons/search_ic.png")),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          isHovered = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          isHovered = false;
                        });
                      },
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            navigationIndex = 1;
                          });
                         
                        },
                        child: Text(
                          'Favourite',
                          style: TextStyle(
                            color: isPressed
                                ? Colors.white
                                : (isHovered ? Colors.red : customGrey),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          isHovered = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          isHovered = false;
                        });
                      },
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AboutUsDialog();
                            },
                          );
                        },
                        child: Text(
                          'About',
                          style: TextStyle(
                            color: isPressed
                                ? Colors.white
                                : (isHovered ? Colors.red : customGrey),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          isHovered = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          isHovered = false;
                        });
                      },
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            navigationIndex = 2;
                          });
                         
                        },
                        child: Text(
                          'Account',
                          style: TextStyle(
                            color: isPressed
                                ? Colors.white
                                : (isHovered ? Colors.red : customGrey),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Bounce(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()),
                        );
                      },
                      duration: const Duration(milliseconds: 500),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/icons/cart_ic.png",
                            width: 44.0,
                            height: 44.0,
                          ),
                          Positioned(
                            right: 0,
                            top: 5,
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Center(
                                child: Obx(() => Text(
                                      CartController
                                          .instance.totalProductsInCart
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
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ]),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: bgWhite,
                  child: IndexedStack(
                    index: navigationIndex,
                    children: [
                      // Screen for navigationIndex 0 (Home)
                      homepage(
                        gridview: true,
                        wsize: MediaQuery.of(context).size.width * 0.8,
                        name: name,
                        navigationindex: navigationIndex,
                      ),
                      // Screen for navigationIndex 1 (Favorites)
                      const FavouriteScreen(),
                      // Screen for navigationIndex 2 (About Us)

                      // Screen for navigationIndex 3 (Login)
                      LoginInPage(navigationindex: navigationIndex,),
                      // Screen for navigationIndex 4 (Cart)
                      const CartScreen(),
                      // Add more screens as needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
