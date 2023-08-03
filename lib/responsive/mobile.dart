import 'package:flutter/material.dart';
import 'package:oxy_boot/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:oxy_boot/Styles/color.dart';
import 'package:oxy_boot/View/home_page.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:oxy_boot/responsive/response.dart';
import 'package:oxy_boot/responsive/webview.dart';
import '../Styles/font_styles.dart';
import '../Styles/color.dart';
import '../View/Menu/card_screen.dart';

// ignore: camel_case_types
class mobilescreenlayout extends StatefulWidget {
  const mobilescreenlayout({super.key});

  @override
  State<mobilescreenlayout> createState() => _mobilescreenlayoutState();
}

// ignore: camel_case_types
class _mobilescreenlayoutState extends State<mobilescreenlayout> {
   int navigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[200],
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 60.2,
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
            
              
            
            SizedBox(width: 20,),
             Center(
               child: Bounce(
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
             ),
               SizedBox(
                width: 5,
              ),
            ]
      ),

      
      body: Center(
        child: Container(
           color: bgWhite,
          height: double.infinity,
          width: double.infinity,
          child: const HomePage(),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bottomnav_bg.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    navigationIndex = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveLayout(mobileScreenLayout: mobilescreenlayout(), webScreenLayout: weblcreenlayout()),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/home_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 0 ? customBlue : customGrey,
                  ),
                ),
                const SizedBox(
                  width: 60.0,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AboutUsDialog();
                      },
                    );
                  },
                  child: Image.asset(
                    "assets/icons/location_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 2 ? customBlue : customGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
          resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: SizedBox(
          width: 56.0,
          height: 56.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            backgroundColor: customBlue,
            elevation: 10,
            child: Image.asset(
              "assets/icons/bag_ic.png",
              width: 20.0,
              height: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
