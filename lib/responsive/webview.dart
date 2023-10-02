import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/Styles/color.dart';

import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:oxy_boot/View/CAtegoryPages/Shoes.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Controller/CartController.dart';
import '../View/Menu/card_screen.dart';
import 'package:oxy_boot/responsive/mobile.dart';

import '../Styles/font_styles.dart';
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
                SizedBox(
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
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: TextFormField(
                    cursorColor: customBlue,
                    cursorWidth: 2.5,
                    style: textStyle1,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: "Search Product,Cartegory",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset("assets/icons/search_ic.png"),
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
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Bounce(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
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
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ]),
          ]),
      body: Stack(
        children: [
          Center(
            child: Container(
              color: bgWhite,
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ShoePagee(
                gridview: true,
                wsize: MediaQuery.of(context).size.width * 0.8,
                name: name,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Stack(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Uri wa = Uri.parse('https://wa.me/+254713773296');
                      wa;
                      launchUrl(wa);
                    },
                    child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          'assets/images/whatsapp.png',
                          fit: BoxFit.fill,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
