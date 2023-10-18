// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ThemeController extends GetxController {
//   RxBool darkMode = false.obs;

//   ThemeData get theme => darkMode.value ? darkTheme : lightTheme;

//   ThemeData lightTheme = ThemeData(
//     primaryBackgroundColor: Colors.grey[200],
//     accentColor: Colors.blue,
//     // Add more theme properties as needed...
//   );

//   ThemeData darkTheme = ThemeData(
//     primaryBackgroundColor: Colors.black,
//     accentColor: Colors.blue,
//     // Add more theme properties as needed...
//   );

//   void toggleTheme() {
//     darkMode.toggle();
//     update(); // Notify listeners that the theme has changed
//   }
// }

// class HomeController extends GetxController {
//   RxInt pageNo = 0.obs;
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final ThemeController themeController = Get.put(ThemeController());
//   final HomeController homeController = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'My App',
//       theme: themeController.theme,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final ThemeController themeController = Get.find();
//   final HomeController homeController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My App'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               themeController.toggleTheme();
//             },
//             child: Text('Toggle Theme'),
//           ),
//           SizedBox(height: 20),
//           Text('Current Page: ${homeController.pageNo}'),
//           ElevatedButton(
//             onPressed: () {
//               homeController.pageNo++;
//             },
//             child: Text('Next Page'),
//           ),
//         ],
//       ),
//     );
//   }
// }
