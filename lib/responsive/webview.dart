import 'package:flutter/material.dart';
import 'package:oxy_boot/Styles/color.dart';
import 'package:oxy_boot/View/home_page.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../Styles/font_styles.dart';

// ignore: camel_case_types
class weblcreenlayout extends StatefulWidget {
  const weblcreenlayout({super.key});

  @override
  State<weblcreenlayout> createState() => _weblcreenlayoutState();
}

// ignore: camel_case_types
class _weblcreenlayoutState extends State<weblcreenlayout> {
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
        title:
         Image.asset(
                      "assets/images/Glogobig.png",
                     
                    ),
        
        leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 5,
              ),
              Bounce(
                  onPressed: () => ZoomDrawer.of(context)!.toggle(),
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    "assets/icons/menu_ic.png",
                    width: 44,
                    height: 44,
                  ),
                ),
              
             
            ]),
            actions: [
               Row(
          children: [
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
            SizedBox(width: 20,),
             Bounce(
              onPressed: () {},
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
              ),),
               SizedBox(
                width: 5,
              ),
            ]),
            


            ],
      ),
      body: Center(
        child: Container(
          color: bgWhite,
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.8,
          child: const HomePage(),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
