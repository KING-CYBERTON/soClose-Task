import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/Styles/font_styles.dart';
import 'package:oxy_boot/View/CAtegoryPages/Categorycards.dart';

import 'package:oxy_boot/View/CAtegoryPages/newarrivals.dart';
import 'package:oxy_boot/View/Menu/card_screen.dart';
import 'package:photo_view/photo_view.dart';

import '../Controller/productController.dart';
import '../DataModel/Product.dart';
import '../Styles/color.dart';
import '../Widgets/brands.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navigationIndex = 0;
  final productController = Get.put(ProductController());

  setBottomBarIndex(index) {
    setState(() {
      navigationIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    late int index = 0;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48.0,
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Brands(
                      currentIndex: navigationIndex,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Arrivals",
                        style: textStyle4,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewArrivals(),
                            ),
                          );
                        },
                        child: Text(
                          "See all",
                          style: textStyle5,
                        ),
                      )
                    ],
                  ),
                  Obx(
                    () => Column(
                      children: [
                        for (int index = 0;
                            index < productController.products.length;
                            index++)
                          ProductCard(
                              product: productController.products[index]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bgWhite
          .withOpacity(0.5), // Set the background color with transparency
      content: Container(
        // Add your content here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Add your content widgets here
            const Text(
              'About Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Goodtimes Trendz',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Get free Gift for each item purchased',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Delivery serives available',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 10),
            Container(
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
              child: Column(
                children: [
                  const Text(
                    'Contact Information',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/phone-call.png', // Replace with the path to your Facebook logo
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const Text(
                        '+254 713 773296',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () {
                          String url =
                              'https://l.wl.co/l?u=https%3A%2F%2Fwww.instagram.com%2Finvites%2Fcontact%2F%3Fi%3D10wbpe8vipebk%26utm_content%3Dox84ym';
                          url;
                        },
                        icon: Image.asset(
                          'assets/images/instagram.png', // Replace with the path to your Facebook logo
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () {
                          String loc = 'https://goo.gl/maps/pB7JXAAoxV37yKm28';
                          loc;
                        },
                        icon: Image.asset(
                          'assets/images/google-maps.png', // Replace with the path to your Facebook logo
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () {
                          String wa = 'https://wa.me/+254713773296';
                          wa;
                        },
                        icon: Image.asset(
                          'assets/images/whatsapp.png', // Replace with the path to your Facebook logo
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
