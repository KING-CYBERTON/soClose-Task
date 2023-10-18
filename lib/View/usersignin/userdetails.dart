// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../Controller/FirebaseService.dart';
// import '../../DataModel/UserModel.dart';
//  // Import your UserData model

// class UserProfileWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: GetBuilder<UserProfileController>(
//         init: UserProfileController(), // Initialize your controller
//         builder: (controller) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Street: ${controller.userData?.street ?? ''}'),
//                 Text('Town: ${controller.userData?.town ?? ''}'),
//                 Text('County: ${controller.userData?.county ?? ''}'),
//                 Text('Delivery Details: ${controller.userData?.deliverDetails ?? ''}'),
//                 Text('Email: ${controller.userData?.email ?? ''}'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class UserProfileController extends GetxController {
//   UserData? userData;
//     @override
//   void onInit() {
//     // Assuming you have a way to get the current user's ID
//     String currentUserId = 'your_user_id';

//     // Listen to the user stream and update the userData when changes occur
//     FirestoreDB().Users().where('id', isEqualTo: currentUserId).snapshots().listen((snapshot) {
//       if (snapshot.docs.isNotEmpty) {
//         userData = UserData.fromSnapshot(snapshot.docs.first);
//         update(); // Update the UI
//       }
//     });

//     super.onInit();
//   }

// }
