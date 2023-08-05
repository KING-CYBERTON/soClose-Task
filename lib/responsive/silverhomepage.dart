import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/View/CAtegoryPages/newarrivals.dart';
import 'package:oxy_boot/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:oxy_boot/Styles/color.dart';
import 'package:oxy_boot/responsive/mobile.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:oxy_boot/responsive/response.dart';
import 'package:oxy_boot/responsive/webview.dart';


class Sliverhomepage extends StatefulWidget {
  const Sliverhomepage({super.key});

  @override
  State<Sliverhomepage> createState() => _SliverhomepageState();
}

class _SliverhomepageState extends State<Sliverhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
              backgroundColor: Colors.lightBlueAccent[200],
          titleSpacing: 0.0,
          centerTitle: true,
          expandedHeight: 250.2,
        
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          flexibleSpace:
          FlexibleSpaceBar(
            title: Bounce(
                  onPressed: () =>  MaterialPageRoute(
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
                
          ) ,
        
          leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                
                Bounce(
                  onPressed: () =>  MaterialPageRoute(
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
            SizedBox(
              width: 20,
            ),
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
                ),
              ),
            ),
            SizedBox(
              width: 5,
           
          )
        ],
      ),
                SliverToBoxAdapter(
            child: Container(
              color: Colors.tealAccent,
              alignment: Alignment.center,
              height: 200,
              child: const Text('This is Container'),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.amberAccent,
              alignment: Alignment.center,
              height: 200,
              child: const Text('This is Container'),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100.0,
                    child: Card(
                      color: Colors.cyan[100 * (index % 9)],
                      child: Text('Item $index'),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );})),
    ])
    );
  }
}