import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/Controller/CartController.dart';
import 'package:oxy_boot/View/CAtegoryPages/newarrivals.dart';
import 'package:oxy_boot/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:oxy_boot/Styles/color.dart';

import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:oxy_boot/responsive/response.dart';
import 'package:oxy_boot/responsive/webview.dart';
import '../Controller/productController.dart';
import '../Styles/font_styles.dart';
import '../Styles/color.dart';
import '../View/CAtegoryPages/Categorycards.dart';
import '../View/CAtegoryPages/favourite_screen.dart';
import '../View/CAtegoryPages/profile.dart';
import '../View/Menu/card_screen.dart';
import 'silverhomepage.dart';

// ignore: camel_case_types
class mobilescreenlayout extends StatefulWidget {
  const mobilescreenlayout({super.key});

  @override
  State<mobilescreenlayout> createState() => _mobilescreenlayoutState();
}

// ignore: camel_case_types
class _mobilescreenlayoutState extends State<mobilescreenlayout> {
  late String name = '';
  final cartController = Get.put(CartController());
  bool gridview = true;
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
          title: IconButton(
            color: Colors.white,
            icon:
                gridview ? const Icon(Icons.list) : const Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                gridview = !gridview;
              });
            },
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
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
              width: 5,
            ),
          ]),
      body: Center(
        child: Container(
          color: bgWhite,
          height: double.infinity,
          width: double.infinity,
          child:
          //CustomScrollViewExample(name: name,)
           homepage(
            gridview: gridview,
            wsize: MediaQuery.of(context).size.width * 0.8,
            name: name,
          ),
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
                        builder: (context) => const ResponsiveLayout(
                            mobileScreenLayout: mobilescreenlayout(),
                            webScreenLayout: weblcreenlayout()),
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
                InkWell(
                  onTap: () {
                    navigationIndex = 1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavouriteScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/favourite_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 1 ? customBlue : customGrey,
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
                InkWell(
                  onTap: () {
                    navigationIndex = 3;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/user_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 3 ? customBlue : customGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
       resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: SizedBox(
          width: 56.0,
          height: 56.0,
          child: Stack(
            children:[ FloatingActionButton(
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
            Positioned(
                      right: 0,
                      top: 3,
                     
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Center(
                            child: Text("",
                             // CartController.instance.totalProducts.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.0, // Adjust the font size as needed
                              ),
                            ),
                          ),
                        ),
                      
                    )
          ]),
        ),
      ),
    );
  }
}

class homepage extends StatefulWidget {
  final bool gridview;
  final double wsize;
  final String name;
  const homepage(
      {super.key,
      required this.gridview,
      required this.wsize,
      required this.name});
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  final productController = Get.put(ProductController());
  int _crossAxisCount = 2; // Initial number of grids

// Current view mode
  int _currentNumber = 0;
  final List<String> letters = ['A', 'B', 'C', 'D', 'E', 'F'];

  late AnimationController _animationController;
  double _startPositionX = 0.0;
  double _endPositionX = 0.0;

  @override
  void initState() {
    super.initState();
     _currentNumber = 2;
    Future.delayed(Duration.zero, () {
      _updateNumber(2); // Update _currentNumber after the widget is built
    });
    _endPositionX = widget.wsize;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateNumber(int number) {
    setState(() {
      _currentNumber = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isGridView = widget.gridview;
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of grids based on screen width
    if (screenWidth >= 600) {
      _crossAxisCount = 4;
    } else if (screenWidth >= 1200) {
      _crossAxisCount = 6;
    } else {
      _crossAxisCount = 2;
    }

   
   
      return Column(
        children: [
          SizedBox(height: 16),
       
          Expanded(
            child: Column(
              children: [
               
                if (_currentNumber == 2) ...shoesList(),
                

                // Add similar conditions for other categories/lists if needed
              ],
            ),
          ),
        ],
      );
    }
  


  List<Widget> shoesList() {
    return [
      ProductList(
        productList: productController.shoes,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> tshirtList() {
    return [
      ProductList(
        productList: productController.tshirts,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> JacketList() {
    return [
      ProductList(
        productList: productController.jackets,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount,name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> accesorieList() {
    return [
      ProductList(
        productList: productController.accesories,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> NewArrivals() {
    return [
      ProductList(
        productList: productController.products,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> combolist() {
    return [
      ProductList(
        productList: productController.combo,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> trouserlist() {
    return [
      ProductList(
        productList: productController.trousers,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }
}


// class homepage extends StatefulWidget {
//   final bool gridview;
//   final double wsize;
//   final String name;
//   const homepage(
//       {super.key,
//       required this.gridview,
//       required this.wsize,
//       required this.name});
//   @override
//   _homepageState createState() => _homepageState();
// }

// class _homepageState extends State<homepage>
//     with SingleTickerProviderStateMixin {
//   final productController = Get.put(ProductController());
//   int _crossAxisCount = 2; // Initial number of grids

// // Current view mode
//   int _currentNumber = 0;
//   final List<String> letters = ['A', 'B', 'C', 'D', 'E', 'F'];

//   late AnimationController _animationController;
//   double _startPositionX = 0.0;
//   double _endPositionX = 0.0;

//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(Duration.zero, () {
//       _updateNumber(0); // Update _currentNumber after the widget is built
//     });
//     _endPositionX = widget.wsize;
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 6),
//     )..repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _updateNumber(int number) {
//     setState(() {
//       _currentNumber = number;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isGridView = widget.gridview;
//     final screenWidth = MediaQuery.of(context).size.width;

//     // Determine the number of grids based on screen width
//     if (screenWidth >= 600) {
//       _crossAxisCount = 4;
//     } else if (screenWidth >= 1200) {
//       _crossAxisCount = 6;
//     } else {
//       _crossAxisCount = 2;
//     }

//     if (_currentNumber == 0) {
//       return Column(
//         children: [
//           SizedBox(height: 16),
//           Container(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   buildNumberIcon('Shoes', "sport-shoe", 1),
//                   buildNumberIcon('Tshirt', "tshirt", 2),
//                   buildNumberIcon('Trousers', "trouser", 3),
//                   buildNumberIcon('Jackets', "jacket", 4),
//                   buildNumberIcon('accessories', "belt", 5),
//                   buildNumberIcon('combo outfit', "outfit", 6)
//                 ],
//               ),
//             ),
//           ),

//           SizedBox(height: 16),
//           Row(
//             children: [
//               Container(
//                 height: 40.0,
//                 width: _endPositionX,
//                 child: AnimatedBuilder(
//                   animation: _animationController,
//                   builder: (context, child) {
//                     double currentPositionX = Tween<double>(
//                       begin: _startPositionX,
//                       end: _endPositionX,
//                     )
//                         .animate(
//                           CurvedAnimation(
//                             parent: _animationController,
//                             curve: Curves.easeInOut,
//                           ),
//                         )
//                         .value;

//                     return Stack(
//                       children: [
//                         Positioned(
//                           left: currentPositionX,
//                           top: 0.0,
//                           child: Text(
//                             'New Arrival!!!',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red[700],
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),

//           ProductList(
//             productList: productController.products,
//             isGridView: isGridView,
//             screenWidth: _crossAxisCount, name: widget.name,
//           ),

//           // Add similar conditions for other categories/lists if needed
//         ],
//       );
//     } else {
//       return Column(
//         children: [
//           SizedBox(height: 16),
//           Container(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   buildNumberIcon('Shoes', "sport-shoe", 1),
//                   buildNumberIcon('Tshirt', "tshirt", 2),
//                   buildNumberIcon('Trousers', "trouser", 3),
//                   buildNumberIcon('Jackets', "jacket", 4),
//                   buildNumberIcon('accessories', "belt", 5),
//                   buildNumberIcon('combo outfit', "outfit", 6)
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           Expanded(
//             child: Column(
//               children: [
//                 if (_currentNumber == 0) ...NewArrivals(),
//                 if (_currentNumber == 1) ...shoesList(),
//                 if (_currentNumber == 2) ...tshirtList(),
//                 if (_currentNumber == 3) ...trouserlist(),
//                 if (_currentNumber == 4) ...JacketList(),
//                 if (_currentNumber == 5) ...accesorieList(),
//                 if (_currentNumber == 6) ...combolist(),

//                 // Add similar conditions for other categories/lists if needed
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//   }

//   Widget buildNumberIcon(String lable, String iconName, int number) {
//     return Stack(children: [
//       Visibility(
//         visible: _currentNumber == number,
//         child: AnimatedContainer(
//           height: 44.0,
//           alignment: Alignment.centerRight,
//           decoration: BoxDecoration(
//               color: customBlue, borderRadius: BorderRadius.circular(100.0)),
//           duration: const Duration(milliseconds: 1000),
//           child: Padding(
//             padding: const EdgeInsets.only(left: 45, right: 10),
//             child: Text(
//               lable,
//               style: textStyle3,
//             ),
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: GestureDetector(
//           onTap: () => _updateNumber(number),
//           child: Image.asset(
//             "assets/icons/$iconName.png",
//             width: _currentNumber == number ? 34.0 : 44.0,
//             height: _currentNumber == number ? 34.0 : 44.0,
//           ),
//         ),
//       ),
//     ]);
//   }

//   List<Widget> shoesList() {
//     return [
//       ProductList(
//         productList: productController.shoes,
//         isGridView:
//             widget.gridview, // Set to true for grid view, false for list view
//         screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
//       ),
//     ];
//   }

//   List<Widget> tshirtList() {
//     return [
//       ProductList(
//         productList: productController.tshirts,
//         isGridView:
//             widget.gridview, // Set to true for grid view, false for list view
//         screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
//       ),
//     ];
//   }

//   List<Widget> JacketList() {
//     return [
//       ProductList(
//         productList: productController.jackets,
//         isGridView:
//             widget.gridview, // Set to true for grid view, false for list view
//         screenWidth: _crossAxisCount,name: widget.name, // You can adjust this as needed
//       ),
//     ];
//   }

//   List<Widget> accesorieList() {
//     return [
//       ProductList(
//         productList: productController.accesories,
//         isGridView:
//             widget.gridview, // Set to true for grid view, false for list view
//         screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
//       ),
//     ];
//   }

//   List<Widget> NewArrivals() {
//     return [
//       ProductList(
//         productList: productController.products,
//         isGridView:
//             widget.gridview, // Set to true for grid view, false for list view
//         screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
//       ),
//     ];
//   }

//   List<Widget> combolist() {
//     return [
//       ProductList(
//         productList: productController.combo,
//         isGridView:
//             widget.gridview, // Set to true for grid view, false for list view
//         screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
//       ),
//     ];
//   }

//   List<Widget> trouserlist() {
//     return [
//       ProductList(
//         productList: productController.trousers,
//         isGridView:
//             widget.gridview, // Set to true for grid view, false for list view
//         screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
//       ),
//     ];
//   }
// }
